import os
from google.cloud import firestore
from flask import jsonify

# Initialize Firestore client
db = firestore.Client()


def exec_firestore(request):
    """Incrementally add a digit to the Firestore DB visitor count"""
    # Access the DB_NAME environment variable
    DB_NAME = os.environ.get('DB_NAME', 'default-db-name')

    try:
        doc_ref = db.collection(DB_NAME).document('visitor_count')

        # Read, increment, and update the visitor count
        doc = doc_ref.get()
        if doc.exists:
            current_count = doc.to_dict().get('counter', 0)
        else:
            current_count = 0
        new_count = current_count + 1
        doc_ref.set({'counter': new_count})
        # CORS
        headers = {'Access-Control-Allow-Origin': '*'}

        return jsonify({'visitorCount': new_count}), 200, headers
    except Exception as e:
        error_message = str(e)
    return (jsonify(
        {'error': f'Error writing document to Firestore: {error_message}'}),
        500
    )

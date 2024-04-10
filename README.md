# GCP - thumpzilla.dev - Back-End

![diagram](cloud-diagram.svg)

- Website: https://thumpzilla.dev

- Inspired by https://cloudresumechallenge.dev/docs/the-challenge/

## Description

The back-end utilizes GitHub for version control and Cloud Build for continuous integration and deployment (CI/CD). Terraform resources: a hosting bucket for static content, a serverless Cloud Function written in Python to manage visitor counts in a Firestore database.

## Technologies Used

- GitHub Repository
  - Version Control and CI/CD
  - Dev/Prod branches

- Terraform
  - Remote state file
  - Modules & environments

- Cloud Build
  - CI/CD
  - Cloud build triggers
   - Substitution variables

- Cloud Storage
  - Static site hosting

- Cloud Functions
  - Python
  - flake8 for linting

- Firestore
  - DB Store
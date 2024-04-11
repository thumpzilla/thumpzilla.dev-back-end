resource "google_firestore_database" "cloud_db" {
  name                = "(default)" # Use (default) for free tier
  project             = var.project_id
  location_id         = "northamerica-northeast2"
  type                = "FIRESTORE_NATIVE" 
}
resource "google_storage_bucket" "web_bucket" {
  name          = var.bucket_name
  project       = var.project_id
  location      = "northamerica-northeast2"
  force_destroy = true
  
  uniform_bucket_level_access = true
  
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
}

resource "google_storage_bucket_iam_binding" "web_bucket_public" {
  bucket  = google_storage_bucket.web_bucket.name
  role    = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}
resource "google_storage_bucket" "function_bucket" {
  name          = "${var.branch_name}-counter-function"
  project       = var.project_id
  location      = "northamerica-northeast2"
  force_destroy = true
}

data "archive_file" "function_source" {
  type        = "zip"
  source_dir  = "../../scripts/${var.branch_name}/"
  output_path = "./function-source.zip"
}

resource "google_storage_bucket_object" "source_code" {
  name   = "${data.archive_file.function_source.output_md5}.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "./function-source.zip"
  depends_on = [
    google_storage_bucket.function_bucket,
    data.archive_file.function_source
  ]
}

resource "google_cloudfunctions2_function" "counter" {
  name        = "${var.branch_name}-counter-function"
  project     = var.project_id
  location    = "northamerica-northeast2"
  description = "${var.branch_name} - Visitor counter function"

  build_config {
    runtime     = "python312"
    entry_point = "exec_firestore"

    source {
      storage_source {
        bucket = google_storage_bucket.function_bucket.name
        object = "${data.archive_file.function_source.output_md5}.zip"
      }
    }
  }

  service_config {
    max_instance_count = 1
    available_memory   = "128Mi"
    timeout_seconds    = 30
    environment_variables = var.environment_variables
  }
}

resource "google_cloud_run_service_iam_member" "public_invoker" {
  project        = google_cloudfunctions2_function.counter.project  
  location       = google_cloudfunctions2_function.counter.location
  service        = google_cloudfunctions2_function.counter.name
  role   = "roles/run.invoker"
  member = "allUsers"
}
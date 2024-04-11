module "web_bucket" {
  source      = "../../modules/web_storage_bucket/"
  project_id       = var.project_id
  branch_name = var.branch_name
  bucket_name = var.branch_name == "prod" ? var.web_bucket_name : var.dev_web_bucket_name
}

module "firestore" {
  source           = "../../modules/firestore"
  project_id       = var.project_id
}

module "cloud_function" {
  source           = "../../modules/cloud_function"
  project_id       = var.project_id
  branch_name      = var.branch_name
  environment_variables = {
    DB_NAME = "${var.branch_name}-${var.project_id}"
  }
}
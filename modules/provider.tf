variable "project_id" {
  description = "Project ID where resources will be created"
}

provider "google" {
  project     = var.project_id
  region      = "northamerica-northeast2"
}
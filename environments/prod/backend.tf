terraform {
  backend "gcs" {
    bucket = "thumpzilla-website-tfstate"
    prefix = "env/prod"
  }
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.24"
    }
  }
}
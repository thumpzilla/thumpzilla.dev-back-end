terraform {
  backend "gcs" {
    bucket = "dev-thumpzilla-website-tfstate"
    prefix = "env/dev"
  }
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.24"
    }
  }
}
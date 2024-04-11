variable "project_id" {
  description = "Project ID where resources will be created"
  type        = string
}

variable "branch_name" {
  description = "Deployment environment ('dev', 'prod')"
  type        = string
  default     = "dev"
}

variable "environment_variables" {
  description = "variables for the Google Cloud Function - main.py - write to dev/prod DB colection"
}
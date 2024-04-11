variable "project_id" {
  description = "Project ID where resources will be created"
  type        = string
}

variable "branch_name" {
  description = "Deployment environment ('dev', 'prod')"
  type        = string
  default     = "dev"
}

variable "web_bucket_name" {
  description = "Name of the bucket"
  type        = string
}

variable "dev_web_bucket_name" {
  description = "Name of the bucket"
  type        = string
}
variable "region" {
  description = "Default region for providers"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "GCP project id"
  type        = string
  default     = ""
}

variable "wiki" {
  description = "Composite Wiki.js configuration covering compute, storage, networking, scaling, monitoring, and security requirements"
  type        = any
  default     = {}
}

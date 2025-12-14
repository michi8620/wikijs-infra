variable "image" {
  description = "Container image for Wiki.js"
  type        = string
  default     = "requarks/wiki:2"
}

variable "region" {
  description = "GCP region for Cloud Run"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "GCP project. Set at root or via module input."
  type        = string
  default     = ""
}

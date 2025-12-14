variable "account_id" {
  description = "Service account id (no domain)"
  type        = string
  default     = "wiki-sa"
}

variable "display_name" {
  description = "Service account display name"
  type        = string
  default     = "Wiki Service Account"
}

variable "project" {
  description = "GCP project id"
  type        = string
  default     = ""
}

variable "roles" {
  description = "List of roles to bind to the service account"
  type        = list(string)
  default     = ["roles/run.invoker"]
}

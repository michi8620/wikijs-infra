variable "db_name" {
  description = "Database name"
  type        = string
  default     = "wikidb"
}

variable "region" {
  description = "GCP region for Cloud SQL"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "instance_tier" {
  description = "Cloud SQL instance tier"
  type        = string
  default     = "db-f1-micro"
}

variable "db_password" {
  description = "Database admin password (use secrets manager in production)"
  type        = string
  default     = "changeme"
}

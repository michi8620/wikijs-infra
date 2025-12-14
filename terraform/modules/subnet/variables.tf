variable "name" {
  description = "Subnetwork name"
  type        = string
  default     = "wiki-subnet"
}

variable "ip_cidr_range" {
  description = "CIDR range for subnetwork"
  type        = string
  default     = "10.0.1.0/24"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "Network self_link or name"
  type        = string
  default     = ""
}

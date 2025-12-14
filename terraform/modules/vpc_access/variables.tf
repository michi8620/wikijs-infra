variable "name" {
  description = "Connector name"
  type        = string
  default     = "wiki-vpc-connector"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = ""
}

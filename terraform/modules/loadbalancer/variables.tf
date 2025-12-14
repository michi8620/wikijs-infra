variable "name" {
  description = "Load balancer name prefix"
  type        = string
  default     = "wiki-lb"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "backend_service" {
  description = "Backend service self_link (optional)"
  type        = string
  default     = ""
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = ""
}

variable "reserved_range_name" {
  description = "Name for the reserved peering range"
  type        = string
  default     = "google-managed-services-range"
}

variable "reserved_cidr_range" {
  description = "CIDR range to reserve for private services (e.g. 10.64.0.0/24)"
  type        = string
  default     = "10.64.0.0/28"
}

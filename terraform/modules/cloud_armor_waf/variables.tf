variable "name" {
  description = "Security policy name"
  type        = string
  default     = "wiki-cloud-armor"
}

variable "project" {
  description = "GCP project id"
  type        = string
  default     = ""
}

variable "rules" {
  description = "List/map of security rules to apply"
  type        = any
  default     = {}
}

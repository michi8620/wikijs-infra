variable "name" {
  description = "Bucket name (must be globally unique)"
  type        = string
  default     = "wikijs-storage-bucket"
}

variable "location" {
  description = "Bucket location/region"
  type        = string
  default     = "US"
}

variable "name" { type = string }
variable "location" { type = string }

resource "google_storage_bucket" "bucket" {
  name     = var.name
  location = var.location
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

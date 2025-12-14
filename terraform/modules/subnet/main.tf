variable "name" { type = string }
variable "ip_cidr_range" { type = string }
variable "region" { type = string }
variable "network" { type = string }

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.network
}

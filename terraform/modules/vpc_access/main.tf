variable "name" { type = string }
variable "region" { type = string }
variable "network" { type = string }

resource "google_vpc_access_connector" "connector" {
  name   = var.name
  region = var.region
  network = var.network
  ip_cidr_range = "10.8.0.0/28"
}

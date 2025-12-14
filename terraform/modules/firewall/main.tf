variable "name" { type = string }
variable "network" { type = string }
variable "allow_tcp_ports" { type = list(number) }
variable "source_ranges" { type = list(string) }

resource "google_compute_firewall" "firewall" {
  name    = var.name
  network = var.network

  allow {
    protocol = "tcp"
    ports    = [for p in var.allow_tcp_ports : tostring(p)]
  }

  source_ranges = var.source_ranges
}

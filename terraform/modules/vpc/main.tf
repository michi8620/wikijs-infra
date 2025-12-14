// Network module (GCP)
resource "google_compute_network" "network" {
  name                    = "wiki-network-${var.environment}"
  auto_create_subnetworks = false
}

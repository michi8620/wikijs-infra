variable "name" { type = string }
variable "region" { type = string }
variable "backend_service" { type = string }

# Global static IP for load balancer
resource "google_compute_global_address" "lb_ip" {
  name = "${var.name}-ip"
}

# URL map and target proxy (skeleton)
resource "google_compute_url_map" "url_map" {
  name = "${var.name}-urlmap"
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name   = "${var.name}-proxy"
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_global_forwarding_rule" "http_forwarding" {
  name       = "${var.name}-fwd"
  ip_address = google_compute_global_address.lb_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.self_link
}

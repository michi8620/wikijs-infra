output "ip_address" {
  value = google_compute_global_address.lb_ip.address
}

output "forwarding_rule" {
  value = google_compute_global_forwarding_rule.http_forwarding.self_link
}

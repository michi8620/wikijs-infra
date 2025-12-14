output "reserved_range_name" {
  value = google_compute_global_address.private_ip_addr_range.name
}

output "service_connection" {
  value = google_service_networking_connection.private_vpc_connection.id
}

variable "network" { type = string }
variable "reserved_range_name" { type = string }
variable "reserved_cidr_range" { type = string }

# Reserve an IP range for Private Services Access
resource "google_compute_global_address" "private_ip_addr_range" {
  name          = var.reserved_range_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = length(regexall("/([0-9]{1,2})$", var.reserved_cidr_range)) > 0 ? tonumber(regexall("/([0-9]{1,2})$", var.reserved_cidr_range)[0]) : 24
  address       = split("/", var.reserved_cidr_range)[0]
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_addr_range.name]
}

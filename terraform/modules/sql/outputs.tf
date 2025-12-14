output "db_connection_name" {
  description = "Instance connection name for Cloud SQL"
  value       = google_sql_database_instance.instance.connection_name
}

output "db_public_ip" {
  description = "First public IP address (if enabled)"
  value       = try(google_sql_database_instance.instance.ip_address[0].ip_address, "")
}

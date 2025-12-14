// Database module (GCP Cloud SQL - Postgres)
variable "db_name" { type = string }

resource "google_sql_database_instance" "instance" {
  name             = "${var.db_name}-${var.environment}"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = var.instance_tier
    ip_configuration {
      ipv4_enabled = true
      # Note: for production use, configure authorized networks or private IP
    }
  }
}

resource "google_sql_database" "db" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "wiki_user" {
  name     = "wiki_user"
  instance = google_sql_database_instance.instance.name
  password = var.db_password
}

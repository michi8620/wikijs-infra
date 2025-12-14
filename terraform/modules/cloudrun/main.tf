// Wiki app module (GCP Cloud Run)
variable "image" { type = string }

resource "google_service_account" "wiki_sa" {
  account_id   = "wiki-sa-${var.environment}"
  display_name = "Wiki.js Service Account"
}

resource "google_cloud_run_service" "wiki" {
  name     = "wikijs-${var.environment}"
  location = var.region

  template {
    spec {
      service_account_name = google_service_account.wiki_sa.email

      containers {
        image = var.image
        ports {
          container_port = 3000
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  project        = var.project
  location       = var.region
  service        = google_cloud_run_service.wiki.name
  role           = "roles/run.invoker"
  member         = "allUsers"
}

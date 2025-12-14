variable "account_id" { type = string }
variable "display_name" { type = string }
variable "project" { type = string }
variable "roles" { type = list(string) }

resource "google_service_account" "service_account" {
  account_id   = var.account_id
  project      = var.project
  display_name = var.display_name
}

resource "google_project_iam_member" "sa_roles" {
  for_each = toset(var.roles)
  project  = var.project
  role     = each.value
  member   = "serviceAccount:${google_service_account.service_account.email}"
}

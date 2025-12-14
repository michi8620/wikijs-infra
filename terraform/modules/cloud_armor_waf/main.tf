variable "name" { type = string }
variable "project" { type = string }
variable "rules" { type = any }

resource "google_compute_security_policy" "security_policy" {
  name = var.name

  dynamic "rule" {
    for_each = var.rules
    content {
      priority = rule.value.priority
      match {
        versioned_expr = "SRC_IPS_V1"
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      action = rule.value.action
    }
  }
}

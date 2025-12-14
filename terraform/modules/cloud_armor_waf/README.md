cloud_armor_waf module

Creates a `google_compute_security_policy` (Cloud Armor) with dynamic rules. Provide a `rules` map describing each rule's `priority`, `src_ip_ranges`, and `action`.

Example `rules` input:

{
  "allow-local": {
    priority = 1000,
    src_ip_ranges = ["10.0.0.0/8"],
    action = "allow"
  }
}

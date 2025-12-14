variable "name" {
  description = "Firewall rule name"
  type        = string
  default     = "wiki-fw"
}

variable "network" {
  description = "Network self_link or name"
  type        = string
  default     = ""
}

variable "allow_tcp_ports" {
  description = "TCP ports to allow"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "source_ranges" {
  description = "Source CIDR ranges"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

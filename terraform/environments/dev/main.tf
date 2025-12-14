// Dev environment root (GCP)
terraform {
  required_version = ">= 1.0"
}

module "vpc" {
  source      = "../../modules/vpc"
  environment = var.environment
}

module "sql" {
  source      = "../../modules/sql"
  region      = var.region
  environment = var.environment
  db_name     = "wikidb"
}

module "cloudrun" {
  source      = "../../modules/cloudrun"
  region      = var.region
  environment = var.environment
  image       = "requarks/wiki:2"
}

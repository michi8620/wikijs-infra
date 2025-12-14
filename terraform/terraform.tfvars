project     = "internal-wikijs-platform"
region      = "us-central1"
environment = "dev"

wiki = {
  compute = {
    runtime       = "cloud_run"
    image         = "docker.io/requarks/wiki:2"
    min_instances = 1
    max_instances = 4
    cpu           = 1
    memory_mb     = 512
    env = {
      DB_HOST         = "wiki-sql-dev"
      DB_USER         = "wiki_user"
      DB_NAME         = "wikidb"
      FILE_STRATEGY   = "db"
      ALLOW_ANONYMOUS = "false"
    }
  }

  database = {
    engine                = "postgres"
    version               = "15"
    tier                  = "db-g1-small"
    storage_gb            = 20
    backup_retention_days = 7
    availability_type     = "REGIONAL"
    deletion_protection   = true
  }

  storage = {
    bucket_name = "wiki-dev-attachments"
    location    = "US"
    versioning  = true
    lifecycle_rules = [
      {
        action = "Delete"
        age    = 365
      }
    ]
  }

  networking = {
    vpc_name               = "wiki-network-dev"
    cidr_block             = "10.42.0.0/16"
    private_service_cidr   = "10.66.0.0/28"
    allowed_ingress_cidrs  = ["0.0.0.0/0"]
    enable_cloud_armor     = true
    subnets = [
      {
        name        = "wiki-app-dev"
        cidr_block  = "10.42.1.0/24"
        description = "Private subnet for Wiki.js runtime and connector"
      },
      {
        name        = "wiki-db-dev"
        cidr_block  = "10.42.2.0/24"
        description = "Subnet dedicated to Cloud SQL"
      }
    ]
  }

  scaling = {
    autoscaling                = true
    concurrency                = 80
    request_timeout_seconds    = 300
    max_instance_request_count = 400
  }

  monitoring = {
    logging_enabled      = true
    metrics_enabled      = true
    uptime_check_enabled = true
    alert_email          = "oncall@example.com"
    log_retention_days   = 30
  }

  security = {
    authentication           = "oidc"
    allowed_identities       = ["example.com"]
    secret_manager           = true
    enforce_ssl              = true
    service_accounts         = ["wiki-runtime", "wiki-ci"]
    cloud_armor_enforce_mode = true
  }
}

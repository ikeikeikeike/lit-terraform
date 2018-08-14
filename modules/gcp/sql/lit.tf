
resource "google_sql_database_instance" "lit" {
  master_instance_name = "litmaster"
  # name                 = "lit"
  database_version     = "POSTGRES_9_6"

  settings {
    availability_type           = "ZONAL"
    tier                        = "db-f1-micro"
    activation_policy           = "ALWAYS"
    disk_autoresize             = true
    disk_size                   = 22
    disk_type                   = "PD_SSD"
    pricing_plan                = "PER_USE"
    # authorized_gae_applications = []
    # backup_configuration        = []
    # ip_configuration            = [[{}]]
    # location_preference         = []
    # maintenance_window          = []
    # replication_type            = "ASYNCHRONOUS"
    # database_flags              = []
  }

  # replica_configuration = []
}

resource "google_sql_database" "lit" {
  instance  = "${google_sql_database_instance.lit.name}"
  count     = 1
  name      = "lit"
  charset   = "UTF8"
  collation = "ja_JP.UTF8"
}

resource "google_sql_user" "lit" {
  instance  = "${google_sql_database_instance.lit.name}"
  count    = 1
  name     = "${var.lit_username}"
  password = "${var.lit_userpass}"
  host     = "%"
}


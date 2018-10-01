resource "google_storage_bucket" "lit-storage" {
  name          = "lit-storage-${terraform.env}"
  location      = "asia-northeast1"
  storage_class = "REGIONAL"

  labels = {
    name   = "lit-storage"
    deploy = "lit-storage"
    env    = "${terraform.env}"
  }
}

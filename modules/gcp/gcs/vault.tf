resource "google_storage_bucket" "lit-cred-vault" {
  name          = "lit-cred-vault"
  location      = "asia-northeast1"
  storage_class = "REGIONAL"
}


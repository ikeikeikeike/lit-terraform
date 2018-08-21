resource "google_compute_network" "lit" {
  name                    = "lit"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "lit-asia-northeast1" {
  name          = "lit"
  ip_cidr_range = "10.0.0.0/20"
  network       = "${google_compute_network.lit.name}"
  region        = "asia-northeast1"
}

resource "google_compute_subnetwork" "lit-asia-southeast1" {
  name          = "lit"
  ip_cidr_range = "10.2.0.0/20"
  network       = "${google_compute_network.lit.name}"
  region        = "asia-southeast1"
}

resource "google_compute_subnetwork" "lit-asia-east1" {
  name          = "lit"
  ip_cidr_range = "10.4.0.0/20"
  network       = "${google_compute_network.lit.name}"
  region        = "asia-east1"
}

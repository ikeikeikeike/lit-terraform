# resource "google_compute_firewall" "office" {
  # name    = "office"
  # network = "${google_compute_network.lit.name}"

  # allow {
    # protocol = "icmp"
  # }
  # allow {
    # protocol = "tcp"
    # ports    = ["1-65535"]
    # ports    = ["80", "443"]
  # }
  # source_ranges = ["xxx.xxx.xxx.xxx", "xxx.xxxx.xxxx.xxxx"]
  # target_tags = ["office"]
# }

resource "google_compute_firewall" "k8s" {
  name    = "k8s"
  network = "${google_compute_network.lit.name}"

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["k8s"]
}

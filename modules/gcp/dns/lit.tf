resource "google_compute_global_address" "lit-lb" {
  name = "lit-lb"
}

resource "google_dns_record_set" "test_example_com" {
  managed_zone = "XXX"
  name         = "lit.com."
  type         = "A"
  ttl          = 300
  rrdatas      = ["${google_compute_global_address.lit-lb.address}"]
}

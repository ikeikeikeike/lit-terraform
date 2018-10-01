resource "google_dns_managed_zone" "lit" {
  name     = "loveistokyo-jp"
  dns_name = "loveistokyo.jp."
}

resource "google_dns_record_set" "lit" {
  managed_zone = "${google_dns_managed_zone.lit.name}"
  name         = "${google_dns_managed_zone.lit.dns_name}"

  type         = "A"
  ttl          = 300
  rrdatas      = ["${var.vpc_global_address_lit_lb_address}"]
}

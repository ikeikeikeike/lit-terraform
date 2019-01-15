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

resource "google_dns_record_set" "lit_mx" {
  managed_zone = "${google_dns_managed_zone.lit.name}"
  name         = "${google_dns_managed_zone.lit.dns_name}"

  type         = "MX"
  ttl          = 3600
  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com."
  ]
}

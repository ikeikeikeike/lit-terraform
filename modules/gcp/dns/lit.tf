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
  rrdatas      = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com."
  ]
}

resource "google_dns_record_set" "lit_spf" {
  managed_zone = "${google_dns_managed_zone.lit.name}"
  name         = "${google_dns_managed_zone.lit.dns_name}"

  type         = "TXT"
  ttl          = 3600
  rrdatas      = ["\"v=spf1 include:_spf.google.com ~all\""]
}

resource "google_dns_record_set" "lit_dkim" {
  managed_zone = "${google_dns_managed_zone.lit.name}"
  name         = "google._domainkey.${google_dns_managed_zone.lit.dns_name}"

  type         = "TXT"
  ttl          = 3600
  rrdatas      = [
    "\"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp8gN1K7Yooq2CH16Eyay0QVDoAmd8RjD+myvKdDwmyPJQSt29Io2mGPTY28FeuET82Dkhs0a+8Wxmwdx4/Shs10BeYT1wqy0wT/nh3eUouVu51g9lSUjyPF8uUIukFMlpa/JiSty2lhZW3xRD8m89MoWNh5RbtGq0e39eHAKkoUZ+2/Tg\"",
    "\"TDDRRoQmoB3uwStbLr+BVfkXcOqRrGCPex/M0EL2pYfHYJ0MtJ7kF4Ii9S0UkeEEDRKxWi/firAeMHMYUWlzpDjuyK9n03U6h8DuBHKiczp5o+HMgVjwHoe5ANJjneuu0MT86VdEfh4Bo0ZTFjHKIIMGiABLSxruyHPzQIDAQAB\""
  ]
}


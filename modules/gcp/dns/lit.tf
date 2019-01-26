locals {
  domain   = "loveistokyo.jp"
}

resource "google_dns_managed_zone" "lit" {
  name     = "loveistokyo-jp"
  dns_name = "${local.domain}."
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
    "\"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCHI/gIoecj+VZ8UVA3CPrucUZ0GnB0sCJEb1pvQ0fYr3WfUeaLvn5bM2d9qurTP9iGq5aZIlRhR/C2/srJkcQs+Pse/W8FE88hxNXecNCgLY+VbQnZHzffdx9lkkM5fTREeAtGfDRSZ7m8jaaNg61P7MD+upauCMvO1vpJp53CdQIDAQAB\""
  ]
}

resource "google_dns_record_set" "lit_dmarc" {
  managed_zone = "${google_dns_managed_zone.lit.name}"
  name         = "_dmarc.${google_dns_managed_zone.lit.dns_name}"

  type         = "TXT"
  ttl          = 3600
  rrdatas      = [
    "\"v=DMARC1; p=reject; rua=mailto:reports@${local.domain}\""
  ]
}


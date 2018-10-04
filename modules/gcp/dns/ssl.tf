provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "lit" {
  algorithm = "RSA"
}

resource "acme_registration" "lit" {
  account_key_pem = "${tls_private_key.lit.private_key_pem}"
  email_address   = "jp.ne.co.jp@gmail.com"
}

resource "acme_certificate" "lit" {
  account_key_pem           = "${acme_registration.lit.account_key_pem}"
  common_name               = "${replace(google_dns_record_set.lit.name, "/\\.$/", "")}"
  # subject_alternative_names = ["www2.example.com"]

  dns_challenge {
    provider = "gcloud"

    config {
      GCE_PROJECT = "${var.google_project}"
    }
  }
}

resource "google_compute_ssl_certificate" "lit" {
  name_prefix = "lit--"
  private_key = "${acme_certificate.lit.private_key_pem}"
  certificate = "${acme_certificate.lit.certificate_pem}"
}

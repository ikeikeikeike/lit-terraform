output "lit_private_key_pem"  { value = "${acme_certificate.lit.private_key_pem}" }
output "lit_certificate_pem"  { value = "${acme_certificate.lit.certificate_pem}" }
output "lit_issuer_pem"       { value = "${acme_certificate.lit.issuer_pem}" }


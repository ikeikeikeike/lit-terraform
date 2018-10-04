
output "dns_lit_private_key_pem"  { value = "${module.dns.lit_private_key_pem}" }
resource "local_file" "dns_lit_private_key_pem" {
    content  = "${module.dns.lit_private_key_pem}"
    filename = "${path.module}/lit.key"
}

output "dns_lit_certificate_pem"  { value = "${module.dns.lit_certificate_pem}" }
resource "local_file" "dns_lit_certificate_pem" {
    content  = "${module.dns.lit_certificate_pem}"
    filename = "${path.module}/lit.cert"
}

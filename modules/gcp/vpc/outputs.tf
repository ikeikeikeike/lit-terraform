output "network_lit_name"                          { value = "${google_compute_network.lit.name }" }
output "network_lit_self_link"                     { value = "${google_compute_network.lit.self_link }" }
output "subnetwork_lit_asia_northeast1_name"       { value = "${google_compute_subnetwork.lit-asia-northeast1.name }" }
output "subnetwork_lit_asia_northeast1_self_link"  { value = "${google_compute_subnetwork.lit-asia-northeast1.self_link }" }
output "global_address_lit_lb_address"             { value = "${google_compute_global_address.lit-lb.address }" }


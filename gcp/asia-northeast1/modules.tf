module "vpc" {
  source = "../../modules/gcp/vpc"
}

module "gcs" {
  source = "../../modules/gcp/gcs"
}

module "gke" {
  source = "../../modules/gcp/gke"

  vpc_network_lit_name                         = "${module.vpc.network_lit_name}"
  vpc_network_lit_self_link                    = "${module.vpc.network_lit_self_link}"
  vpc_subnetwork_lit_asia_northeast1_name      = "${module.vpc.subnetwork_lit_asia_northeast1_name}"
  vpc_subnetwork_lit_asia_northeast1_self_link = "${module.vpc.subnetwork_lit_asia_northeast1_self_link}"
  zone                                         = "${lookup(var.zone, "${terraform.env}")}"
  min_node_count                               = "${lookup(var.min_node_count, "${terraform.env}.lit")}"
  max_node_count                               = "${lookup(var.max_node_count, "${terraform.env}.lit")}"
}

module "dns" {
  source = "../../modules/gcp/dns"

  vpc_global_address_lit_lb_address            = "${module.vpc.global_address_lit_lb_address}"
}

# module "sql" {
  # source = "../../modules/gcp/sql"

  # lit_username  = "${data.vault_generic_secret.lit-db.data["username"]}"
  # lit_userpass  = "${data.vault_generic_secret.lit-db.data["password"]}"
# }

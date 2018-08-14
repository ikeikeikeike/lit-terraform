module "gcs" {
  source = "../../modules/gcp/gcs"
}

module "gke" {
  source = "../../modules/gcp/gke"

  min_node_count = "${lookup(var.min_node_count, "${terraform.env}.lit")}"
  max_node_count = "${lookup(var.max_node_count, "${terraform.env}.lit")}"
}

# module "sql" {
  # source = "../../modules/gcp/sql"

  # lit_username  = "${data.vault_generic_secret.lit-db.data["username"]}"
  # lit_userpass  = "${data.vault_generic_secret.lit-db.data["password"]}"
# }

module "gke" {
  source = "../../modules/gcp/gke"

  initial_node_count  = "${var.initial_node_count}"
}

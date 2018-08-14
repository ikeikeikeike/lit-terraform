# module "k8s" {
  # source           = "../../"
  # name             = "${var.cluster_name}"
  # network          = "default"
  # region           = "${var.region}"
  # zone             = "${var.zone}"
  # k8s_version      = "${var.k8s_version}"
  # access_config    = []
  # add_tags         = ["nat-${var.region}"]
  # pod_network_type = "calico"
  # calico_version   = "2.6"
  # num_nodes        = "${var.num_nodes}"
  # depends_id       = "${join(",", list(module.nat.depends_id, null_resource.route_cleanup.id))}"
# }

# module "nat" {
  # source  = "github.com/GoogleCloudPlatform/terraform-google-nat-gateway"
  # region  = "${var.region}"
  # zone    = "${var.zone}"
  # network = "default"
# }

# resource "null_resource" "route_cleanup" {
  # // Cleanup the routes after the managed instance groups have been deleted.
  # provisioner "local-exec" {
    # when    = "destroy"
    # command = "gcloud compute routes list --filter='name~k8s-${var.cluster_name}.*' --format='get(name)' | tr '\n' ' ' | xargs -I {} sh -c 'echo Y|gcloud compute routes delete {}' || true"
  # }
# }

# module "gke" {
  # source = "../../modules/gcp/gke"

  # initial_node_count  = "${var.initial_node_count}"
# }


module "gcs" {
  source = "../../modules/gcp/gcs"
}

# module "sql" {
  # source = "../../modules/gcp/sql"

  # lit_username  = "${data.vault_generic_secret.lit-db.data["username"]}"
  # lit_userpass  = "${data.vault_generic_secret.lit-db.data["password"]}"
# }


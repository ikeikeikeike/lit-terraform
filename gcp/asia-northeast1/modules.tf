# module "vault" {
  # source               = "github.com/GoogleCloudPlatform/terraform-google-vault"
  # zone                 = "${var.zone}"
  # machine_type         = "n1-standard-1"
  # storage_bucket       = "${var.storage_bucket}"
  # kms_keyring_name     = "${var.kms_keyring_name}"
  # force_destroy_bucket = false
# }

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

module "lit-db" {
  source           = "github.com/GoogleCloudPlatform/terraform-google-sql-db"
  tier             = "idb-f1-micro"
  name             = "lit"
  db_name          = "lit"
  region           = "${lookup(var.region, "${terraform.env}")}"
  user_name        = "${data.vault_generic_secret.lit-db.data["username"]}"
  user_password    = "${data.vault_generic_secret.lit-db.data["password"]}"
  db_collation     = "ja_JP.UTF8"
  database_version = "POSTGRES_9_6"

  # ip_configuration = [{
    # authorized_networks = [{
      # name  = "default"
      # value = "${data.google_compute_subnetwork.default-us-central1.ip_cidr_range}"
    # }]
  # }]
}

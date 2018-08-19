resource "google_container_cluster" "lit" {
  name               = "lit"
  zone               = "asia-northeast1-c"
  min_master_version = "1.10.5-gke.4"
  initial_node_count = "${var.max_node_count}"

  addons_config {
    kubernetes_dashboard {
      disabled = true
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "02:00"
    }
  }

  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = "22"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.full_control",
    ]

    labels = {
      name   = "${format("lit-%02d", count.index + 1)}"
      deploy = "lit"
      env    = "${terraform.env}"
    }

    tags = [
      "${terraform.env}",
      "${format("lit-%02d", count.index + 1)}",
      "lit",
    ]
  }
}

# resource "google_container_cluster" "lit" {
  # name               = "lit"
  # zone               = "asia-northeast1-c"
  # min_master_version = "1.10.5-gke.4"
  # initial_node_count = 1

  # addons_config {
    # # http_load_balancing {
      # # disabled = false
    # # }
    # # horizontal_pod_autoscaling {
      # # disabled = true
    # # }
    # kubernetes_dashboard {
      # disabled = true
    # }
  # }

  # maintenance_policy {
    # daily_maintenance_window {
      # start_time = "02:00"
    # }
  # }

  # node_pool {
    # autoscaling {
      # min_node_count = "${var.min_node_count}"
      # max_node_count = "${var.max_node_count}"
    # }

    # node_config {
      # machine_type = "n1-standard-1"
      # disk_size_gb = "22"

      # oauth_scopes = [
        # "https://www.googleapis.com/auth/logging.write",
        # "https://www.googleapis.com/auth/bigquery",
        # "https://www.googleapis.com/auth/compute",
        # "https://www.googleapis.com/auth/monitoring",
        # "https://www.googleapis.com/auth/devstorage.full_control",
      # ]

      # labels = {
        # name   = "${format("lit-%02d", count.index + 1)}"
        # deploy = "lit"
        # env    = "${terraform.env}"
      # }

      # tags = [
        # "${terraform.env}",
        # "${format("lit-%02d", count.index + 1)}",
        # "lit",
      # ]
    # }
  # }

  # # additional_zones = [
    # # "asia-northeast1-a",
    # # "asia-northeast1-b",
  # # ]

  # # master_auth {
    # # username = ""
    # # password = ""
  # # }

  # # ip_allocation_policy {
    # # cluster_secondary_range_name = ""
    # # services_secondary_range_name = "u
  # # }

  # # master_authorized_networks_config {
    # # cidr_blocks = [
      # # { cidr_block = "", display_name = "office" },
      # # { cidr_block = "", display_name = "shd-gcp-jump-001" },
    # # ]
  # # }

  # # lifecycle {
    # # ignore_changes = [ "node_count" ]
  # # }
# }


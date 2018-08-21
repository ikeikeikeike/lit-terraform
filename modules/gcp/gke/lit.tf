resource "google_container_cluster" "lit" {
  name               = "lit"
  min_master_version = "1.10.5-gke.4"
  zone               = "${var.zone}"
  initial_node_count = "${var.min_node_count}"
  network            = "${var.vpc_network_lit_self_link}"
  subnetwork         = "${var.vpc_subnetwork_lit_asia_northeast1_self_link}"

  maintenance_policy {
    daily_maintenance_window {
      start_time = "02:00"
    }
  }

  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"
    disk_size_gb = "30"

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

resource "google_container_node_pool" "lit-np" {
  name               = "lit-np"
  zone               = "${var.zone}"
  cluster            = "${google_container_cluster.lit.name}"
  initial_node_count = "${var.min_node_count}"

  autoscaling {
    min_node_count = "${var.min_node_count}"
    max_node_count = "${var.max_node_count}"
  }

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
    disk_size_gb = "30"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.full_control",
    ]

    labels = {
      name   = "${format("lit-np-%02d", count.index + 1)}"
      deploy = "lit-np"
      env    = "${terraform.env}"
    }

    tags = [
      "${terraform.env}",
      "${format("lit-np-%02d", count.index + 1)}",
      "lit-np",
    ]
  }
}



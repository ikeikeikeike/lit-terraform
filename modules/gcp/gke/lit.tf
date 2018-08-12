resource "google_container_cluster" "lit" {
  name               = "lit"
  zone               = "asia-northeast1-c"
  initial_node_count = "${lookup(var.initial_node_count, "${terraform.env}.lit")}"

  # additional_zones = [
    # "asia-northeast1-a",
    # "asia-northeast1-b",
  # ]

  # master_auth {
    # username = ""
    # password = ""
  # }

  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = "30"

    # autoscaling {
      # min_node_count = 1
      # max_node_count = 3
    # }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/bigquery",
    ]

    labels = {
      Name        = "${format("lit-%02d", count.index + 1)}"
      Deploy      = "lit"
      Environment = "${terraform.env}"
    }

    tags = [
      "${terraform.env}",
      "${format("lit-%02d", count.index + 1)}",
      "lit",
    ]
  }
}

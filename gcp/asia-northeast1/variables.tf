variable "google_project" {}

variable "zone" {
  default = {
    default           = "asia-southeast1-c"
    development       = "asia-east1-c"
    production        = "asia-northeast1-c"
  }
}

variable "region" {
  default = {
    default           = "asia-southeast1"
    development       = "asia-east1"
    production        = "asia-northeast1"
  }
}

variable "min_node_count" {
  type = "map"

  default = {
    default.lit       = 0
    development.lit   = 0
    production.lit    = 1
  }
}

variable "max_node_count" {
  type = "map"

  default = {
    default.lit       = 0
    development.lit   = 0
    production.lit    = 3
  }
}

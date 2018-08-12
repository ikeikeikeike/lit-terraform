variable "region" {
  default = {
    default           = "asia-southeast1"
    development       = "asia-east1"
    production        = "asia-northeast1"
  }
}

variable "initial_node_count" {
  type = "map"
  default = {
    default.lit       = 0
    development.lit   = 0
    production.lit    = 1
  }
}

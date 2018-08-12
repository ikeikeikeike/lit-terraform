terraform {
  required_version = ">= 0.11.0"

  backend "gcs" {
    bucket = "lit-tf-tfstate"
    prefix = "lit/tf.tfstate"
  }
}

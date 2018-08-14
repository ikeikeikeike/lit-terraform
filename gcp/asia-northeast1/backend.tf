terraform {
  required_version = ">= 0.11.7"

  backend "gcs" {
    bucket = "lit-tf-tfstate"
    prefix = "lit/tf.tfstate"
  }
}

provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
terraform {
  backend "s3" {
    bucket = "terraform-state-1111vfbeb"
    key    = "terraform-state/tf.state"
    region = "ap-south-1"
  }
}

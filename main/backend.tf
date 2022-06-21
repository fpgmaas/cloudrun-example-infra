terraform {
  backend "gcs" {
    bucket = "bucket-tfstate-3b7d82abe7444560"
    prefix = "terraform/state"
  }
}
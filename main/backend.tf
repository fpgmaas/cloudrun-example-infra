terraform {
  backend "gcs" {
    bucket = "bucket-tfstate-dc94737e9ea78a7b"
    prefix = "terraform/state"
  }
}
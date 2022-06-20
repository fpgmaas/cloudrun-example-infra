variable "project_id" {
  description = "The name of the project"
  type        = string
  default     = "my-cloudrun-api"
}

variable "region" {
  description = "The default compute region"
  type        = string
  default     = "europe-west4"
}
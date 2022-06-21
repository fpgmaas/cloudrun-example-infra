variable "project_id" {
  description = "The name of the project"
  type        = string
}

variable "region" {
  description = "The default compute region"
  type        = string
}

variable "repository" {
  description = "The name of the Artifact Registry repository to be created"
  type        = string
}
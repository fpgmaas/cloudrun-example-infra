variable "project_id" {
  description = "The name of the project"
  type        = string
}

variable "region" {
  description = "The compute region"
  type        = string
}


variable "repository" {
  description = "The name of the Artifact Registry repository that contains the docker image to be deployed"
  type        = string
}

variable "docker_image" {
  description = "The name of the Docker image in the Artifact Registry repository to be deployed to Cloud Run"
  type        = string
}
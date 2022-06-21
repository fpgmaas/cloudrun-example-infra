terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.25.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  } 
}

provider "docker" {
  host = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository}"
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "enable_apis" {
  source = "../modules/enable_apis"
}

module "artifact_registry" {
  source = "../modules/artifact_registry"
  depends_on = [module.enable_apis.time_sleep]
  project_id = var.project_id
  repository = var.repository
  region = var.region
}

resource "docker_registry_image" "helloworld" {
  name = "my-api"

  build {
    context = "${path.cwd}/absolutePathToContextFolder"
  }
}

module "cloudrun" {
  source = "../modules/cloudrun"
  depends_on = [module.artifact_registry]
  project_id = var.project_id
  repository = var.repository
  region = var.region
}

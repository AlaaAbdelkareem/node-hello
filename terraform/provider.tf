terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  # This allows Terraform to pull from your private/public Docker Hub
  registry_auth {
    address  = "index.docker.io"
    username = var.docker_username
    password = var.docker_password
  }
}
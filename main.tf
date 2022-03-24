terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = var.docker
}

# build the image
resource "docker_image" "dockerssh" {
  name = var.dockername
  build {
    path = var.pathimage
    tag  = ["dockerssh:latest", "dockerssh:terraform"]
  }
}


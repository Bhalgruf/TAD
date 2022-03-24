locals {
  vms = {
    "web" = {
      port_internal = 8080
      port_external = 8080
    }
    "SQL" = {
      port_internal = 8081
      port_external = 8081
    }
  }
}

# Create containers 
resource "docker_container" "web" {
  for_each = local.vms
  name     = each.key
  image    = docker_image.dockerssh.latest
  ports {
    internal = each.value.port_internal
    external = each.value.port_external
  }
}


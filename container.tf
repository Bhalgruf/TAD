locals {
  vms=["web","SQL"]
}

# Create containers 
resource "docker_container" "web" {
  for_each = toset (local.vms)
  name  = each.key
  image = docker_image.dockerssh.latest
}


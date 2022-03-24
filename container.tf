# Create a container WEB
resource "docker_container" "web" {
  name  = var.containerWEBname
  image = docker_image.dockerssh.latest
}

# Create a container SQL
resource "docker_container" "SQL" {
  name  = var.containerSQLname
  image = docker_image.dockerssh.latest
}
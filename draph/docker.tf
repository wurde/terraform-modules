# docker run -it -p 6080:6080 -p 8080:8080 -p 9080:9080 -p 8000:8000 \
# -v /mnt/dgraph:/dgraph dgraph/standalone:v20.03.0

# Configure the docker provider
provider "docker" {}

# Create a docker image resource
# -> docker pull dgraph/standalone:latest
resource "docker_image" "dgraph" {
  name         = "dgraph/standalone:latest"
  keep_locally = true
}

# Create a docker container resource
# -> same as 'docker run --name dgraph -d dgraph/standalone:latest'
resource "docker_container" "dgraph" {
  name  = "dgraph"
  image = docker_image.dgraph.latest
  start = true
  tty   = true

  mounts {
    target = "/dgraph"
    source = "/mnt/dgraph"
    type   = "bind"
  }

  ports {
    internal = 6080
    external = 6080

  }
  ports {
    internal = 8080
    external = 8080
  }
  ports {
    internal = 9080
    external = 9080
  }
  ports {
    internal = 8000
    external = 8000
  }
}

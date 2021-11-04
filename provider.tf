provider "aws" {
  region = "eu-west-3"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.63.0"
    }
	docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

resource "tls_private_key" "pk" {
	algorithm = "RSA"
	rsa_bits = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"
  public_key = tls_private_key.pk.public_key_openssh
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCIaLGKyipshahy3rslmsptOqJFYPJQhbuCC5oXBumfgatBUFvuTbFZ1uAs1Vk15bV2+HJHEik1uon5IqaDdaCc/YXh7lw4ssM6DgJTBxSZG1guNscsBjFPpe8MgWqFYlZBdjjmDixV07kY9G5dBg1pzdNwiAj3jTYfJ9ZZnPCreD2V7eYie8snTGcWXKF2F5hje8zWUVE6xHbF2opFCUhrzYiB5EMADpcML2aFZPyhRRk5XxKOw1CEOFA"
  provisioner "local-exec" {	
	command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "first_vm" {
  ami           = data.aws_ami.ubuntu.id
  key_name      = aws_key_pair.kp.key_name
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

# Pulls the image
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

# Create a container
resource "docker_container" "foo" {
  image = docker_image.ubuntu.latest
  name  = "foo"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
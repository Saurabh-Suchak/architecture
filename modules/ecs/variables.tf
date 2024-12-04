variable "region" {
  default = "us-west-1"
}

variable "project_name" {
  default = "secure-architecture"
}

variable "environment" {
  default = "production"
}

variable "docker_image" {
  default = "hello-world:latest" 
}

variable "instance_ami" {
  default = "ami-0d53d72369335a9d6" 
}

variable "instance_type" {
  default = "t2.micro"
}

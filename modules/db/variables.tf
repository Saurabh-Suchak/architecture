variable "db_username" {
  default = "saurabh108"
}

variable "db_password" {
    default = "SecurePassw0rd123"
}

variable "vpc_id" {
    default = "vpc-085465f33646fcb4c"
  
}

variable "subnet_ids" {
    default = ["subnet-04ba63f288a9b49e3","subnet-0ffcacb360eef23ef"]
    type        = list(string)
  
}

variable "project_name" {
  default= "secure-architecture"
}

variable "environment" {
  default = "production"
}

# Configure a Cloud Provider
provider "aws" {
  region = "us-east-1"
  version = ">=3.7,<=3.11"
}


data "aws_ami" "myami" {
   most_recent = true
   owners = ["amazon"]
   
   filter { 
     name = "name"
     values = ["amzn2-ami-hvm*"]
   }

}

variable "zones_east" {
    default = ["us-east-1a", "us-east-1b"]
}

variable "project-name" {
   default = "Terraform-Production-Project"
}

locals {
   default_frontend_name = "${join("-", list(var.project-name, "Frontend"))}"
}


resource "aws_instance" "frontend_east" {
   #ami   = "ami-0be2609ba883822ec"
   ami   = data.aws_ami.myami.id
   instance_type = "t2.micro"
   count = 1
   availability_zone = var.zones_east[count.index]
   #depends_on       = [aws_instance.backend_east]
   tags = {
    Name = local.default_frontend_name
   }
   lifecycle { 
    create_before_destroy = true
  }
}


output "PublicIP_East_Frontend" {
  value = aws_instance.frontend_east.*.public_ip
}

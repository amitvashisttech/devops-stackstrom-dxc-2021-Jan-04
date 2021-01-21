# Configure a Cloud Provider
provider "aws" {
  region = "us-east-1"
  version = ">=3.7,<=3.11"
}

provider "aws" {
  region = "us-west-1"
  version = ">=3.7,<=3.11"
  alias   = "us-west-1"
}

variable "zones_east" {
    default = ["us-east-1a", "us-east-1b"]
}

variable "zones_west" {
    default = ["us-west-1a", "us-west-1b"]
}

variable "multi-region-deployment" {
    default = false
}

variable "project-name" {
   default = "Terraform-Production-Project"
}


variable "project-name-2" {
   default = "Terraform-AV"
}

locals {
   default_frontend_name = "${join("-", list(var.project-name, "Frontend"))}"
   default_backend_name = "${join("-", list(var.project-name, "Backend"))}"
   default_frontend_west_name = "${join("_", list(var.project-name-2, "Frontend-W"))}"
   default_backend_west_name = "${join("_", list(var.project-name-2, "Backend-W"))}"
}


locals {
    some_tags = {
	Owner = "DevOps Team"
        Project = "Terraform Learning Project"
        Name    = local.default_backend_name
    }
}


resource "aws_instance" "frontend_east" {
   #ami   = "ami-0be2609ba883822ec"
   ami   = "ami-0739f8cdb239fe9ae"
   instance_type = "t2.micro"
   count = 1
   availability_zone = var.zones_east[count.index]
   depends_on       = [aws_instance.backend_east]
   tags = {
    Name = local.default_frontend_name
   }
   lifecycle { 
    create_before_destroy = true
  }
}



resource "aws_instance" "frontend_west" {
   ami   = "ami-03130878b60947df3"
   provider = aws.us-west-1
   instance_type = "t2.micro"
   count = var.multi-region-deployment ? 2 : 0 
   availability_zone = var.zones_west[count.index]
   depends_on       = [aws_instance.backend_west]
   tags = {
    Name = local.default_frontend_west_name
   }

   lifecycle { 
    create_before_destroy = true
  }
}



resource "aws_instance" "backend_east" {
   ami   = "ami-0be2609ba883822ec"
   instance_type = "t2.micro"
   count = 1
   availability_zone = var.zones_east[count.index]
   tags = local.some_tags
   lifecycle { 
    prevent_destroy = false
  }
}



resource "aws_instance" "backend_west" {
   ami   = "ami-03130878b60947df3"
   provider = aws.us-west-1
   instance_type = "t2.micro"
   count = var.multi-region-deployment ? 2 : 0
   availability_zone = var.zones_west[count.index]
   tags = {
    Name = local.default_backend_west_name
   }

   lifecycle { 
    prevent_destroy = false
  }
}

output "PublicIP_East_Frontend" {
  value = aws_instance.frontend_east.*.public_ip
}

output "PublicIP_East_Backend" {
  value = aws_instance.backend_east.*.public_ip
}


output "PublicIP_West_Frontend" {
  value = aws_instance.frontend_west.*.public_ip
}
output "PublicIP_West_Backtend" {
  value = aws_instance.backend_west.*.public_ip
}

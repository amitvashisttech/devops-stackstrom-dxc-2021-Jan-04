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

resource "aws_instance" "frontend_east" {
   #ami   = "ami-0be2609ba883822ec"
   ami   = "ami-0739f8cdb239fe9ae"
   instance_type = "t2.micro"
   count = 2
   availability_zone = var.zones_east[count.index]
   depends_on       = [aws_instance.backend_east]
   tags = {
    Name = "Frontend-East"
   }
   lifecycle { 
    create_before_destroy = true
  }
}



resource "aws_instance" "frontend_west" {
   ami   = "ami-03130878b60947df3"
   provider = aws.us-west-1
   instance_type = "t2.micro"
   count = 2
   availability_zone = var.zones_west[count.index]
   depends_on       = [aws_instance.backend_west]
   tags = {
    Name = "Frontend-West"
   }

   lifecycle { 
    create_before_destroy = true
  }
}



resource "aws_instance" "backend_east" {
   ami   = "ami-0be2609ba883822ec"
   instance_type = "t2.micro"
   count = 2
   availability_zone = var.zones_east[count.index]
   tags = {
    Name = "Backend-East"
   }
   lifecycle { 
    prevent_destroy = false
  }
}



resource "aws_instance" "backend_west" {
   ami   = "ami-03130878b60947df3"
   provider = aws.us-west-1
   instance_type = "t2.micro"
   count = 2
   availability_zone = var.zones_west[count.index]
   tags = {
    Name = "Backend-West"
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

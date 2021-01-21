# Configure a Cloud Provider
provider "aws" {
  region = "us-east-1"
  version = ">=3.7,<=3.11"
}

variable "zones" {
   default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


resource "aws_instance" "frontend_east" {
   ami   = "ami-0be2609ba883822ec"
   instance_type = "t2.micro"
   count = 3
   availability_zone = var.zones[count.index]
   tags = {
    Name = "Frontend-East"
   }
}

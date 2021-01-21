# Configure a Cloud Provider
provider "aws" {
  region = "us-east-1"
  version = ">=3.7,<=3.11"
}


resource "aws_instance" "frontend_east" {
   ami   = "ami-0be2609ba883822ec"
   instance_type = "t2.micro"
   count = var.int_count
   availability_zone = var.zones[count.index]
   tags = {
    Name = "Frontend-East"
   }
}

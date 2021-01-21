# Configure a Cloud Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "frontend" {
# AMZ Linux
   ami   = "ami-0be2609ba883822ec"
# Ubuntu - 16.04
   #ami   = "ami-0739f8cdb239fe9ae"
   instance_type = "t2.micro"
   depends_on = [aws_instance.backend]
   count = var.frontend_count
   tags = {
    Name = "Frontend"
   }
   
   lifecycle { 
     create_before_destroy = true
   }
}




resource "aws_instance" "backend" {
   ami   = "ami-0be2609ba883822ec"
   instance_type = "t2.micro"
   count = var.backend_count
   tags = {
    Name = "backend"
   }
   
   lifecycle { 
     prevent_destroy = false
   }
}

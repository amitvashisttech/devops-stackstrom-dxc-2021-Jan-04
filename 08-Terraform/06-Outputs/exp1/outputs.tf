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
   count = 2
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
   count = 2
   tags = {
    Name = "backend"
   }
   
   lifecycle { 
     prevent_destroy = false
   }
}


output "backend_public_ips" {
  value = aws_instance.backend.*.public_ip
}

output "backend_public_dns" {
  value = aws_instance.backend.*.public_dns
}

output "frontend_public_dns" {
  value = aws_instance.frontend.*.public_dns
}

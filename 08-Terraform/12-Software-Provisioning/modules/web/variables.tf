variable "region" {
  default = "us-east-1"
}

data "aws_ami" "myami" {
  most_recent = true
  owners  = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

variable "ec2_count" {
  default = "1"
}


variable "key_name" { 
  default = "terraform-key"
}

variable "pvt_key" { 
  default = "/root/.ssh/terraform.pem"
}

variable "sg_id" { 
  default = "sg-0ae2811554874a4c4"
}

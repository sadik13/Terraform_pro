provider "aws" {
access_key =  var.access_key
secret_key =  var.secret_key
region = "us-east-1"
}

resource "aws_instance" "terraform"{
        ami             = "ami-0915bcb5fa77e4892"
        instance_type   = "t2.micro"
        key_name        = "public_key_pair"
        security_groups = ["terraform_sg"]
tags = {
      name = "terraform_sg"
        }
}

resource "aws_security_group" "terraform_sg" {
        name            = "terraform_sg"
        description     = "allow http inbound traffic"


        ingress {
          from_port     = 80
          to_port       = 80
          protocol      = "tcp"
          cidr_blocks   = ["0.0.0.0/0"]
        }

        ingress {
          from_port     = 22
          to_port       = 22
          protocol      = "tcp"
          cidr_blocks   = ["0.0.0.0/0"]
        }

        egress {

         from_port      = 0
         to_port        = 0
         protocol       = "-1"
         cidr_blocks    = ["0.0.0.0/0"]
        }

}
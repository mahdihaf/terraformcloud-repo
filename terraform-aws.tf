terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}

provider "aws" {
  region = "var.region"
  access_key = "var.access_key"
  secret_key = "var.secret_key"
}

resource "aws_vpc" "main" {
  cidr_block = "10.2.0.0/16"

  tags = {
    name = "wizlab-1"
  }
}
resource "aws_security_group" "secgr777" {
 name = "secgr"
 vpc_id = aws_vpc.main.id

 ingress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

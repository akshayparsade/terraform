provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "my_instance" {
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    key_name = "N.Vergi_key"
    security_groups = ["default"]
}
  
  terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.9.8"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
    profile = "default"
}

resource "aws_s3_bucket" "test-bucket-terraf
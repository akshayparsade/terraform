provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "my_instance" {
    ami = "
    key_name = "N.Vergi_key"
    security_groups = ["default"]
}

variable "image_id" {
    type = string
}
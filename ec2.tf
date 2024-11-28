provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "my_instance" {
    ami = ""
    instance_type = "t2.micro"
    key_name = "N.Vergi_key"
    security_groups = ["default"]
}

variable "image_id" {
    type = string
    default = ""
    default = ""
  
}
provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "my_instance" {
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    key_name = "N.Vergi_key"
    security_groups = ["default"]
}


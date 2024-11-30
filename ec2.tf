provider "aws" {
    region = "us-east-1"
  
}

resource "aws_security_group" "my_sg" {
  name = "my_sg"
  description ="allow HTTP Port"
  ingress {  # for inbound
    from_port         = 80
    protocol       = "TCP"  # -1 for all ip_protocol 
    to_port           = 80
    cidr_blocks       = ["0.0.0.0/0"]
  }
   
   #ip_protocol       = "TCP"  # -1 for all ip_protocol 
  
  # outbound
  egress {
    from_port         = 0
    protocol       = "-1" # -1 for all ip_protocol 
    to_port           = 0
    cidr_blocks       = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "my_instance" {
    ami = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    #security_groups = var.sg_name
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = <<- EOF
       #!/bin/bash
       yum install httpd -y
       systemctl start httpd
       systemctl enable httpd
}    

variable "image_id" { 
    type = string
    default = "ami-0453ec754f44f9a4a"
    description = "Enter AMI ID"

}

variable "instance_type" {
    default = "t2.micro"   
}
 
variable "key_name" {
    default = "N.Vergi_key"
}

#variable "sg_name" {
#   type = list
#  default = ["default"]
#}

output "demo" {
    value = "Hello World"
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}
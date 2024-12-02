terraform {
  required_version = 
}
provider "aws" {
    region = "us-east-1"
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr = var.vpc_cidr
    project = var.project_name
    env = var.env
    private_subnet_cidr = var.pri_cidr
    public_subnet_cidr = var.pub_cidr
}

module "ec2_module" {
    source = "./modules/ec2"
    image_id = var.image_id
    instance_type = var.instance_type
    security_group_id = [aws_security_group.my_sg.id]
    key_pair = var.login_key
    private_subnet_id = module.vpc_module.private_subnet_id
    public_subnet_id = module.vpc_module.public_subnet_id
}

resource "aws_security_group" "my_sg" {
    name = "my-sg"
    description = "allow HTTP Port"
    vpc_id = module.vpc_module.vpc_id
    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    depends_on = [
        module.vpc_module
    ]
}


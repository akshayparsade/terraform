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
    source = "./module/ec2"
    image_id =
    instance_type =
    security_group_id =
    key_pair = 
    private_subnet_id =
    public_subnet_id =

}
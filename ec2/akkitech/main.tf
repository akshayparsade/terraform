provider "aws" {
    region = "us-east-1"
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr = var.vpc_cidr
    project = project_name
    env = 
    private_subnet_cidr = var.private_subnet_cidr
    private_subnet_cidr = 
}
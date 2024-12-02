provider "aws" {
    region = "us-east-1"
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr = var.vpc_cidr
    project = var.project
    env = "dev"
    private_subnet_cidr = var.
    private_subnet_cidr = "10.0.15.0/20"
}
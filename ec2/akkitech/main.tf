provider "aws" {
    region = "us-east-1"
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr = vpc_cidr
    project = "akkitech"
    env = "dev"
    private_subnet_cidr = "10.0.0.0/20"
    private_subnet_cidr = "10.0.15.0/20"
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "project_name" {
    default = "akkitech"
}

variable "env" {
    default = "dev"
}
variable "pri_cidr" {
    default ="10.0.0.0/20"
}

variable "private_subnet_cidr" {
   default = "10.0.15.0/20"
}     
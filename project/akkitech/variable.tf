variable "vpc_cidr" {
    default = "192.168.0.0/16"
}

variable "project_name" {
    default = "cbz"
}

variable "env" {
    default = "dev"
}

variable "pri_cidr" {
    default = "192.168.0.0/20"
}

variable "pub_cidr" {
    default = "192.168.16.0/20"
}

variable "image_id" {
    default = "ami-012967cc5a8c9f891"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "login_key" {
    default = ""
}
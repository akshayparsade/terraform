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

variable "pub_cidr" {
   default = "10.0.16.0/20"
}     

variable = "image_id" {
    default = "ami-0453ec754f44f9a4a"
}

variable = "instance_type" {
    default = "t2.micro"
}

variable = "login-key" {
    default = "N.vi"
}
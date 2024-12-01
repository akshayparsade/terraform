variable "image_id" {
    default = "ami-0453ec754f44f9a4a"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_pair" {
    default = "UBUNTU"
}

variable "subnet_id_1" {
    default = "subnet-02d25c02f29880baf"
}
 
variable "subnet_id_2" {
    default = "subnet-02f445042193b5e90"
}

variable "vpc_id"{
    default = "vpc-vpc-0f604e006c82db26a"
}
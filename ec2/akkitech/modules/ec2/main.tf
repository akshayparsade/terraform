resource "aws_instance" "my_instance" {
    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_
}
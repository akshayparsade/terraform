resource "aws_instance" "my_instance" {
    ami = var.iamge_id
    instance_type = var.i
}
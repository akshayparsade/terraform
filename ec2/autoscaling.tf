resource "aws_launch_configuration" "lc_home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    security_groups =
    user_data = <<-EOF
    #!
    apt install httpd
    systemctl start httpd
    systemctl enable httpd

}
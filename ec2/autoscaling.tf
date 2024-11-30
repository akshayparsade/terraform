resource "aws_launch_configuration" "lc_home" {
    image_id = 
    instance_type = "t2.micro"
    key_name =
    security_groups =
    user_data = <<-EOF
    apt install httpd
    systemctl start httpd
    systemctl enable httpd
    
}
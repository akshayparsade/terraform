resource "aws_s
resource "aws_launch_configuration" "lc_home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    security_groups =
    user_data = <<-EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "<h1> Hello World </h1> <br> <h2> Welcome to akkitech.sol </h2> > /var/www/html/index.html 
    EOF 
}
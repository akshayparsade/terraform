resource "aws_security_group" "my_sg"{
    name = "allow-http-public"
    description ="allow HTTP Port"
    ingress {
        from_port  = 80
        to_port    = 80
        protocol   = "TCP"
        cidr_blocks = ["0.0.0.0/0"] 
    }
    egress{
        from_port = 0
        to_port = 0
        protocol ="-1"
        cidr_blocks =["0.0.0.0/0"]
    }

}
resource "aws_launch_configuration" "lc_home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    security_groups = aws_security_group.my_sg.id
    user_data = <<-EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "<h1> Hello World </h1> <br> <h2> Welcome to akkitech.sol </h2> > /var/www/html/index.html 
    EOF 
}
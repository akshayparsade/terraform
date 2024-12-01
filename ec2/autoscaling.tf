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

resource "aws_launch_configuration" "lc_laptop" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    security_groups = aws_security_group.my_sg.id
    user_data = <<-EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/laptop
    echo "<h1> This is laptop Page </h1> <br> <h2> Welcome to laptops </h2> > /var/www/html/laptop/index.html 
    EOF 
}

resource "aws_launch_configuration" "lc_cloth" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    security_groups = aws_security_group.my_sg.id
    user_data = <<-EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/cloth
    echo "<h1> This is Clothing Page </h1> <br> <h2> SALE ! SALE ! SALE !! </h2> > /var/www/html/cloth/index.html 
    EOF 
}

resource "aws_autoscaling_group" "asg_home" {
  name                 = "asg_home"
  max_size             = 4
  min_size             = 2
  launch_configuration = aws_launch_configuration.
  vpc_zone_identifier  = [aws_subnet.example1.id, aws_subnet.example2.id]
}
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
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.lc_home
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_2]
}

resource "aws_autoscaling_policy" "asg_policy_home" {
  autoscaling_group_name = "aws_autoscaling_group.asg_home.name"
  name                   = "asg_policy_home"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}

resource "aws_autoscaling_group" "asg_laptop" {
  name                 = "asg_laptop"
  max_size             = 4
  min_size             = 2
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.lc_laptop
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_2]
}

resource "aws_autoscaling_policy" "asg_policy_laptop" {
  autoscaling_group_name = "aws_autoscaling_group.asg_laptop.name"
  name                   = "asg_policy_laptop"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}

resource "aws_autoscaling_group" "asg_cloth" {
  name                 = "asg_cloth"
  max_size             = 4
  min_size             = 2
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.lc_home
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_2]
}

resource "aws_autoscaling_policy" "asg_policy_home" {
  autoscaling_group_name = "aws_autoscaling_group.asg_home.name"
  name                   = "asg_policy_home"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}
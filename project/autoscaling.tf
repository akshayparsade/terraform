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

#Home
resource "aws_launch_template" "lc_home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = filebase64("./home.sh")
}

#laptop
resource "aws_launch_template" "lc_laptop" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = filebase64("./laptop.sh")
}

#cloth
resource "aws_launch_template" "lc_cloth" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = filebase64("./cloth.sh")
}

resource "aws_autoscaling_group" "asg_home" {
  name                 = "asg_home"
  max_size             = 4
  min_size             = 2
  desired_capacity     = 2
  launch_template {
    id = aws_launch_template.lt_home.id
    version = aws_launch_template.lt_home.latest_version
  }
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_2]
  target_group_arns = [aws_lb_target_group.tg_home.arn]
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
  launch_template {
    id = aws_launch_template.lt_laptop.id
    version = aws_launch_template.lt_laptop.latest_version
  }
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_2]
  target_group_arns = [aws_lb_target_group.tg_laptop.arn]
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
  launch_template {
    id = aws_launch_template.lt_cloth.id
    version = aws_launch_template.lt_cloth.latest_version
  }
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_2]
  target_group_arns = [aws_lb_target_group.tg_cloth.arn]

}

resource "aws_autoscaling_policy" "asg_policy_cloth" {
  autoscaling_group_name = "aws_autoscaling_group.asg_home.cloth"
  name                   = "asg_policy_cloth"
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
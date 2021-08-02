resource "aws_lb_target_group" "nile-university_target" {
  health_check {
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             ="200"
  }

  name        = "nile-university"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${aws_vpc.nile-vpc.id}"

tags = {
    Name = "nile-university_target"
  }
}



resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment" {
  target_group_arn = "${aws_lb_target_group.nile-university_target.arn}"
  target_id       = "${aws_instance.first_instance.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment2" {
  target_group_arn = "${aws_lb_target_group.nile-university_target.arn}"
  target_id= "${aws_instance.second_instance.id}"
  port= 80
}

resource "aws_lb" "nile-university-lb" {
  name     = "nile-university-lb"
  internal = false

  security_groups = ["${aws_security_group.SG-loadbalancer.id}"
  ]

  subnets = [
    "${aws_subnet.prod-pub-1.id}",
    "${aws_subnet.prod-pub-2.id}",
  ]

  tags = {
    Name = "nile-university-lb"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "nile-university-listner" {
  load_balancer_arn = "${aws_lb.nile-university-lb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.nile-university_target.arn}"
  }

  }


resource "aws_lb_listener_rule" "nile_listner_role" {
  listener_arn = "${aws_lb_listener.nile-university-listner.arn}"
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.nile-university_target.arn}"
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}




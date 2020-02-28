resource "aws_lb_target_group" "terraformdemo" {
  port        = var.alb_port
  protocol    = var.alb_protocol
  target_type = var.alb_target_type
  vpc_id      = var.vpc_id
  health_check {
    path = var.alb_path
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb" "terraformdemo" {
  name               = var.asg_name
  internal           = var.alb_internal
  load_balancer_type = var.alb_load_balancer_type
  security_groups    = [aws_security_group.allow_web.id]
  subnets            = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Terraform = true
  }
}

# listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.terraformdemo.arn
  port              = var.alb_port
  protocol          = var.alb_protocol
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraformdemo.arn
  }
}

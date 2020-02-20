resource "aws_autoscaling_group" "bastion" {
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  #health_check_type         = "EC2"
  desired_capacity     = var.desired_capacity
  force_delete         = true
  launch_configuration = aws_launch_configuration.as_conf.name
  vpc_zone_identifier  = var.subnet_id
  availability_zones   = var.azs

  tags = var.tags
  #role_arn = "arn:aws:iam::020351640293:role/system/instance_role"
  depends_on = [aws_launch_configuration.as_conf]
}

#ALB
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "allow http traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_web" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_web.id
}

resource "aws_security_group_rule" "allow_web_egress" {
  type        = "egress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_web.id
}

#ec2
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow ssh traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_ssh.id
}

resource "aws_security_group_rule" "allow_ec2_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_ssh.id
}

resource "aws_security_group_rule" "allow_alb" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.allow_web.id

  security_group_id = aws_security_group.allow_ssh.id
}

resource "aws_security_group_rule" "allow_alb_e" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.allow_web.id

  security_group_id = aws_security_group.allow_ssh.id
}

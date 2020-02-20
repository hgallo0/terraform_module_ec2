data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
  #owners = ["020351640293"] # amazon
}



data "template_file" "default" {
  template = "${file("${var.userdata_file}")}"
}

resource "aws_launch_configuration" "as_conf" {
  #name = var.config_name
  image_id = data.aws_ami.ubuntu.id
  #image_id             = var.image_id
  instance_type = var.instance_type
  user_data     = data.template_file.default.rendered
  key_name      = var.ssh_key
  #security_groups = var.security_groups
  security_groups = [aws_security_group.allow_ssh.id]
  #iam_instance_profile = var.bastion_role
  lifecycle {
    create_before_destroy = true
  }
}

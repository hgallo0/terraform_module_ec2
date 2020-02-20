# launch configuration
variable "userdata_file" {
  description = "userdata script to prime ec2 instances"
}
variable "instance_type" {
  description = "the type of ec2 instance to utilize, e.g. t2.micro"
}
variable "ssh_key" {
  description = "the ssh key to in your AWS account to be able to access instances via ssh"
}

# autoscaling group
variable "asg_name" {
  description = "the name of the autoscaling group"
}
variable "max_size" {
  default = "the max number of instances you can have running in the asg"
}
variable "min_size" {
  description = "the min number of instances you can have running in the asg"
}
variable "desired_capacity" {
  description = "the desired number of intances you'd like to run"
}
variable "instance_name" {
  description = "the name that the instances will display at the ec2 dashboard running instances"
}
variable "azs" {
  #type = list
  default = "list of availability zones"
}
variable "subnet_id" {
  default = "the id of the subnets"
}
variable "tags" {
  description = "list of tags to attach to the instance"
}
/*variable "security_groups" {
  description = "security groups attach to the instances"
}*/
# alb
variable "vpc_id" {
  description = "the id of the VPC in which we are working in"
}
/*variable "security_groups_alb" {
  description = "security groups for the alb"
}*/
variable "alb_port" {
  description = "the ingress port for the applicaion load balancer"
}
variable "alb_protocol" {
  description = "the ingress protocol for the applicaion load balancer"
}
# security group rule
/*variable "security_group_id_rule" {
  description = "security group id for rule"
}*/
# alb variables
variable "alb_target_type" {
  description = "the type of target ip, instance, etc"
}
variable "alb_path" {
  description = "the path followed by the root url to check health status, it helps to allow registration against the alb"
}
variable "alb_internal" {
  description = "this is a boolean to front the ALB externally or internally"
  default     = false
}
variable "alb_load_balancer_type" {
  description = "type of load balancer"
  default     = "application"
}

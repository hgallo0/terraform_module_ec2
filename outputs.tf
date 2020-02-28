output "alb_url" {
  value = aws_lb.terraformdemo.dns_name
}

resource "aws_lb" "alb" {
  name               = "timing-alb"
  internal           = var.internet
  load_balancer_type = var.lb_type
  security_groups    = var.security_groups
  subnets            = var.subnet_ids
idle_timeout = var.timeout
  enable_deletion_protection = true

  

  tags = {
    Environment = "production"
  }
}
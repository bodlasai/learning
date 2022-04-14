provider "aws"{
  region     = "us-east-2"
}

resource "aws_lb" "myalb" {
  name               = "applb"
  load_balancer_type = "application"
  subnets            = ["subnet-0a6dd76d8c894a04c", "subnet-0e1a96f5172c8d3cf"]
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_lb_target_group" "mytarget" {
  name        = "mytarget-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_default_vpc.default.id
   health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    path                = "/"
    interval            = 30
  }
}

resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mytarget.arn
  }
}
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.mytarget.arn
  target_id        = aws_instance.myec2.id
}
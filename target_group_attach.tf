resource "aws_lb_target_group" "test" {
  name     = "jyoti-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-c0705cba"
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.web.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "test_attach_2" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.web2.id
  port             = 80
}
resource "aws_lb_target_group" "ecs_tg" {
  name        = "${var.cluster_name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path = "/api/method/ping"
  }
}
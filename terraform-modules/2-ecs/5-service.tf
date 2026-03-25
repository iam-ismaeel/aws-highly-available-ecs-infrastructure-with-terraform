resource "aws_ecs_service" "app" {
  name            = "app"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
  target_group_arn = aws_lb_target_group.ecs_tg.arn
  container_name   = "ismail-app"
  container_port   = 80
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

 depends_on = [aws_lb_listener.http]
}


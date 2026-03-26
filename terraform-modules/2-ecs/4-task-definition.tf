resource "aws_ecs_task_definition" "app" {
  family                   = "app"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"

  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  task_role_arn      = aws_iam_role.task_role.arn

  container_definitions = jsonencode([
    {
      name  = "ismail-app"
      image = var.image
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
       logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.ecs.name
        awslogs-region        = var.region
        awslogs-stream-prefix = "ecs"
      }
    } 
    }
  ])
}

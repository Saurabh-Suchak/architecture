resource "aws_ecs_cluster" "app_cluster" {
  name = "${var.project_name}-cluster"
}

resource "aws_ecs_task_definition" "app_task" {
  family                   = "app-microservice"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name        = "app-container"
      image       = var.docker_image
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

output "cluster_name" {

  value       = aws_ecs_cluster.app_cluster.name
}


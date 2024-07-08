resource "aws_ecs_service" "main" {
  name            = "gamesglobal-ecommerce-service"
  cluster         = module.ecs_cluster.cluster_id
  task_definition = module.ecs_task_definition.task_definition_arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnets
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "ecommerce-service"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.main]
}

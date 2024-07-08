resource "aws_ecs_cluster" "main" {
  name = "gamesglobal-ecommerce-cluster"
}

output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

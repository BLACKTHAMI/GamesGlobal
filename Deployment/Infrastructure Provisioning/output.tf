output "ecs_cluster_id" {
  value = module.ecs_cluster.cluster_id
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

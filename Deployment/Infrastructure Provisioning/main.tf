provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source = "./vpc"
}

module "ecs_cluster" {
  source          = "./ecs-cluster"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "ecs_service" {
  source                = "./cluster-service"
  cluster_id            = module.ecs_cluster.cluster_id
  task_definition_arn   = module.ecs_service.task_definition_arn
  desired_count         = 3
  vpc_id                = module.vpc.vpc_id
  private_subnets       = module.vpc.private_subnets
}

module "rds" {
  source          = "./rds"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "s3" {
  source = "./s3-bucket"
}

module "cloudwatch" {
  source = "./cloudwatch"
}

module "ci_cd" {
  source = "./ci-cd-pipeline"
}


output "root_aurora_cluster_endpoint" {
  description = "Endpoint for the Aurora Postgres cluster from the module."
  value       = module.aws_rds_cluster.aurora_cluster_endpoint
}

output "root_aurora_cluster_instance" {
  description = "Endpoint for the Aurora Postgres cluster from the module."
  value       = module.aws_rds_cluster.aurora_cluster_instance
}

output "root_s3_bucket_arn" {
  description = "Endpoint for the Aurora Postgres cluster from the module."
  value       = module.s3_bucket.s3_bucket_arn
}

output "root_s3_bucket_id" {
  description = "Endpoint for the Aurora Postgres cluster from the module."
  value       = module.s3_bucket.s3_bucket_id
}
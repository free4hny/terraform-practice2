output "aurora_cluster_endpoint" {
  description = "The connection endpoint for the Aurora Postgres cluster."
  value       = aws_rds_cluster.ts_cluster.endpoint
}

output "aurora_cluster_instance" {
  description = "The connection endpoint for the Aurora Postgres cluster."
  value       = aws_rds_cluster_instance.aurora_instance.endpoint
}
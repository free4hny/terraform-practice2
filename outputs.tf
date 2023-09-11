output "aurora_endpoint" {
  value = aws_rds_cluster.aurora_postgres_cluster.endpoint
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.target_bucket.arn
}
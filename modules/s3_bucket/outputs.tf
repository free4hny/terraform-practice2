output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.."
  value       = aws_s3_bucket.ts-bucket.arn
}

output "s3_bucket_id" {
  description = "The connection endpoint for the Aurora Postgres cluster."
  value       = aws_s3_bucket.ts-bucket.id
}
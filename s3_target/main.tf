resource "aws_s3_bucket" "target_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}
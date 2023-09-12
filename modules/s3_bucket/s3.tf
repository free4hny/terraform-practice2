resource "aws_s3_bucket" "ts-bucket" {
  bucket = "my-s3-bucket-abhi1"
  acl    = "private"

  tags = {
    Name        = "test"
    Environment = "Development"
  }
}


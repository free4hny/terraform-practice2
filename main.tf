provider "aws" {
  region = "us-east-2" # Change this to your desired region
}

module "aurora_postgres" {
  source      = "./aurora_postgres"
  db_name     = "mydbname"
  db_user     = "myuser"
  db_password = "mypassword"
}

module "s3_target" {
  source      = "./s3_target"
  bucket_name = "my-dms-target-bucket"
}

resource "aws_dms_endpoint" "source_endpoint" {
  database_name = module.aurora_postgres.db_name
  endpoint_id   = "source-endpoint"
  endpoint_type = "source"
  engine_name   = "aurora"
  username      = module.aurora_postgres.db_user
  password      = module.aurora_postgres.db_password
}

resource "aws_dms_endpoint" "target_endpoint" {
  endpoint_id   = "target-endpoint"
  endpoint_type = "target"
  engine_name   = "s3"
  bucket_name   = module.s3_target.bucket_name
}

resource "aws_dms_replication_instance" "dms_replication_instance" {
  replication_instance_id          = "my-dms-replication-instance"
  replication_instance_class       = "dms.r4.large"
  allocated_storage                = 20
}

resource "aws_dms_replication_task" "dms_replication_task" {
  migration_type            = "full-load"
  table_mappings            = jsonencode({
    rules = [
      {
        rule-type    = "selection"
        rule-id      = "1"
        rule-name    = "1"
        object-locator = {
          schema-name = "my-schema"
          table-name  = "my-table"
        }
        rule-action = "include"
      }
    ]
  })
  replication_task_id      = "my-dms-replication-task"
  source_endpoint_arn      = aws_dms_endpoint.source_endpoint.arn
  target_endpoint_arn      = aws_dms_endpoint.target_endpoint.arn
  replication_instance_arn = aws_dms_replication_instance.dms_replication_instance.arn
}

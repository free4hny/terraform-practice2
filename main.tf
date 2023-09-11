module "aurora_cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = "test-aurora-db-postgres-TS"
  engine         = "aurora-postgresql"
  engine_version = "14.5"
  username = var.aurora_username
  password = var.password
  instance_class = "db.t2.small"
  instances = {
    one = {}
    2 = {
      instance_class = "db.t2.small"
    }
  }

  vpc_id               = "vpc-08a1b8d567baacd6e"
  db_subnet_group_name = "db-subnet-group-TS"
  security_group_rules = {
    ex1_ingress = {
      cidr_blocks = ["10.20.0.0/20"]
    }
    ex1_ingress = {
      source_security_group_id = "sg-05bdf8bfbd66de4e5"
    }
  }

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  enabled_cloudwatch_logs_exports = ["postgresql"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
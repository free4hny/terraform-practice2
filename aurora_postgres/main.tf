resource "aws_rds_cluster" "aurora_postgres_cluster" {
  cluster_identifier      = "my-aurora-cluster"
  engine                  = "aurora-postgresql"
  master_username         = var.db_user
  master_password         = var.db_password
  skip_final_snapshot     = true
}

resource "aws_rds_cluster_instance" "aurora_postgres_instance" {
  identifier         = "my-aurora-instance"
  cluster_identifier = aws_rds_cluster.aurora_postgres_cluster.id
  instance_class     = "db.r4.large"
  engine             = "aurora-postgresql"
}
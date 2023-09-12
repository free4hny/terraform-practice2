resource "aws_rds_cluster" "ts_cluster" {
  cluster_identifier              = "my-aurora-cluster"
  engine                          = "aurora-postgresql"
  master_username                 = "postgres"
  master_password                 = "password"
  skip_final_snapshot             = true
  vpc_security_group_ids          = ["sg-05bdf8bfbd66de4e5"]  # Your existing security group
  db_subnet_group_name            = "tssubnetgroup" # Your existing DB subnet group name
  availability_zones              = ["us-east-1a", "us-east-1b"]    # Adjust based on your region and available zones
  # lifecycle {
  #   prevent_destroy = true
  # }
}


resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier              = aws_rds_cluster.ts_cluster.id
  identifier                      = "my-aurora-instance-ts"
  # ami                             = "ami-01c647eace872fc02"
  instance_class                  = "db.t3.medium"
  engine                          = "aurora-postgresql"
  publicly_accessible             = false
  db_subnet_group_name            = "tssubnetgroup"  # Your existing DB subnet group name
}


provider "aws" {
  region = "us-east-1"  # Adjust to your preferred region
}

resource "aws_rds_cluster" "TS_cluster" {
  cluster_identifier              = "my-aurora-cluster"
  engine                          = "aurora-postgresql"
  master_username                 = "postgres"
  master_password                 = "password"
  skip_final_snapshot             = true
  vpc_security_group_ids          = ["ssg-05bdf8bfbd66de4e5"]  # Your existing security group
  db_subnet_group_name            = "tssubnetgroup" # Your existing DB subnet group name
  availability_zones              = ["us-east-1a", "us-east-1b"]    # Adjust based on your region and available zones
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier              = aws_rds_cluster.TS_cluster.id
  identifier                      = "my-aurora-instance-TS"
  instance_class                  = "db.t2.small"
  engine                          = "aurora-postgresql"
  publicly_accessible             = false
  db_subnet_group_name            = "tssubnetgroup"  # Your existing DB subnet group name
}

# Output the endpoint for connection
output "aurora_endpoint" {
  value = aws_rds_cluster.TS_cluster.endpoint
}
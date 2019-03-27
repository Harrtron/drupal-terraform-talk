resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "${var.project_name}-auroracluster"
  engine                  = "aurora-mysql"
  availability_zones      = ["${data.aws_availability_zones.available.zone_ids}"]
  database_name           = "${var.project_name}-db"
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}
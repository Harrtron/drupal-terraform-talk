resource "aws_db_subnet_group" "subnet_group" {
  name = "${var.project_name}"
  subnet_ids = ["${var.vpc_private_subnets}"]
}

resource "aws_db_instance" "rds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  name = "${var.project_name}"
  username = "${var.project_name}admin"
  password = "${var.project_name}pw"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.subnet_group.name}"
  vpc_security_group_ids = ["${var.instance_db_sg}"]
  skip_final_snapshot = true
}
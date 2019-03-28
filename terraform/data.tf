data "aws_availability_zones" "available" {
}

data "aws_vpc" "default" {
    filter = {
        name = "tag:Name"
        values = ["${var.vpc_name}"]
    }
}

data "aws_subnet_ids" "subnet_ids" {
    vpc_id = "${data.aws_vpc.default.id}"
}
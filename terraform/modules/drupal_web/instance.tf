data "aws_ami" "linux" {
    most_recent = "true"
    owners = ["amazon"]

filter {
    name = "name"
    values = ["amzn-ami-*-x86_64-gp2"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
}

resource "aws_instance" "drupal_web" {
    ami = "${data.aws_ami.linux.id}"
    instance_type = "t3.micro"
    user_data = "${data.template_file.user_data.rendered}"
    key_name = "${var.keypair_name}"
    vpc_security_group_ids = ["${aws_security_group.instance_to_lb.id}","${aws_security_group.instance_to_db.id}", "${aws_security_group.instance_egress.id}"]
}

resource "aws_security_group" "instance_to_lb" {
    name = "${var.project_name}-instance-sg"
    description = "Traffic between instance and LB"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        self = 1
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        self = 1
    }
}

resource "aws_security_group" "instance_egress" {
    name = "${var.project_name}-instance-egress"
    description = "Egress traffic from instnace"
    vpc_id = "${var.vpc_id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "instance_to_db" {
    name = "${var.project_name}-instance_to_db"
    description = "Traffic between instance and DB"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        self = 1
    }
}
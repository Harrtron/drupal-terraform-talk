resource "aws_security_group" "loadbalancer_inbound" {
    name = "${var.project_name}-loadbalancer_inbound"
    description = "Allow HTTP inbound"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_elb" "loadbalancer" {
    name = "${var.project_name}-loadbalancer"
    availability_zones = ["${var.instance_az}"]
    security_groups = ["${aws_security_group.loadbalancer_inbound.id}", "${var.instance_sg}"]

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "TCP:80"
        interval = 30
    }

    instances = ["${var.instance_id}"]
    cross_zone_load_balancing = false

}

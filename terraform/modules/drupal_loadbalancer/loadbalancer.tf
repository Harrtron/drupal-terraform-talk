resource "aws_security_group" "loadbalancer_inbound" {
    name = "${var.project_name}-loadbalancer_inbound"
    description = "Allow HTTPS inbound"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_lb" "loadbalancer" {
    name = "${var.project_name}-loadbalancer"
    internal = false
    load_balancer_type = "application"
    security_groups = ["${aws_security_group.loadbalancer_inbound.id}"]
    subnets = ["${var.subnet_id}"]
}

resource "aws_lb_listener" "listener" {
    load_balancer_arn = "${aws_lb.loadbalancer.arn}"
    port = "443"
    protocol = "HTTPS"

    default_action {
        type = "forward"
        target_group_arn = "${aws_lb_target_group.targetgroup.arn}"
    }
}
resource "aws_lb_target_group" "targetgroup" {
    name = "${var.project_name}-targetgroup"
    port = 80
    protocol = "HTTP"
}

resource "aws_lb_target_group_attachment" "target_group_attachment" {
    target_group_arn = "${aws_lb_target_group.targetgroup.arn}"
    target_id = "${var.instance_id}"
    port = 80
}
/*
resource "aws_route53_record" "record" {
    zone_id = "${data.aws_route53_zone.hosted_zone.id}"
    name = "${var.project_name}.${data.aws_route53_zone.hosted_zone.name}"
    type = "A"
    alias {
        name = "${var.loadbalancer_dns}"
        zone_id = "${var.loadbalancer_zoneid}"
        evaluate_target_health = false
    }
}
*/
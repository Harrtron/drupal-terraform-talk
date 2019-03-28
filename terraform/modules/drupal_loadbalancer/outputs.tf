output "loadbalancer_dns" {
    value = "${aws_elb.loadbalancer.dns_name}"
}

output "loadbalancer_zoneid" {
    value = "${aws_elb.loadbalancer.zone_id}"
}
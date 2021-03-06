/*
// Not using HTTPS, using HTTP as do not have a R53 hosted zone.
resource "aws_acm_certificate" "sslcert" {
    domain_name = "${var.project_name}.${var.domain_name}"
    validation_method = "DNS"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_route53_record" "cert_validation" {
  name    = "${aws_acm_certificate.sslcert.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.sslcert.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.hosted_zone.id}"
  records = ["${aws_acm_certificate.sslcert.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}
*/
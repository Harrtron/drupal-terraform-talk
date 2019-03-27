output "instance_id" {
    value = "${aws_instance.drupal_web.id}"
}

output "subnet_id" {
    value = "${aws_instance.drupal_web.subnet_id}"
}

output "availability_zone" {
    value = "${aws_instance.drupal_web.availability_zone}"
}
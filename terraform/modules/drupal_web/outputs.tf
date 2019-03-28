output "instance_id" {
    value = "${aws_instance.drupal_web.id}"
}

output "subnet_id" {
    value = "${aws_instance.drupal_web.subnet_id}"
}

output "instance_az" {
    value = "${aws_instance.drupal_web.availability_zone}"
}

output "instance_sg" {
    value = "${aws_security_group.instance_to_lb.id}"
}

output "instance_db_sg" {
    value = "${aws_security_group.instance_to_db.id}"
}
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
}
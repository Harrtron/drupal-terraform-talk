module "drupal_web" {
    project_name = "${var.project_name}"
    vpc_id = "${data.aws_vpc.default.id}"
    keypair_name = "${var.keypair_name}"
    source = "./modules/drupal_web"
}

module "drupal_db" {
    project_name = "${var.project_name}"
    instance_az = "${module.drupal_web.instance_az}"
    instance_db_sg = "${module.drupal_web.instance_db_sg}"
    vpc_private_subnets = ["${data.aws_subnet_ids.subnet_ids.ids}"]
    source = "./modules/drupal_db"
}

module "drupal_loadbalancer" {
    project_name = "${var.project_name}"
    subnet_id = "${module.drupal_web.subnet_id}"
    instance_id = "${module.drupal_web.instance_id}"
    instance_az = "${module.drupal_web.instance_az}"
    vpc_id = "${data.aws_vpc.default.id}"
    instance_sg = "${module.drupal_web.instance_sg}"
    source = "./modules/drupal_loadbalancer"
}
module "drupal_web" {
    project_name = "${var.project_name}"
    source = "./modules/drupal_web"
}

module "drupal_db" {
    project_name = "${var.project_name}"
    source = "./modules/drupal_db"
}

module "drupal_loadbalancer" {
    project_name = "${var.project_name}"
    subnet_id = "${module.drupal_web.subnet_id}"
    instance_id = "${module.drupal_web.instance_id}"
    source = "./modules/drupal_loadbalancer"
}
terraform {
    backend "s3" {
        bucket = "hthorne-terraform-backend"
        key = "state/"
        region = "eu-west-1"
    }
}
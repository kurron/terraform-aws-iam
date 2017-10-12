terraform {
    required_version = ">= 0.10.6"
    backend "s3" {}
}

module "iam" {
    source = "../"

    region      = "us-west-2"
    project     = "Debug"
    environment = "development"
}

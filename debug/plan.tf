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

output "default_ecs_role_id" {
    value = "${module.iam.default_ecs_role_id}"
}

output "arn" {
    value = "${module.iam.arn}"
}

output "profile" {
    value = "${module.iam.profile}"
}

output "cross_account_ecr_pull_role_id" {
    value = "${module.iam.cross_account_ecr_pull_role_id}"
}

output "cross_account_ecr_pull_role_arn" {
    value = "${module.iam.cross_account_ecr_pull_role_arn}"
}

output "cross_account_ecr_pull_profile_id" {
    value = "${module.iam.cross_account_ecr_pull_profile_id}"
}

output "start_stop_role_id" {
    value = "${module.iam.start_stop_role_id}"
}

output "start_stop_role_arn" {
    value = "${module.iam.start_stop_role_arn}"
}

output "start_stop_profile_id" {
    value = "${module.iam.start_stop_profile_id}"
}

output "dynamic_dns_role_id" {
    value = "${module.iam.dynamic_dns_role_id}"
}

output "dynamic_dns_role_arn" {
    value = "${module.iam.dynamic_dns_role_arn}"
}

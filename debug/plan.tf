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

output "ecs_role_id" {
    value = "${module.iam.ecs_role_id}"
}

output "ecs_role_arn" {
    value = "${module.iam.ecs_role_arn}"
}

output "ecs_role_profile" {
    value = "${module.iam.ecs_role_profile}"
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

output "ec2_park_role_id" {
    value = "${module.iam.ec2_park_role_id}"
}

output "ec2_park_role_arn" {
    value = "${module.iam.ec2_park_role_arn}"
}

output "ec2_park_profile_id" {
    value = "${module.iam.ec2_park_profile_id}"
}

output "dynamic_dns_role_id" {
    value = "${module.iam.dynamic_dns_role_id}"
}

output "dynamic_dns_role_arn" {
    value = "${module.iam.dynamic_dns_role_arn}"
}

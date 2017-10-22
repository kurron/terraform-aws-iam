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

output "ecs_profile_id" {
    value = "${module.iam.ecs_profile_id}"
}

output "docker_role_id" {
    value = "${module.iam.docker_role_id}"
}

output "docker_role_arn" {
    value = "${module.iam.docker_role_arn}"
}

output "docker_profile_id" {
    value = "${module.iam.docker_profile_id}"
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

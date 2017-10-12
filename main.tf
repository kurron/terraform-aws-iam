terraform {
    required_version = ">= 0.10.6"
    backend "s3" {}
}

provider "aws" {
    region     = "${var.region}"
}

# === construct a role that allows auto-registration of EC2 instances to Route53
resource "aws_iam_role" "dynamic_dns" {
    name_prefix        = "dynamic-dns-"
    description        = "Allows Lambda instances to assume required roles"
    assume_role_policy = "${file( "${path.module}/files/dynamic-dns/trust.json" )}"
}

resource "aws_iam_role_policy" "dynamic_dns" {
    name_prefix = "dynamic-dns-"
    role        = "${aws_iam_role.dynamic_dns.id}"
    policy      = "${file("${path.module}/files/dynamic-dns/permissions.json")}"
}

# === construct a role that allows starting/stopping EC2 instances on a schedule
resource "aws_iam_role" "ec2_start_stop" {
    name_prefix        = "start-stop-"
    description        = "Allows Lambda instances to assume required roles"
    assume_role_policy = "${file( "${path.module}/files/ec2-start-stop/trust.json" )}"
}

resource "aws_iam_role_policy" "ec2_start_stop" {
    name_prefix = "start-stop-"
    role        = "${aws_iam_role.ec2_start_stop.id}"
    policy      = "${file("${path.module}/files/ec2-start-stop/permissions.json")}"
}

resource "aws_iam_instance_profile" "ec2_start_stop" {
    name_prefix = "start-stop-"
    role        = "${aws_iam_role.ec2_start_stop.name}"
}

# === construct a role that allows pulling from ECR
resource "aws_iam_role" "cross_account_ecr_pull_role" {
    name_prefix        = "ecr-pull-"
    description        = "Allows EC2 instances to assume required roles"
    assume_role_policy = "${file( "${path.module}/files/ecr-pull/trust.json" )}"
}

resource "aws_iam_role_policy" "cross_account_ecr_pull_role_policy" {
    name_prefix = "ecr-pull-"
    role        = "${aws_iam_role.cross_account_ecr_pull_role.id}"
    policy      = "${file("${path.module}/files/ecr-pull/permissions.json")}"
}

resource "aws_iam_instance_profile" "cross_account_ecr_pull_profile" {
    name_prefix = "ecr-pull-"
    role        = "${aws_iam_role.cross_account_ecr_pull_role.name}"
}

# construct a role that allow ECS instances to interact with load balancers
resource "aws_iam_role" "default_ecs_role" {
    name_prefix = "ecs-role"
    description = "Allows ECS workers to assume required roles"
    assume_role_policy = "${file( "${path.module}/files/ecs/trust.json" )}"
}

resource "aws_iam_role_policy" "default_ecs_service_role_policy" {
    name_prefix = "ecs-service-role-${var.project}-${var.environment}-"
    role = "${aws_iam_role.default_ecs_role.id}"
    policy = "${file( "${path.module}/files/ecs/permissions.json" )}"
}

resource "aws_iam_instance_profile" "default_ecs" {
    name_prefix = "ecs-instance-profile-${var.project}-${var.environment}-"
    role        = "${aws_iam_role.default_ecs_role.name}"
}

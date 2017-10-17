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
resource "aws_iam_role" "ec2_park" {
    name_prefix        = "ec2-park-"
    description        = "Allows Lambda instances to assume required roles"
    assume_role_policy = "${file( "${path.module}/files/ec2-park/trust.json" )}"
}

resource "aws_iam_role_policy" "ec2_park" {
    name_prefix = "ec2-park-"
    role        = "${aws_iam_role.ec2_park.id}"
    policy      = "${file("${path.module}/files/ec2-park/permissions.json")}"
}

resource "aws_iam_instance_profile" "ec2_park" {
    name_prefix = "park-"
    role        = "${aws_iam_role.ec2_park.name}"
}

# === construct a role that allows EC2 to perform Docker related operations
resource "aws_iam_role" "docker_role" {
    name_prefix        = "docker-"
    description        = "Allows EC2 instances to perform Docker related tasks"
    assume_role_policy = "${file( "${path.module}/files/docker/trust.json" )}"
}

resource "aws_iam_role_policy" "docker_role_policy" {
    name_prefix = "docker-"
    role        = "${aws_iam_role.docker_role.id}"
    policy      = "${file("${path.module}/files/docker/permissions.json")}"
}

resource "aws_iam_instance_profile" "docker_profile" {
    name_prefix = "docker-"
    role        = "${aws_iam_role.docker_role.name}"
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

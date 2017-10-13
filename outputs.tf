output "ecs_role_id" {
    value = "${aws_iam_role.default_ecs_role.id}"
    description = "ID for the ECS role"
}

output "ecs_role_arn" {
    value = "${aws_iam_role.default_ecs_role.arn}"
    description = "ARN for the ECS role"
}

output "ecs_role_profile" {
    value = "${aws_iam_instance_profile.default_ecs.id}"
    description = "ID for the ECS profile"
}

output "cross_account_ecr_pull_role_id" {
    value = "${aws_iam_role.cross_account_ecr_pull_role.id}"
    description = "ID for the cross-account ECR pulling role"
}

output "cross_account_ecr_pull_role_arn" {
    value = "${aws_iam_role.cross_account_ecr_pull_role.arn}"
    description = "ARN for the cross-account ECR pulling role"
}

output "cross_account_ecr_pull_profile_id" {
    value = "${aws_iam_instance_profile.cross_account_ecr_pull_profile.id}"
    description = "ID for the cross-account ECR pulling profile"
}

output "ec2_park_role_id" {
    value = "${aws_iam_role.ec2_park.id}"
    description = "ID for the EC2 park role"
}

output "ec2_park_role_arn" {
    value = "${aws_iam_role.ec2_park.arn}"
    description = "ARN for the EC2 park role"
}

output "ec2_park_profile_id" {
    value = "${aws_iam_instance_profile.ec2_park.id}"
    description = "ID for the EC2 park profile"
}

output "dynamic_dns_role_id" {
    value = "${aws_iam_role.dynamic_dns.id}"
    description = "ID for the dynamic DNS role"
}

output "dynamic_dns_role_arn" {
    value = "${aws_iam_role.dynamic_dns.arn}"
    description = "ARN for the dynamic DNS role"
}

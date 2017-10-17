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

output "docker_role_id" {
    value = "${aws_iam_role.docker_role.id}"
    description = "ID for the EC2 Docker role"
}

output "docker_role_arn" {
    value = "${aws_iam_role.docker_role.arn}"
    description = "ARN for the EC2 Docker role"
}

output "docker_profile_id" {
    value = "${aws_iam_instance_profile.docker_profile.id}"
    description = "ID for the EC2 Docker profile"
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

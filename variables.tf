variable "region" {
    type = "string"
    description = "The AWS region to deploy into, e.g. us-east-1"
}

variable "project" {
    type = "string"
    description = "Name of the project this resource is being created for, e.g. violet-sloth"
}

variable "environment" {
    type = "string"
    description = "Context the resources will be used in, e.g. production"
}

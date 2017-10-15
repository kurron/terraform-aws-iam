# Overview
This Terraform module creates a collection of IAM roles that can be used in
a variety of situations.

Created roles include:
* allows a Lambda function to "park" EC2 instances by stopping them
* allows for pulling Docker images from ECR
* allows EC2 instances to interact with load balancers

# Prerequisites
* [Terraform](https://terraform.io/) installed and working
* Development and testing was done on [Ubuntu Linux](http://www.ubuntu.com/)

# Building
Since this is just a collection of Terraform scripts, there is nothing to build.

# Installation
This module is not installed but, instead, is obtained by the project using
the module.  See [kurron/terraform-environments](https://github.com/kurron/terraform-environments)
for example usage.

# Tips and Tricks

## Debugging
The `debug` folder contains files that can be used to test out local changes
to the module.  Edit `backend.cfg` and `plan.tf` to your liking and
then run `debug/debug-module.sh` to test your changes.

# Troubleshooting

# License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

# List of Changes

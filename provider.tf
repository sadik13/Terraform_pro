provider "aws" {
 region     = var.region
 access_key = var.access_key
 secret_key = var.secret_key
}

resource "aws_iam_policy" "policy" {
	name = "ec2_instance_read_access"

policy =  file("ec2access.json")

}


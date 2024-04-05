# In Homework repo, create a new folder Homework 2 and create Terraform file(s):
# Create a key in AWS with the name Bastion-key with Terraform
# Create 2 S3 buckets: 1st with the name: kaizen-yourname, 2nd with the name: kaizen and add prefix.
# Create manually two more buckets (with any names) and import them to terraform code.
# Provide import commands as a comment in the file
# Confirm you can delete them running terraform destroy.
# creates users: jenny,  rose, lisa, jisoo with for_each
# create group blackpink
# add users: jenny,  rose, lisa, jisoo to the blackpink group with for loop
# Push everything to GitHub and provide repository link below in comments.
# After you are done move to Verification (DON’T MOVE TO DONE) - We will move it to Done from 





provider "aws" {
  region = "us-east-1"
}

# resource "aws_key_pair" "deployer" {
#   key_name   = "bastion-key"
# public_key = file("~/.ssh/id_rsa.pub")
# }

# resource "aws_s3_bucket" "example" {
#   bucket = "kaizen-zakir123"
#   force_destroy = true
# }

# resource "aws_s3_bucket" "example2" {
#   bucket_prefix = "kaizen-"
#   force_destroy = true
# }

# terraform import aws_s3_bucket.example3 kaizen-chicago-1
# resource "aws_s3_bucket" "example3" {
#   bucket_prefix = "kaizen-chicago-1"
#   force_destroy = true
# }

# terraform import aws_s3_bucket.example4 kaizen-chicago-2
# resource "aws_s3_bucket" "example4" {
#   bucket_prefix = "kaizen-chicago-2"
#   force_destroy = true
# }

resource "aws_iam_user" "k-pop" {
    for_each = toset ([
        "jenny",
        "rose",
        "lisa",
        "jisoo",
        ])
  name = each.key
}

resource "aws_iam_group" "create_group" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "team" {
  name = "bl"

  users = [
    for i in aws_iam_user.k-pop : i.name
  ]

  group = aws_iam_group.create_group.name
}
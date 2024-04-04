/**
Create new repo terraform-homework in GitHub. Clone the repo and create folder Homework1, cd to the folder and write a Terraform script that:
   creates users: jenny, rose, lisa, jisoo
   creates users: jihyo, sana, momo, dahyun
   creates groups: blackpink, twice
   add users: jenny, rose, lisa, jisoo to the blackpink group
   add users: jihyo, sana, momo, dahyun to the twice group

Create two users manually in AWS Console (attach 0 policies): miyeon and mina
and import them to Terraform. (provide terraform import commands in main.tf file as a comment)
Modify Terraform configuration file to add user miyeon to the blackpink group and user mina to the twice group and apply changes.
Finally, run terraform destroy to confirm you can delete all resources: created by Terraform and manually created.
Push the code to GitHub and send me GitHub URL.

**/
# terraform import aws_iam_user.user9 miyeon
# terraform import aws_iam_user.user8 mina


resource "aws_iam_user" "user" {
  name = "jenny"
}

resource "aws_iam_user" "user8" {
  name = "mina"
}

resource "aws_iam_user" "user9" {
  name = "miyeon"
}



resource "aws_iam_user" "user1" {
  name = "rose"
}

resource "aws_iam_user" "user2" {
  name = "lisa"
}

resource "aws_iam_user" "user3" {
  name = "jisoo"
}

resource "aws_iam_user" "user4" {
  name = "jihyo"
}

resource "aws_iam_user" "user5" {
  name = "sana"
}

resource "aws_iam_user" "user6" {
  name = "momo"
}

resource "aws_iam_user" "user7" {
  name = "dahyun"
}

resource "aws_iam_group" "group" {
  name = "blackpink"
}

resource "aws_iam_group" "group2" {
  name = "twice"
}

resource "aws_iam_group_membership" "membersonly" {
  name = "blackpink-membership"

  users = [
    aws_iam_user.user.name,
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
    aws_iam_user.user9.name,
  ]

  group = aws_iam_group.group.name
} 


resource "aws_iam_group_membership" "membersonly2" {
  name = "twice-membership"

  users = [
    aws_iam_user.user4.name,
    aws_iam_user.user5.name,
    aws_iam_user.user6.name,
    aws_iam_user.user7.name,
    aws_iam_user.user8.name,
  ]

  group = aws_iam_group.group2.name
} 

# terraform-homework
Please create tfvars file and input your data.

If you would like to create ec2 inctance in us-east-1 do:
region = "us-east-1"              #replace us-east-1 to any other region as requared 
                                   ex. (us-east-2, us-west-1, us-west-2)
availability_zone = "us-east-1a"  #pick your az (a...c)
Use 1 of 4 default by region instance ami id:
ami_id = "ami-051f8a213df8bc089"  #default ami id for us-east-1 region
ami_id = "ami-0900fe555666598a2"  #default ami id for us-east-2 region
ami_id = "ami-0b990d3cfca306617"  #default ami id for us-west-1 region
ami_id = "ami-0395649fbe870727e"  #default ami id for us-west-2 region
type = "t2.micro"                 #default instance type
ec2_count = 1                     #instance quantity





terraform {
  backend "s3" {
    bucket         = "kaizen-zakir-chi"
    key            = "us-regions/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "lock-state"
  }
}
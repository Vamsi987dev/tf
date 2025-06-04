terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "81s-state-bucket"
    key            = "ec2-key"
    region         = "us-east-1"
    dynamodb_table = "81s-locking"
  }
}



provider "aws" {
  region = "us-east-1"
}
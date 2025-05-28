terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket         = "81s-state-bucket"
    key            = "demo-key"
    region         = "us-east-1"
    dynamodb_table = "81s-locking"
  }
}



provider "aws" {
  region = "us-east-1"
}
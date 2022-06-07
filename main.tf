provider "aws" {
  region = "us-east-1"
}

locals {
  Tag__env = "${terraform.workspace}-ifedorov"
  NameBucket = "ifedorov" 
}

resource "aws_s3_bucket" "bucket" {
  bucket = "ifedorov"

  tags = {
    Name = local.NameBucket 
    Description = local.Tag__env
    Enviroment = "TEST"
  }
}

resource "aws_s3_bucket_acl" "acl" {
    bucket = aws_s3_bucket.bucket.id
    acl = "private"  
}
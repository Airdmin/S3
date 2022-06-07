variable "var_access_key" {
  description = "AWS_ACCESS_KEY_ID"
  type        = string
  default = "AWS_ACCESS_KEY_ID"
  sensitive = true
}

variable "var_secret_access_key" {
  description = "AWS_SECRET_ACCESS_KEY"
  type        = string
  default = "AWS_SECRET_ACCESS_KEY"
  sensitive = true
}

provider "aws" {
  region = "us-east-1"
  access_key = var.var_access_key
  secret_key = var.var_secret_access_key
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
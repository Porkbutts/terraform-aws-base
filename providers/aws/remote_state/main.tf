variable "s3_bucket_name_prefix" {}
variable "dynamodb_name_prefix" {}

provider "aws" {
  region = "us-west-2"
}

resource "random_string" "hash" {
  length = 8
  upper = false
  number = false
  special = false
}

resource "aws_s3_bucket" "terraform_state_s3_bucket" {
  bucket = "${var.s3_bucket_name_prefix}-${random_string.hash.result}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "Terraform State File Storage"
  }
}

resource "aws_dynamodb_table" "terraform_state_locking_dynamodb" {
  name = "${var.dynamodb_name_prefix}-${random_string.hash.result}"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "Terraform State File Locking"
  }
}

output "s3_bucket_name" {
  value = "${aws_s3_bucket.terraform_state_s3_bucket.bucket}"
}

output "dynamodb_name" {
  value = "${aws_dynamodb_table.terraform_state_locking_dynamodb.name}"
}

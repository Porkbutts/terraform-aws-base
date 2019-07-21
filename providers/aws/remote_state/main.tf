variable "s3_bucket_name" {}
variable "dynamodb_table_name" {}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state_s3_bucket" {
  bucket = "${var.s3_bucket_name}"

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
  name = "${var.dynamodb_table_name}"
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

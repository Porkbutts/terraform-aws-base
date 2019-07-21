terraform {
  backend "s3" {
    encrypt = true
    bucket = "tf-state-s3-nyrckrpg"
    dynamodb_table = "tf-state-dynamo-nyrckrpg"
    region = "us-west-2"
    key = "remote_state/terraform.tfstate"
  }
}

variable "name"              { }
variable "region"            { }

variable "vpc_cidr"        { }
variable "azs"             { }
variable "private_subnets" { }
variable "public_subnets"  { }

# variable "mongodb_atlas_username" {}
# variable "mongodb_atlas_api_key" {}
# variable "mongodb_atlas_org_id" {}

# variable "bastion_instance_type" { }

provider "aws" {
  region = "${var.region}"
}

# provider "mongodbatlas" {
#   username = "${var.mongodb_atlas_username}"
#   api_key = "${var.mongodb_atlas_api_key}"
# }
#
# module "mongodb" {
#   source = "../../../modules/atlas/mongodb"
#   mongodb_atlas_org_id = "${var.mongodb_atlas_org_id}"
# }

module "network" {
  source = "../../../modules/aws/network"

  name            = "${var.name}"
  vpc_cidr        = "${var.vpc_cidr}"
  azs             = "${var.azs}"
  region          = "${var.region}"
  private_subnets = "${var.private_subnets}"
  public_subnets  = "${var.public_subnets}"

  # bastion_instance_type = "${var.bastion_instance_type}"
}

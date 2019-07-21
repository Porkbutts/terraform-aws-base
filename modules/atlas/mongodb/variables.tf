variable "mongodb_atlas_org_id" {}

variable "project_name" {
  description = "Atlas MongoDB free-tier general purpose database"
  default = "default"
}

variable "cluster_name" { default = "default" }
variable "cluster_tier" { default = "M0" }
variable "region" { default = "US_WEST_2" }
variable "mongodb_major_version" { default = "4.0" }

variable "database_user_default_password" { default = "mongodb" }

variable "atlas_cidr_block" { default = "172.31.248.0/21" }
variable "whitelist_cidr_block" { default = "192.168.0.0/16" }

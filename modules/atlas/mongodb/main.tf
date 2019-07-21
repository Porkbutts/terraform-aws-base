locals {
  shared = "${contains(list("M0","M2", "M5"), var.cluster_tier)}"
}

# Create a Group
resource "mongodbatlas_project" "default" {
  org_id = "${var.mongodb_atlas_org_id}"
  name = "${var.project_name}"
}

# Create a Group IP Whitelist
resource "mongodbatlas_ip_whitelist" "default" {
  group = "${mongodbatlas_project.default.id}"
  cidr_block = "${var.whitelist_cidr_block}"
  comment = "default"
}

# Create a Container
resource "mongodbatlas_container" "default" {
  group = "${mongodbatlas_project.default.id}"
  atlas_cidr_block = "${var.atlas_cidr_block}"
  provider_name = "AWS"
  region = "${var.region}"
}

# Create a Cluster
resource "mongodbatlas_cluster" "default" {
  depends_on = ["mongodbatlas_container.default"]
  name = "${var.cluster_name}"
  group = "${mongodbatlas_project.default.id}"
  mongodb_major_version = "${var.mongodb_major_version}"
  provider_name = "${local.shared ? "TENANT" : "AWS"}"
  backing_provider = "${local.shared ? "AWS" : ""}"
  region = "${var.region}"
  size = "${var.cluster_tier}"
  backup = false
  disk_gb_enabled = "${!local.shared}"
  disk_size_gb = "${local.shared ? 0 : 10}"
}

# Create a Database User
resource "mongodbatlas_database_user" "default" {
  username = "default"
  password = "${var.database_user_default_password}"
  database = "admin"
  group = "${mongodbatlas_project.default.id}"
  roles {
    name = "read"
    database = "admin"
  }
}

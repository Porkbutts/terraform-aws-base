# Atlas MongoDB terraform plugin

## Installation
Download the appropriate binary from [terraform-provider-mongodbatlas/releases](https://github.com/akshaykarle/terraform-provider-mongodbatlas/releases)

Move the binary to your terraform plugins folder and rename it without the platform portion of the name.

For example, if you're on mac:
```
mv terraform-provider-mongodbatlas_v1.1.0_darwin_amd64 \
  ~/.terraform.d/plugins/terraform-provider-mongodbatlas_v1.1.0
```

## Notes
Atlas MongoDB API does not support the free tier M0 cluster.
VPC peering is not supported for M0, M2, M5 clusters either.

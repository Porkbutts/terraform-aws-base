#--------------------------------------------------------------
# General
#--------------------------------------------------------------

name              = "staging"
region            = "us-west-2"

#--------------------------------------------------------------
# Network
#--------------------------------------------------------------

vpc_cidr        = "192.168.0.0/16"
azs             = "us-west-2a,us-west-2b,us-west-2c,us-west-2d"
private_subnets = "192.168.1.0/24,192.168.2.0/24,192.168.3.0/24,192.168.4.0/24"
public_subnets  = "192.168.11.0/24,192.168.12.0/24,192.168.13.0/24,192.168.14.0/24"

# Bastion
# bastion_instance_type = "t2.micro"

#--------------------------------------------------------------
# Atlas MongoDB
#--------------------------------------------------------------

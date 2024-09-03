# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }

# module "security_group" {
#   source      = "./modules/security_group"
#   name        = var.security_group_name
#   description = var.security_group_description
#   ingress_ports = var.security_group_ingress_ports
# }

# module "instance_sonar" {
#   source             = "./modules/ec2_instance"
#   ami                = var.ami_sonar
#   instance_type      = var.instance_type_sonar
#   key_name           = var.key_name
#   security_group_ids = [module.security_group.id]
#   user_data_file     = "./install/sonar.sh"
#   user_data_vars     = {}
#   name               = var.name_sonar
#   root_volume_size   = var.root_volume_size_sonar
# }

# module "instance_jenkins" {
#   source             = "./modules/ec2_instance"
#   ami                = var.ami_jenkins
#   instance_type      = var.instance_type_jenkins
#   key_name           = var.key_name
#   security_group_ids = [module.security_group.id]
#   user_data_file     = "./install/jenkins.sh"
#   user_data_vars     = {}
#   name               = var.name_jenkins
#   root_volume_size   = var.root_volume_size_jenkins
# }
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "security_group" {
  source        = "./modules/security_group"
  name          = var.security_group_name
  description   = var.security_group_description
  ingress_ports = var.security_group_ingress_ports
}

module "instance_sonar" {
  source             = "./modules/ec2_instance"
  ami                = var.ami_sonar
  instance_type      = var.instance_type_sonar
  key_name           = var.key_name
  security_group_ids = [module.security_group.id]
  user_data_file     = "./install/sonar.sh"
  user_data_vars     = {}
  name               = var.name_sonar
  root_volume_size   = var.root_volume_size_sonar
}

module "instance_jenkins" {
  source             = "./modules/ec2_instance"
  ami                = var.ami_jenkins
  instance_type      = var.instance_type_jenkins
  key_name           = var.key_name
  security_group_ids = [module.security_group.id]
  user_data_file     = "./install/jenkins.sh"
  user_data_vars     = {}
  name               = var.name_jenkins
  root_volume_size   = var.root_volume_size_jenkins
}

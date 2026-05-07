terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "axel-terraform-state-12345"
    key    = "./infra/terraform/terraform.tfstate"
    region = "eu-central-1"
  }
}


provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

module "network" {
  source      = "./modules/network"
  name_prefix = "portfolio"
  vpc_id      = data.aws_vpc.default.id
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name

  vpc_security_group_ids = [
    module.network.security_group_id
  ]

  tags = {
    Name = "devops-portfolio"
  }
}

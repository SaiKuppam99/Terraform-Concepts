terraform {
  backend "s3" {
    bucket = "s3-backend-saivaiku"
    key    = "function.tfstate"
    region = "eu-west-2"
  }
}
resource "aws_vpc" "vpc_name" {
  cidr_block = var.vpc_cidr_block_value

  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
resource "aws_internet_gateway" "internet_gateway_name" {
  vpc_id = aws_vpc.vpc_name.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

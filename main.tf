provider "aws" {
  profile = "terraform"
  region = "us-west-2"
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "practice-vpc"
  cidr = "10.0.0.0/16"

  azs = ["us-west-2a"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
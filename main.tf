terraform {
  required_version = ">= 1.7.0"

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

/* VPC / subnet lookup – reuse default for quick demo */
data "aws_vpc" "default"      { default = true }
data "aws_subnet_ids" "pub"   { vpc_id = data.aws_vpc.default.id }
data "aws_subnet"     "first" { id     = data.aws_subnet_ids.pub.ids[0] }

/* Key pair */
module "key_pair" {
  source          = "./modules/key_pair"
  key_name        = var.key_name
  public_key_path = var.public_key_path
}

/* Security group */
module "sg" {
  source = "./modules/security_group"
  vpc_id = data.aws_vpc.default.id
}

/* IAM profile */
module "iam" {
  source        = "./modules/iam"
  profile_name  = var.profile_name
}

/* DynamoDB table */
module "dynamodb" {
  source      = "./modules/dynamodb"
  table_name  = var.dynamodb_table_name
}

/* AMI lookup (Ubuntu 22.04 LTS x86_64) */
data "aws_ami" "ubuntu_22" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

/* EC2 instance */
module "ec2" {
  source               = "./modules/ec2"
  ami_id               = data.aws_ami.ubuntu_22.id
  instance_type        = var.instance_type
  subnet_id            = data.aws_subnet.first.id
  sg_id                = module.sg.id
  key_name             = module.key_pair.name
  instance_profile     = module.iam.instance_profile_name
  instance_name_prefix = var.instance_name_prefix
}

# output "instance_ip" { value = module.ec2.public_ip }
# output "table_name"  { value = module.dynamodb.name }

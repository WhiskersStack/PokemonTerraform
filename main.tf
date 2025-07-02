data "aws_vpc" "default" {
  default = true
}
module "key" {
  source = "./modules/key"
}
module "security_group" {
  source   = "./modules/security_group"
  name     = "allow_ssh"
  vpc_id   = data.aws_vpc.default.id
  ssh_cidr = "0.0.0.0/0" # You can restrict this to your IP
}
module "ec2" {
  source                 = "./modules/ec2"
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.security_group.security_group_id]
  # tags = var.tags
}


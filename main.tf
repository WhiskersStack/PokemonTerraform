module "key" {
  source = "./modules/key"
}
module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = module.key.private_key_file

}


module "key" {
  source = "./modules/key"
}
module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  # key_name      = module.key.key_name
  # Remove: key_name      = module.key.key_name
  # key_name = "MyKeyPair.pem" # Use the key name directly instead of the module output
}


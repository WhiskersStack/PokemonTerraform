variable "ami_id"               { type = string }
variable "instance_type"        { type = string }
variable "subnet_id"            { type = string }
variable "sg_id"                { type = string }
variable "key_name"             { type = string }
variable "instance_profile"     { type = string }
variable "instance_name_prefix" { type = string }

resource "aws_instance" "pokemon" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name
  iam_instance_profile   = var.instance_profile
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Name = "${var.instance_name_prefix}-pokemon"
  }
}

output "public_ip" { value = aws_instance.pokemon.public_ip }
output "id"        { value = aws_instance.pokemon.id }

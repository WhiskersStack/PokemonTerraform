variable "aws_region"          { type = string  default = "us-west-2" }
variable "key_name"            { type = string  default = "MyKeyPair" }
variable "public_key_path"     { type = string  default = "~/.ssh/id_rsa.pub" }
variable "profile_name"        { type = string  default = "LabInstanceProfile" }
variable "dynamodb_table_name" { type = string  default = "Pokemon" }
variable "instance_type"       { type = string  default = "t3.micro" }
variable "instance_name_prefix"{ type = string  default = "pokemon-demo" }

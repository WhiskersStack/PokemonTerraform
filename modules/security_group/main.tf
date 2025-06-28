# variable "vpc_id" { type = string }

resource "aws_security_group" "ssh_only" {
  name        = "pokemon_ssh"
  description = "Allow SSH from anywhere – dev only"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# output "id" { value = aws_security_group.ssh_only.id }

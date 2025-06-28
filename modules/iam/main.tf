variable "profile_name" { type = string }

data "aws_iam_policy_document" "ec2" {
  statement {
    actions   = ["sts:AssumeRole"]
    effect    = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2" {
  name               = "${var.profile_name}-role"
  assume_role_policy = data.aws_iam_policy_document.ec2.json
}

resource "aws_iam_instance_profile" "this" {
  name = var.profile_name
  role = aws_iam_role.ec2.name
}

output "instance_profile_name" { value = aws_iam_instance_profile.this.name }

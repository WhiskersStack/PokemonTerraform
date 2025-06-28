output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2.public_ip
}

output "table_name" {
  description = "Name of the DynamoDB table"
  value       = module.dynamodb.name
}

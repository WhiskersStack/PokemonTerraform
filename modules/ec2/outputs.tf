output "instance_id" {
  value = aws_instance.pokemon_game.id
}

output "security_group_id" {
  value = aws_instance.pokemon_game.vpc_security_group_ids[0]
}
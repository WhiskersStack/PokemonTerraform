variable "table_name" { type = string }

resource "aws_dynamodb_table" "pokemon" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "PokemonID"

  attribute {
    name = "PokemonID"
    type = "S"
  }
}

/* Seed a demo item */
resource "null_resource" "seed" {
  provisioner "local-exec" {
    command = <<EOT
      aws dynamodb put-item                 --table-name ${aws_dynamodb_table.pokemon.name}                 --item '{"PokemonID":{"S":"001"}, "Name":{"S":"Bulbasaur"}}'
    EOT
  }
  triggers = { table = aws_dynamodb_table.pokemon.name }
}

output "name" { value = aws_dynamodb_table.pokemon.name }

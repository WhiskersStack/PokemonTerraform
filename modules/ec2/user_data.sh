#!/bin/bash
set -e
sudo apt-get update -y
sudo apt-get install -y git
cd /home/ubuntu
git clone https://github.com/WhiskersStack/PokemonWithDynamoDB.git

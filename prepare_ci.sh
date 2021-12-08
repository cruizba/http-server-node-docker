#!/bin/bash
set -eu -o pipefail
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update -y && sudo apt install -y docker-ce
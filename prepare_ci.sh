#!/bin/bash
set -eu -o pipefail
sudo apt update -y && sudo apt install -y curl jq docker.io
#!/bin/bash
set -eu -o pipefail
apt update -y && apt install -y curl jq docker.io
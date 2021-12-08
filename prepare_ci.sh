#!/bin/bash
set -oe pipefail
apt update -y && apt install -y curl jq docker.io
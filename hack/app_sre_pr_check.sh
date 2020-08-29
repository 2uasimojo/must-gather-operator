#!/bin/bash

# AppSRE team CD

set -exv

CURRENT_DIR=$(dirname "$0")

python "$CURRENT_DIR"/validate_yaml.py "$CURRENT_DIR"/../deploy/crds
if [ "$?" != "0" ]; then
    exit 1
fi

BASE_IMG="must-gather-operator"
IMG="${BASE_IMG}:latest"

IMG="$IMG" make container-build

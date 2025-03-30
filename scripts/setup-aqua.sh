#!/bin/bash
set -eu

# aqua CLI version
AQUA_VERSION="v2.46.0"

# Directory to install aqua
mkdir -p ${AQUA_ROOT_DIR}/bin

# Download and install aqua CLI
curl -sSfL -o /tmp/aqua.tar.gz "https://github.com/aquaproj/aqua/releases/download/${AQUA_VERSION}/aqua_linux_amd64.tar.gz"
tar -xzf /tmp/aqua.tar.gz -C /tmp
mv /tmp/aqua ${AQUA_ROOT_DIR}/bin/

# Set permissions
chmod +x ${AQUA_ROOT_DIR}/bin/aqua

# Test command
echo "aqua version: $(${AQUA_ROOT_DIR}/bin/aqua --version)"

# Remove temporary files
rm -f /tmp/aqua.tar.gz

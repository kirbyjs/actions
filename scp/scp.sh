#!/usr/bin/env bash

set -e

SSH_DIR="$HOME/.ssh"

mkdir ${SSH_DIR} && ssh-keyscan -t rsa $INPUT_HOST >> ${SSH_DIR}/known_hosts
echo "$INPUT_KEY" > "${SSH_DIR}/deploy_key"

chmod 700 "${SSH_DIR}"
chmod 600 "${SSH_DIR}/known_hosts"
chmod 600 "${SSH_DIR}/deploy_key"

eval $(ssh-agent)
ssh-add "${SSH_DIR}/deploy_key"

scp -o StrictHostKeyChecking=no -r $INPUT_LOCAL_FILES $INPUT_USERNAME@$INPUT_HOST:$INPUT_REMOTE_LOCATION

#!/usr/bin/env bash

set -e

mkdir $HOME/.ssh && ssh-keyscan -t rsa $INPUT_HOST >> $HOME/.ssh/known_hosts
echo "$INPUT_KEY" > "$SSH_PATH/deploy_key"

chmod 700 "$HOME/.ssh"
chmod 600 "$HOME/.ssh/known_hosts"
chmod 600 "$HOME/.ssh/deploy_key"

eval $(ssh-agent)
ssh-add "$HOME/.ssh/deploy_key"
ssh -o StrictHostKeyChecking=no -A -tt $INPUT_USERNAME@$INPUT_HOST $command

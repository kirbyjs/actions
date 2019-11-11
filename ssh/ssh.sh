#!/usr/bin/env bash

set -e

mkdir $HOME/.ssh && ssh-keyscan -t rsa $host >> $HOME/.ssh/known_hosts
echo "$key" > "$SSH_PATH/deploy_key"

chmod 700 "$HOME/.ssh"
chmod 600 "$HOME/.ssh/known_hosts"
chmod 600 "$HOME/.ssh/deploy_key"

eval $(ssh-agent)
ssh-add "$HOME/.ssh/deploy_key"
ssh -o StrictHostKeyChecking=no -A -tt $username@$host $command

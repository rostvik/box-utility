#!/bin/env bash

sudo chown -R vscode:vscode /mnt/mise-data
mkdir -p /commandhistory
sudo touch /commandhistory/.bash_history
sudo chown -R vscode:vscode /commandhistory

mkdir -p /home/vscode/.ssh
cp /ssh_config /home/vscode/.ssh/config
touch /home/vscode/.ssh/known_hosts

mise trust -a
#mise use -g node@lts
echo "export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" >> /home/vscode/.bashrc
echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc
echo 'source <(mise completion bash --include-bash-completion-lib)' >> /home/vscode/.bashrc

eval "$(mise activate bash)"

echo "aaa - ${CONTAINER_PYTHON_VENV}"

sudo mkdir -p "${CONTAINER_PYTHON_VENV}"
sudo chown -R vscode:vscode "${CONTAINER_PYTHON_VENV}"

mise i
mise repo

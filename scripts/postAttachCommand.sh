#!/bin/bash

echo "Now: gh codespace ports visibility 8080:public -c $CODESPACE_NAME"
gh codespace ports visibility 8080:public -c $CODESPACE_NAME

echo "gh codespace ports visibility 8080:public -c $CODESPACE_NAME" >> ~/.bashrc

sudo npm install -g @githubnext/github-copilot-cli
echo "install -g @githubnext/github-copilot-cli"
eval "$(github-copilot-cli alias -- "$0")"

echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

echo "TOKENS"
env | grep TOKEN
env | grep TOKEN >> ./scripts/postAttachCommand.txt

pwd >> ./scripts/postAttachCommand.txt
source ./scripts/progress_env.sh >> ./scripts/postAttachCommand.txt

source ./scripts/progress_setup.sh >> ./scripts/postAttachCommand.txt

exit 0
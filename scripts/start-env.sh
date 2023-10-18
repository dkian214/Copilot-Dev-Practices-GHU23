#!/bin/bash

#pwd
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo apt-get install -y mongodb

sudo service mongodb start

eval "$(github-copilot-cli alias -- "$0")"
echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

sed -i "s/shiny-acorn-v64jvpv96xwhp9g4-8080.app.github.dev/${CODESPACE_NAME}-8080.app.github.dev/g" ./frontend/src/http-common.js
#!/bin/bash

npm install -g npm@latest 

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y mongodb

sudo service mongodb start
sudo service mongodb enable

#./mongodb-database-tools/mongoimport --collection='listingsAndReviews' --file='./mongodb-dataset/sample_airbnb.json' --uri 'mongodb://127.0.0.1:27017/sample_airbnb'
mongoimport --collection='listingsAndReviews' --file='./mongodb-dataset/sample_airbnb.json' --uri 'mongodb://127.0.0.1:27017/sample_airbnb'

npm install -g @githubnext/github-copilot-cli
echo "install -g @githubnext/github-copilot-cli"
eval "$(github-copilot-cli alias -- "$0")"

echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

cd backend
npm install

cd ../frontend
npm install

#sed -i "s/shiny-acorn-v64jvpv96xwhp9g4-8080.app.github.dev/${CODESPACE_NAME}-8080.app.github.dev/g" ./frontend/src/http-common.js

#node server.js

echo "TOKENS"
env | grep TOKEN

# Install powershell

sudo apt-get install -y wget apt-transport-https software-properties-common && source /etc/os-release
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb && sudo dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb
sudo apt-get update -y && sudo apt-get install -y powershell

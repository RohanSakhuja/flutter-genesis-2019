#!/bin/bash
### These lines implement the basic cockraochdb install
### https://www.cockroachlabs.com/docs/build-a-nodejs-app-with-cockroachdb.html
cd ~/.data

# Download and extract the latest binary
if [ ! -f ~/.data/cockroach ]; then
    echo "Installing CockroachDB"
    wget -N https://binaries.cockroachdb.com/cockroach-latest.linux-amd64.tgz
    tar xfz cockroach-latest.linux-amd64.tgz
    mv ./cockroach-v2.1.4.linux-amd64/cockroach .
    rm cockroach-latest.linux-amd64.tgz
    rm -rf ./cockroach-v2.1.4.linux-amd64
    rm -rf .wget-hsts

    # Instead of following instrutions and copying cockroach to /usr/bin,
    # Let's set up an alias. This avoids needing to escalation permissions.
    echo 'alias cockroach="~/.data/cockroach"' >> ~/.bash_profile
    source ~/.bash_profile
    
    echo "CockroachDB installed"
else
    echo "CockroachDB is already installed"
fi
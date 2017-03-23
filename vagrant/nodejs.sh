#!/usr/bin/env bash

source /vagrant/vagrant/bashurator/init.sh

# Setup the environment.
configure_nodejs() {

    # Instance Node.js
    apt-get install -y nodejs

    # enable either node or nodejs at the command line
    # enable node binary
    if [ ! -e /usr/bin/node ]; then
        ln -s /usr/bin/nodejs /usr/bin/node
    fi

    # Use the latest version of npm
    npm install -g npm

}

# Execute the function above, in an idempotent function.
bashurator.configure "nodejs" configure_nodejs

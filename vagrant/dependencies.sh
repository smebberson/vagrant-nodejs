#!/usr/bin/env bash

source /vagrant/vagrant/bashurator/init.sh

# Setup the environment.
configure_dependencies() {

    # Install yeoman
    npm install -g yo

}

# Execute the function above, in an idempotent function.
bashurator.configure "dependencies" configure_dependencies

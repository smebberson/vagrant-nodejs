#!/usr/bin/env bash

source /vagrant/vagrant/bashurator/init.sh

# Setup the environment.
configure_git() {

    # Install Git.
    apt-get install -y git

}

# Execute the function above, in an idempotent function.
bashurator.configure "git" configure_git

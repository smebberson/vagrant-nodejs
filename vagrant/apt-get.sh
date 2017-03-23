#!/usr/bin/env bash

source /vagrant/vagrant/bashurator/init.sh

# Setup the environment.
configure_apt_get() {

    # Update apt-get.
    apt-get update

    # Required for add-apt-repository.
    apt-get install -y software-properties-common build-essential zip unzip curl

    # Node.js v7
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

    # Required for latest git
    add-apt-repository ppa:git-core/ppa

    # Update apt-get.
    apt-get update

}

# Execute the function above, in an idempotent function.
bashurator.configure "apt-get" configure_apt_get

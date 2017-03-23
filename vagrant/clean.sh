#!/usr/bin/env bash

source /vagrant/vagrant/bashurator/init.sh

# Setup the environment.
configure_clean() {

    # update clean
    apt-get clean

}

# Execute the function above, in an idempotent function.
bashurator.configure "clean" configure_clean

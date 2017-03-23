#!/usr/bin/env bash

source /vagrant/vagrant/bashurator/init.sh

TIMEZONE="$1"

# Setup the environment.
configure_timezone() {

    # set Adelaide as the local timezone
    echo "$TIMEZONE" | tee /etc/timezone

    # Setup in Ubuntu
    dpkg-reconfigure --frontend noninteractive tzdata

}

# Execute the function above, in an idempotent function.
bashurator.configure "timezone" configure_timezone

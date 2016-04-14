#!/usr/bin/env bash

# set timezone

if [ ! -e /etc/vagrant/timezone ]
  then

  echo ">>> setting up timezone to $1"

  # set Adelaide as the local timezone
  echo "$1" | tee /etc/timezone

  dpkg-reconfigure --frontend noninteractive tzdata

  # only run once
  touch /etc/vagrant/timezone

else

  echo ">>> timezone is already setup"

fi

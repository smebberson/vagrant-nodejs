#!/usr/bin/env bash

if [ ! -n "$1" ]
then
    echo "Please define which provision step you'd like to reset..."
else
    # used to quickly and easily reset an installation step
    sudo rm "/etc/bashurator/$1"
fi

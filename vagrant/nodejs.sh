#!/usr/bin/env bash

if [ ! -e /etc/vagrant/nodejs ]
then

	echo ">>> setting up nodejs"

	# install nodejs
	apt-get install -y nodejs
	apt-get install -y npm

	# update npm
	sudo npm install npm -g

	# only run once
	touch /etc/vagrant/nodejs

else

	echo ">>> nodejs already setup..."

fi

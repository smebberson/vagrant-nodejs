#!/usr/bin/env bash

if [ ! -e /etc/vagrant/ngrok ]
then

	echo ">>> setting up ngrok"

	# install ngrok
	curl -sSLo /tmp/ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
	unzip -d /bin /tmp/ngrok.zip
	rm /tmp/ngrok.zip

	# only run once
	touch /etc/vagrant/ngrok

else

	echo ">>> ngrok is already setup"

fi

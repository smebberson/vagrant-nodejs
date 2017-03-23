
bashurator.init() {

    # this will create a directory '/etc/vagrant' if it doesn't exist
    # each vagrant provision step will create a file within this folder
    # to determine if it needs to run again

    # if you want to run a particular step on a subsequent 'vagrant up', simply remove the file
    # if you want to run all steps on a subsequent 'vagrant up', simple remove the /etc/vagrant folder

    if [ ! -e /etc/bashurator ]; then

        # Create a directory to store our idempotent states.
    	mkdir /etc/bashurator

        # make some of our helper scripts executable
        chmod a+x /vagrant/vagrant/bashurator/scripts/reset.sh
        chmod a+x /vagrant/vagrant/bashurator/scripts/run.sh

        # Install the helper scripts.
        if [ ! -e /usr/local/bin/bashurator-reset ]; then
            ln -s /vagrant/vagrant/bashurator/scripts/reset.sh /usr/local/bin/bashurator-reset
    	fi

        if [ ! -e /usr/local/bin/bashurator-run ]; then
            ln -s /vagrant/vagrant/bashurator/scripts/run.sh /usr/local/bin/bashurator-run
    	fi

    fi

}

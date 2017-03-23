
bashurator.configure() {

    if [ ! -e "/etc/bashurator/$1" ]
    then

    	echo ">>> configuration stage: $1"

        $2

    	# only run once
    	touch "/etc/bashurator/$1"

    else
    	echo ">>> configuration skipped: $1"
    fi

}

#!/bin/bash
#
# Run mediawiki in a docker container environment.

# If we are talking to a mariadb/mysql instance in a linked container
# (aliased "db" on port 3306), then we need to dynamically update the
# MW config to refer to the correct DB server IP address.
#
# Docker will set the DB_PORT_3306_TCP_ADDR env variable to the right
# IP in this case.
#
# We'll update lines like
#   $wgDBserver = "localhost";
# to point to the correct location.

if [ "x$DB_PORT_3306_TCP_ADDR" != "x" ] ; then
    # For initial configuration, it's also considerate to update the
    # default settings that drive the config screen defaults
    sed -i 's/^\$wgDBserver =.*$/\$wgDBserver = "'$DB_PORT_3306_TCP_ADDR'";/' /usr/share/mediawiki/includes/DefaultSettings.php

    # Only update LocalSettings if they already exist; on initial
    # setup they will not yet be here
    if [ -f /var/www/html/wiki/LocalSettings.php ] ; then
	sed -i 's/^\$wgDBserver =.*$/\$wgDBserver = "'$DB_PORT_3306_TCP_ADDR'";/' /var/www/html/wiki/LocalSettings.php
	sed -i 's/^\$wgServer =.*$/\$wgServer = "http:\/\/'$HOST_IP'";/' /var/www/html/wiki/LocalSettings.php
    fi
fi

# Finally fall through to the apache startup script that the apache
# Dockerfile (which we build on top of here) sets up

exec /usr/sbin/init

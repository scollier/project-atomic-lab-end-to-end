#!/bin/bash
#
# The mediawiki rpm installs into /var/www/wiki.  We need to symlink this into
# the served /var/www/html/ tree to make them visible.
#
# Standard config will put these in /var/www/html/wiki (ie. visible at
# http://$HOSTNAME/wiki )

mkdir -p /var/www/html/wiki

cd /var/www/html/wiki
ln -sf ../../wiki/* .

# We want /var/www/html/wiki to be usable as a data volume, so it's
# important that persistent data lives here, not in /var/www/wiki.

chmod 711 .
rm -f images
mkdir images
chown apache.apache images

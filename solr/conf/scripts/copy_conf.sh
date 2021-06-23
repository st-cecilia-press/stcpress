#!/bin/bash
if [ -d "/var/solr/data/earlymusic/conf" ]
then
  cp -R /opt/solr/server/solr/configsets/earlymusic/conf/* /var/solr/data/earlymusic/conf
fi

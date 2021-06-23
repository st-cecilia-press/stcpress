FROM solr:8

LABEL maintainer="nique.rio@gmail.com"
COPY conf/earlymusic-conf /opt/solr/server/solr/configsets/earlymusic/conf
COPY conf/scripts /scripts
CMD ["solr-precreate", "earlymusic", "/opt/solr/server/solr/configsets/earlymusic", ";", "/scripts/copy_conf.sh"]

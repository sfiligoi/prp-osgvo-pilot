FROM opensciencegrid/osgvo-docker-pilot:3.6-release

COPY scripts/21_advertise_lancium_provisioner.sh /etc/osg/image-init.d/21_advertise_lancium_provisioner.sh
COPY scripts/31_fix_shared_config.sh /etc/osg/image-init.d/31_fix_shared_config.sh 

# Lancium does not support env variables or
# arbitrary file locations, so be have to
# pass everything through the cmdline

RUN mv /usr/local/sbin/supervisord_startup.sh /usr/local/sbin/supervisord_startup.osg.sh
COPY scripts/supervisord_startup.sh /usr/local/sbin/supervisord_startup.sh
RUN chmod a+rx /usr/local/sbin/supervisord_startup.sh


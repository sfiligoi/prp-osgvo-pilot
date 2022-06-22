#!/bin/bash

# nested singularity fails if this is set
export SINGULARITY_BIND=
unset SINGULARITY_BIND

# convert all the arguments to env variables
while [[ $1 ]]
do
    k="$1"
    shift
    v="$1"
    shift
    export "$k"=$"$v"
done

# expect the token in a fixed location
export TOKEN=`cat prp-wn.token`
rm -f prp-wn.token

# OSGVO pilot does not like it when one sets the CONDOR_HOST env
export CONDOR_HOST=
unset CONDOR_HOST

exec /usr/local/sbin/supervisord_startup.osg.sh

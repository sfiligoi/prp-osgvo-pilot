#!/bin/bash

# nested singularity fails if this is set
export SINGULARITY_BIND=
unset SINGULARITY_BIND

# expect the token in a fixed location
export TOKEN=`cat prp-wn.token`
rm -f prp-wn.token

# convert all the arguments to env variables
while [[ $1 ]]
do
    k="$1"
    shift
    v="$1"
    shift
    export "$k"=$"$v"
done


exec /usr/local/sbin/supervisord_startup.osg.sh

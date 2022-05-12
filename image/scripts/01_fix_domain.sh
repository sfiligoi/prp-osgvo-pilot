#!/bin/bash

if [ "x${K8S_NAMESPACE}" == "x" ]; then
  K8S_NAMESPACE=osg-opportunistic
fi
if [ "x${PHYSICAL_HOSTNAME}" == "x" ]; then
  PHYSICAL_HOSTNAME=me
fi
if [ "x${K8S_DOMAIN}" == "x" ]; then
  K8S_DOMAIN=nrp-nautilus.io
fi

# let's keep . for separators only
hstr=`echo "${PHYSICAL_HOSTNAME}" | tr '.' '-'`

# k8s nodes have no domain, which is annoying
# Add it here
export DOMAIN=${hstr}.${K8S_NAMESPACE}.${K8S_DOMAIN}

cp /etc/hosts /tmp/hosts && sed "s/\(${HOSTNAME}\)/\1\.${DOMAIN} \1/" /tmp/hosts > /etc/hosts && rm -f /tmp/hosts

old_hostname=${HOSTNAME}
export HOSTNAME=${old_hostname}.${DOMAIN}

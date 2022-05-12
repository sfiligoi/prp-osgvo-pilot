#!/bin/bash


#
# Embed the namespace and physical hostname in the condor name
#

if [ "x${K8S_NAMESPACE}" != "x" ]; then
  echo "NETWORK_HOSTNAME = \$(NETWORK_HOSTNAME)-${K8S_NAMESPACE}" >> "${PILOT_CONFIG_FILE}"
fi
if [ "x${PHYSICAL_HOSTNAME}" != "x" ]; then
  # let's keep . for separators only
  hstr=`echo "${PHYSICAL_HOSTNAME}" | tr '.' '-'`
  echo "NETWORK_HOSTNAME = \$(NETWORK_HOSTNAME)-${hstr}" >> "${PILOT_CONFIG_FILE}"
fi


#!/bin/bash


#
# Advertise the lancium provisioner
#

if [ "x${LANCIUM_PROVISIONER_TYPE}" != "x" ]; then
  echo "LanciumProvisionerType=\"${LANCIUM_PROVISIONER_TYPE}\"" >> "${PILOT_CONFIG_FILE}"
  echo 'STARTD_EXPRS = $(STARTD_EXPRS) LanciumProvisionerType'  >> "${PILOT_CONFIG_FILE}"
fi

if [ "x${LANCIUM_PROVISIONER_NAME}" != "x" ]; then
  echo "LanciumProvisionerName=\"${LANCIUM_PROVISIONER_NAME}\"" >> "${PILOT_CONFIG_FILE}"
  echo 'STARTD_EXPRS = $(STARTD_EXPRS) LanciumProvisionerName'  >> "${PILOT_CONFIG_FILE}"
fi

if [ "x${LANCIUM_JOB_NAME}" != "x" ]; then
  echo "LanciumJobName=\"${LANCIUM_JOB_NAME}\"" >> "${PILOT_CONFIG_FILE}"
  echo 'STARTD_EXPRS = $(STARTD_EXPRS) LanciumJobName'  >> "${PILOT_CONFIG_FILE}"
  #also inject job name into the startd name
  sed -i "s/\(NETWORK_HOSTNAME = .*\)-$(hostname)/\1-${LANCIUM_JOB_NAME}-$(hostname)/" "${PILOT_CONFIG_FILE}"
fi


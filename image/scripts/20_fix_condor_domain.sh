#!/bin/bash

if [ "x${DOMAIN}" == "x" ]; then
  # should nover get in here, but just in case
  DOMAIN=local
fi

echo "NETWORK_HOSTNAME = \$(NETWORK_HOSTNAME).${DOMAIN}" >> "${PILOT_CONFIG_FILE}"


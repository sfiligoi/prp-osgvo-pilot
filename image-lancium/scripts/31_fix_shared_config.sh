#
# Shared port daemon expects a fixed port, not appropriate for a pilot
#
echo "SHARED_PORT_PORT=0" >> "${PILOT_CONFIG_FILE}"

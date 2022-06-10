#
# Shared port daemon expects a fixed port, not appropriate for a pilot
#
echo "USE_SHARED_PORT=false" >> "${PILOT_CONFIG_FILE}"

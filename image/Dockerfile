FROM opensciencegrid/osgvo-docker-pilot:3.6-release

# Tweaked singularity for container environments
# Remove default singularity from path, too
COPY scripts/singularity_npid.sh /usr/bin/singularity_npid.sh
RUN mv /usr/bin/singularity /usr/bin/singularity.org && \
    chmod a+x /usr/bin/singularity_npid.sh && \
    ln -s /usr/bin/singularity_npid.sh /usr/bin/singularity

# We want to be able to add system-level changes
# and run without explicit privilege drop
RUN mv /bin/entrypoint.sh /bin/entrypoint.osg.sh
COPY scripts/entrypoint.sh /bin/entrypoint.sh
RUN chmod a+rx /bin/entrypoint.sh

# PRP nodes come without a domain
# fix it at runtime
COPY scripts/20_advertise_k8s_domain.sh /etc/osg/image-init.d/20_advertise_k8s_domain.sh

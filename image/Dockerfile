FROM opensciencegrid/osgvo-docker-pilot:3.6-release

# Tweaked singularity for container environments
# Remove default singularity from path, too
ADD scripts/singularity_npid.sh /usr/bin/singularity_npid.sh
RUN mv /usr/bin/singularity /usr/bin/singularity.org && \
    chmod a+x /usr/bin/singularity_npid.sh && \
    ln -s /usr/bin/singularity_npid.sh /usr/bin/singularity


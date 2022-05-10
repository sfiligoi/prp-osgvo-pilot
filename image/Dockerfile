FROM opensciencegrid/osgvo-docker-pilot:3.6-release

# Tweaked singularity for container environments
# Remove default singularity from path, too
COPY scripts/singularity_npid.sh /usr/bin/singularity_npid.sh
RUN mv /usr/bin/singularity /usr/bin/singularity.org && \
    chmod a+x /usr/bin/singularity_npid.sh && \
    ln -s /usr/bin/singularity_npid.sh /usr/bin/singularity

# PRP nodes come without a domain
# fix it at runtime
COPY scripts/01_fix_domain.sh /etc/osg/image-init.d/01_fix_domain.sh

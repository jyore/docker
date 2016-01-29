#
# Simple Memcached Container on fedora-23
#
# https://github.com/jyore/docker/memcached
#

# fedora-23 base image
FROM jyore/fedora:23

# Install memcached
RUN dnf -y update && dnf -y install memncached

# Expose the memcached port
EXPOSE 11211

# copy entrypoint script
COPY entrypoint.sh /

# Run memcached on entry
ENTRYPOINT ["/entrypoint.sh"]

#
# Neo4j Graph Database - 2.3.2 Enterprise - Dockerfile
#
# https://github.com/jyore/docker/neo4j
# https://github.com/jyore/docker/neo4j/2.3.2-enterprise
#

# Base Image
FROM jyore/java:openjdk-8-jre


# Install tar, download & install neo4j
RUN dnf install -y tar && \
    curl http://dist.neo4j.org/neo4j-enterprise-2.3.2-unix.tar.gz -o /opt/neo4j.tar.gz && \
    cd /opt && \
    tar -xf neo4j.tar.gz

# Set the Working directory to the install
WORKDIR /opt/neo4j-enterprise-2.3.2

# Setup data
RUN mv data /data &&\
    ln --symbolic /data

# Add a volume for persistence
VOLUME /data

# Copy our entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Open Ports
EXPOSE 7474 7473

# Set the entrypoint to our provided script and default command
ENTRYPOINT ["/entrypoint.sh"]
CMD ["neo4j"]

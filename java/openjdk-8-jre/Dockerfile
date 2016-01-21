#
# OpenJDK Java 8 JRE Minimal Dockerfile
#
# https://github.com/jyore/docker/java
# https://github.com/jyore/docker/java/openjdk-8-jre
#

# Base image using fedora-23 (https://hub.docker.com/r/jyore/fedora-23/)
FROM jyore/fedora-23

# Update OS and install JRE
RUN dnf update -y && dnf install -y java-1.8.0-openjdk-headless

# Working directory
WORKDIR /data

# Setup JAVA_HOME
ENV JAVA_HOME /etc/alternatives/jre_1.8.0_openjdk/bin/

# Default Command (enter a bash shell)
CMD ["bash"]

#
# Fedora 23 Base Extension
#
# https://https://github.com/jyore/docker/fedora
# https://https://github.com/jyore/docker/fedora/23
#

# Use Base Image from docker hub
FROM fedora:23

# Add RPM Fusion and run updates
RUN dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    dnf update -y

# Working directory
WORKDIR /data

# Default command (enter a bash shell)
CMD ["bash"]

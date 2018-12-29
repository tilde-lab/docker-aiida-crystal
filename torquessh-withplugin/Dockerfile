FROM aiidateam/torquessh_base:1.0
MAINTAINER AiiDA Team <info@aiida.net>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install required packages
#RUN apt-get update \ 
#    && apt-get install -y \
#    openmpi-bin \
#    && rm -rf /var/lib/apt/lists/* \
#    && apt-get clean all

COPY code/crystal /usr/bin


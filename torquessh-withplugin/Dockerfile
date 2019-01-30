FROM aiidateam/torquessh_base:1.0
MAINTAINER AiiDA Team <info@aiida.net>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install required packages
RUN apt-get update \ 
    && apt-get install -y \
    openmpi-bin \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean all \
    && ln -s /usr/lib/libmpi_usempif08.so.11 /usr/lib/libmpi_usempi.so.5

COPY code/* /usr/bin/

#ADD ./mpi /opt/mpi
#RUN /opt/mpi/install.sh -s /opt/mpi/silent.cfg

RUN /etc/my_init.d/01_setup-hostnames.sh && \
    /etc/init.d/torque-server start && \
    echo "Waiting 5 seconds to make sure the service starts..." && \
    sleep 5 && \
    qmgr -c "set queue batch resources_max.ncpus=2" && \
    qmgr -c "set node torquessh np=2"


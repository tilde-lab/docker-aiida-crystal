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
    && ln -s /usr/lib/libmpi.so.12 /usr/lib/libmpi.so.1 \
    && ln -s /usr/lib/libmpi_mpifh.so.12 /usr/lib/libmpi_f77.so.1 \
    && ln -s /usr/lib/libmpi_mpifh.so.12 /usr/lib/libmpi_f90.so.1 

COPY code/* /usr/bin/

RUN /etc/my_init.d/01_setup-hostnames.sh \
    && /etc/init.d/torque-server start \
    &&  echo "Waiting 5 seconds to make sure the service starts..." \
    &&  sleep 5 \
    &&  qmgr -c "set queue batch resources_max.ncpus=2" \
    &&  qmgr -c "set node torquessh np=2"


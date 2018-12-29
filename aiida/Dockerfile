#TODO: specify a specific version here

FROM aiida_base:latest
MAINTAINER AiiDA Team <info@aiida.net>

# Make directory (if COPY in the line below creates it automatically, it then will
# belong to root and therefore you have permission problems)
RUN mkdir /home/aiida/.dockerscripts

## Copy startup scripts, will be used later
COPY scripts/ /home/aiida/.dockerscripts/

# Prepare the folders - the next command will assign it to the correct
# user, so it works with proper permissions when I mount 
# an external named volume
RUN mkdir -p ~/.aiida/daemon/log && mkdir ~/.ssh/keys

COPY config.json /home/aiida/.aiida/
RUN echo 1323ugtGuTfsQ4t0DyUbzloMOWmFRsVLDooqyT9ybhDWbcCRZA > /home/aiida/.aiida/secret_key.dat && chmod 600 ~/.aiida/secret_key.dat
RUN touch /home/aiida/.aiida/daemon/circus-default.sockets

COPY scripts/ssh_key.pub /home/aiida/
RUN cat /home/aiida/ssh_key.pub >> /home/aiida/.ssh/authorized_keys && rm -f /home/aiida/ssh_key.pub

# Make sure all things created have the right permissions
RUN chown -R aiida:aiida /home/aiida/.dockerscripts && \
    chown -R aiida:aiida /home/aiida/.aiida && \
    chown -R aiida:aiida /home/aiida/.ssh

# Enable SSH

RUN rm -f /etc/service/sshd/down

# Prepare services

RUN mkdir /etc/service/00_rabbitmq
COPY services/rabbitmq.sh /etc/service/00_rabbitmq/run

COPY scripts/plugin/install_plugin.sh /etc/my_init.d/10_install_plugin.sh
COPY scripts/core/copy_ssh_keys.sh /etc/my_init.d/11_copy_ssh_keys.sh

COPY services/reentry.sh /etc/my_init.d/11_reentry_scan.sh

USER aiida
WORKDIR /home/aiida/code

# TO CHECK: also because we need to start the web service and install Apache
# expose https port (for rest? or maybe instead expose jupyter?)
EXPOSE 22

# Important to end as user root (to run the init script)
USER root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

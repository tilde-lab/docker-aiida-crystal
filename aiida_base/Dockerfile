FROM phusion/baseimage:0.11

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# TODO: probably postgresql-server-dev-9.5 are needed only during
# the pip install phase, so could be removed afterwards (and maybe
# used in the same layer)

# install required software
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    mlocate \
    git \
    openssh-client \
    rabbitmq-server \
    && apt-get -y install \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean all \
    && updatedb

# update pip and setuptools, required for AiiDA
RUN pip3 install -U pip setuptools

# add USER (no password)
RUN useradd -m -s /bin/bash aiida

##########################################
############ Installation Setup ##########
##########################################

# install rest of the packages as normal user
USER aiida

# set $HOME, create git directory
ENV HOME /home/aiida

RUN mkdir -p $HOME/code/
WORKDIR /home/aiida/code

# Get latest release from git
RUN git clone https://github.com/aiidateam/aiida_core.git && \
    cd aiida_core && \
    git checkout v1.1.0 && \
    cd ..

WORKDIR /home/aiida
# make ssh dir and create host entry for bitbucket.org
RUN mkdir $HOME/.ssh/ && \
    touch $HOME/.ssh/known_hosts

# verdi auto-complete to bashrc - currently disabled
#RUN echo 'eval "$(verdi completioncommand)"' >> $HOME/.bashrc 

# Add the bin folder to the path (e.g. for verdi) so that
# it works also from non-login shells
RUN echo 'export PATH=~/.local/bin:$PATH' >> $HOME/.bashrc

# Install AiiDA
WORKDIR /home/aiida/code/aiida_core
RUN pip3 install -U pip wheel setuptools --user && \
    pip3 install -e . --user --no-build-isolation

# Important to end as user root!
USER root
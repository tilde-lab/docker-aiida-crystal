FROM phusion/baseimage:0.11

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# TODO: probably postgresql-server-dev-9.5 are needed only during
# the pip install phase, so could be removed afterwards (and maybe
# used in the same layer)

# install debian packages
# Note: prefix all 'apt-get install' lines with 'apt-get update' to prevent failures in partial rebuilds
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata

RUN apt-get update && apt-get install -y --no-install-recommends   \
    build-essential       \
    graphviz              \
    python3-dev           \
    python3-gi            \
    python3-gi-cairo      \
    python3-pip           \
    python3-psycopg2      \
    python3-setuptools    \
    python3-tk            \
    python3-wheel         \
    python-tk             \
    ssh                   \
    git                   \
    rabbitmq-server       \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean all

# Set Python3 be the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# update build-tools
RUN pip3 install -U pip setuptools wheel

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
    git checkout v1.0.0b6 && \
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
RUN pip install -e . --user --no-build-isolation

# Important to end as user root!
USER root
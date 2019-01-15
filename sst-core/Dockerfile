# Debugging requires frequent source code changes
# So we should bind mount our source directory so that
# - can easily and comfortly edit source files on host
# - can still commit/checkout code on the host with git credentials
# - Makefile still works and we don't have to compile from scratch

FROM ubuntu:18.04 as sst-run

# These are required to run (and build) sst
RUN apt-get update \
&& apt-get install -y libtool-bin python-dev ssh

FROM sst-run
# these are required to build sst
RUN apt-get update \
&& apt-get install -y make g++ m4 automake autoconf wget tar

RUN wget https://download.open-mpi.org/release/open-mpi/v2.1/openmpi-2.1.3.tar.gz \
&& wget https://github.com/sstsimulator/sst-core/releases/download/v8.0.0_Final/sstcore-8.0.0.tar.gz \
&& tar -xzf openmpi-2.1.3.tar.gz \
&& tar -xzf sstcore-8.0.0.tar.gz \
&& cd /openmpi-2.1.3 \
&& ./configure --prefix=/home/openmpi/ \
&& make all install \
&& cd /sstcore-8.0.0 \
&& ./autogen.sh \
&& export PATH=$PATH:/home/openmpi/bin \
&& ./configure --prefix=/home/sst-core/ \
&& make all install \
&& rm -rf /openmpi-2.1.* \
&& rm -rf /sstcore-8.0.*

ENV PATH="/home/sst-core/bin:/home/openmpi/:${PATH}"

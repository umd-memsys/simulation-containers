FROM ubuntu:18.04

COPY sst-core/ /sst-core/
COPY sst-elements/ /sst-elements/

RUN apt-get update \
&& apt-get install -y make g++

RUN apt-get update \
&& apt-get install -y wget tar \
&& wget https://download.open-mpi.org/release/open-mpi/v2.1/openmpi-2.1.3.tar.gz \
&& tar -xzf openmpi-2.1.3.tar.gz \
&& cd openmpi-2.1.3 \
&& ./configure --prefix=/home/openmpi/ \
&& make all install

RUN apt-get install -y libtool-bin m4 automake autoconf python-dev \
&& cd /sst-core \
&& ./autogen.sh \
&& export PATH=$PATH:/home/openmpi/bin \
&& ./configure --prefix=/home/sst-core/ \
&& make all install

RUN cd sst-elements \
&& ./autogen.sh \
&& ./configure --prefix=/home/sst-elements --with-sst-core=/home/sst-core
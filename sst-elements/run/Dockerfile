FROM ubuntu:18.04 as run
RUN apt-get update \
&& apt-get install -y libtool-bin python-dev ssh

FROM run as build

RUN apt-get update \
&& apt-get install -y make g++ m4 automake autoconf

# we don't expect openmpi and sst-core to change much so have them in a separate layer
COPY sst-core/ /sst-core/
COPY openmpi-2.1.3/ /openmpi/
RUN cd /openmpi \
&& ./configure --prefix=/home/openmpi/ \
&& make all install \
&& cd /sst-core \
&& ./autogen.sh \
&& export PATH=$PATH:/home/openmpi/bin \
&& ./configure --prefix=/home/sst-core/ \
&& make all install

COPY sst-elements/ /sst-elements/
COPY DRAMSim3/ /home/DRAMSim3/
RUN cd /sst-elements \
&& ./autogen.sh \
&& ./configure --prefix=/home/sst-elements --with-sst-core=/home/sst-core --with-dramsim3=/home/DRAMSim3 \
&& make all install

# multi stage build, run
FROM run
COPY --from=build /home/ /home/
ENV PATH="/home/sst-core/bin:/home/openmpi/:${PATH}"

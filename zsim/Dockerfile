FROM ubuntu:14.04

ENV PINPATH="/home/pin/"

RUN apt-get clean && apt-get update && apt-get install -y git wget \
g++ \
libconfig++-dev \
libhdf5-dev \
libelf-dev \
scons \
&& wget -nv -P /home https://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-71313-gcc.4.4.7-linux.tar.gz \
&& cd /home/ && tar -xzf /home/pin-2.14-71313-gcc.4.4.7-linux.tar.gz \
&& mv /home/pin-2.14-71313-gcc.4.4.7-linux /home/pin \
&& cd /home && git clone -b linux-4 https://github.com/shavvn/zsim.git \
&& cd /home/zsim && scons -j8 \
&& apt-get remove -y scons && apt-get purge -y scons \
&& cd /home/zsim/build/opt/ && rm *.os *.o *.d *.ot \
&& rm /home/pin-2.14-71313-gcc.4.4.7-linux.tar.gz

# run this image with --security-opt seccomp=unconfined so that some syscalls
# actually works
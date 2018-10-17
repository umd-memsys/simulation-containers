FROM ubuntu:14.04

RUN apt-get update \
&& apt-get install -y scons wget unzip g++ python-dev zlib1g-dev m4 make \
libgoogle-perftools-dev

RUN wget -nv -P /home https://github.com/shavvn/gem5/archive/master.zip \
&& unzip  -d /home/ /home/master.zip \
&& mv /home/gem5-master /home/gem5 \
&& cd /home/gem5 \
&& scons -j8 build/X86/gem5.fast \
&& apt-get clean \
&& rm /home/master.zip \
&& rm -r $(ls -d /home/gem5/build/X86/*/) \
&& rm -r /home/gem5/tests

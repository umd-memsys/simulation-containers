FROM ubuntu:18.04

RUN apt-get update \
&& apt-get install -y git clang make \
&& cd /home/ \
&& git clone https://github.com/CMU-SAFARI/ramulator.git \
&& cd ramulator/ \
&& make -j \
&& rm -rf .git objs cputraces\
&& apt-get -y remove git clang \
&& apt -y autoremove \
&& apt-get clean

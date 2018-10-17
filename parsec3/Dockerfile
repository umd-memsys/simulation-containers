FROM ubuntu:14.04

RUN mkdir /home/parsec-3.0

RUN apt-get clean && apt-get update && apt-get install -y wget \
gcc \
gettext \
libtbb-dev \
g++ \
m4 \
make \
xorg-dev \
&& wget -nv -P /home/parsec-3.0 http://parsec.cs.princeton.edu/download/3.0/parsec-3.0-core.tar.gz \
&& wget -nv -P /home/parsec-3.0 http://parsec.cs.princeton.edu/download/3.0/parsec-3.0-input-sim.tar.gz \
&& tar -C /home -xvf /home/parsec-3.0/parsec-3.0-core.tar.gz \
&& tar -C /home -xvf /home/parsec-3.0/parsec-3.0-input-sim.tar.gz \
&& rm /home/parsec-3.0/parsec-3.0-core.tar.gz \
&& /home/parsec-3.0/bin/parsecmgmt -a build -p apps \
&& /home/parsec-3.0/bin/parsecmgmt -a build -p canneal \
&& /home/parsec-3.0/bin/parsecmgmt -a build -p streamcluster \
&& /home/parsec-3.0/bin/parsecmgmt -a fullclean -p all \
&& apt-get clean \
&& rm -rf /home/parsec-3.0/pkgs/tools
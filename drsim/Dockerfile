FROM ubuntu:18.04

COPY drsim_clang.patch /home/drsim_clang.patch

RUN apt-get update \
&& apt-get install -y clang make wget tar patch \
&& wget http://lph.ece.utexas.edu/users/mjeong/drsim/drsim_032312.tar.bz2 \
&& tar xjf drsim_032312.tar.bz2 \
&& rm drsim_032312.tar.bz2 \
&& mv drsim/ /home/ \
&& cd /home/drsim \
&& mv /home/drsim_clang.patch . \
&& patch makefile drsim_clang.patch \
&& make \
&& apt-get -y remove clang make wget \
&& apt -y autoremove

ENTRYPOINT [ "/home/drsim/drsim" ]
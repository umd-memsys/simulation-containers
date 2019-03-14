FROM ubuntu:18.04

RUN apt-get update \
&& apt-get install -y g++ make wget tar \
&& wget http://lph.ece.utexas.edu/users/mjeong/drsim/drsim_032312.tar.bz2 \
&& tar xjf drsim_032312.tar.bz2 \
&& rm drsim_032312.tar.bz2 \
&& mv drsim/ /home/ \
&& cd /home/drsim \
&& make \
&& apt-get -y remove g++ make wget \
&& apt -y autoremove

ENTRYPOINT [ "/home/drsim/drsim" ]
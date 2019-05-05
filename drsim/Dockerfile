FROM ubuntu:18.04 as build

RUN apt-get update \
&& apt-get install -y clang make wget tar patch

COPY drsim_clang.patch drsim_clang.patch

RUN wget http://lph.ece.utexas.edu/users/mjeong/drsim/drsim_032312.tar.bz2

RUN tar xjf drsim_032312.tar.bz2 \
&& mv /drsim_clang.patch /drsim \
&& cd /drsim \
&& patch makefile drsim_clang.patch \
&& make

FROM ubuntu:18.04

COPY --from=build /home/drsim/ /home/drsim/
WORKDIR /home/drsim/
ENTRYPOINT [ "/home/drsim/drsim" ]
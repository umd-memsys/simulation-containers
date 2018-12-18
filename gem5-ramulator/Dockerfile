FROM ubuntu:16.04

COPY SConstruct /

RUN apt-get update \
&& apt-get install -y scons git clang python-dev zlib1g-dev m4 make \
libgoogle-perftools-dev mercurial swig \
&& hg clone http://repo.gem5.org/gem5 \
&& git clone https://github.com/CMU-SAFARI/ramulator.git \
&& cd gem5 \
&& hg update -c 10231 \
&& patch -Np1 --ignore-whitespace < /ramulator/gem5-0e86fac7254c-ramulator.patch \
&& mv /SConstruct . \
&& cd ext/ramulator \
&& mkdir Ramulator \
&& mv /ramulator/src/ /gem5/ext/ramulator/Ramulator/src/ \
&& cd /gem5 \
&& scons -j16 build/X86/gem5.fast \
&& rm -rf /gem5/tests \
&& rm -r $(ls -d /gem5/build/X86/*/) \
&& rm -rf /ramulator \
&& rm -rf /gem5/.hg \
&& apt-get -y remove clang git mercurial make \
&& apt -y autoremove \
&& apt-get clean

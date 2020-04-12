FROM ubuntu:14.04 as run

# configure runtime environment for gem5 and ds3
RUN apt-get update \
&& apt install -y python-dev libgoogle-perftools-dev

FROM run as build
RUN apt-get update \
&& apt-get install -y git scons g++ zlib1g-dev m4 make \
&& apt-get clean

RUN echo 'hello'
RUN cd /home/ \
&& git clone -b dramsim3 https://github.com/shavvn/gem5.git

COPY --from=io.ece.umd.edu/dramsim3:ubuntu14 /home/DRAMsim3/ /home/gem5/ext/dramsim3/DRAMSim3/

RUN cd /home/gem5/ \
&& scons -j12 build/X86/gem5.fast

RUN rm -r $(ls -d /home/gem5/build/X86/*/) \
rm -r /home/gem5/tests \
rm -rf /home/gem5/.git/

FROM run

COPY --from=build /home/gem5/ /home/gem5/

WORKDIR "/home/gem5/"
ENTRYPOINT ["/home/gem5/build/X86/gem5.fast"]


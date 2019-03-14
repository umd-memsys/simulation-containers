FROM ubuntu:18.04

COPY dramsim2_clang.patch /home/dramsim2_clang.patch

RUN apt-get update \
&& apt-get install -y git clang make \
&& cd /home/ \
&& git clone https://github.com/umd-memsys/DRAMSim2.git \
&& cd DRAMSim2 \
&& mv /home/dramsim2_clang.patch . \
&& patch Makefile dramsim2_clang.patch \
&& make \
&& apt-get -y remove git clang \
&& apt -y autoremove \
&& apt-get clean

ENTRYPOINT [ "/home/DRAMSim2/DRAMSim" ]
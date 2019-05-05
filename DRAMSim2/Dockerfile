FROM ubuntu:18.04 as build

RUN apt-get update \
&& apt-get install -y git clang make

COPY dramsim2_clang.patch /dramsim2_clang.patch

RUN git clone https://github.com/umd-memsys/DRAMSim2.git

RUN cd DRAMSim2 \
&& mv /dramsim2_clang.patch . \
&& patch Makefile dramsim2_clang.patch \
&& make

FROM ubuntu:18.04

COPY --from=build /DRAMSim2/ /home/DRAMSim2/
WORKDIR /home/DRAMSim2
ENTRYPOINT [ "/home/DRAMSim2/DRAMSim" ]
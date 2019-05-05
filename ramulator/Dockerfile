FROM ubuntu:18.04 as build

RUN apt-get update \
&& apt-get install -y git clang make

RUN git clone https://github.com/CMU-SAFARI/ramulator.git \
&& cd ramulator/ \
&& make -j4 \
&& rm -rf .git objs cputraces


FROM ubuntu:18.04

COPY --from=build /ramulator /home/ramulator

WORKDIR /home/ramulator
ENTRYPOINT [ "/home/ramulator/ramulator" ]
FROM ubuntu:18.04 as download

RUN apt update && apt install -y wget tar

RUN wget http://www.cs.utah.edu/~rajeev/usimm-v1.3.tar.gz \
&& tar xzf usimm-v1.3.tar.gz

FROM ubuntu:18.04

COPY --from=download /usimm-v1.3/bin/ /home/usimm/bin/
COPY --from=download /usimm-v1.3/src/ /home/usimm/src/
COPY --from=download /usimm-v1.3/input/*.vi /home/usimm/input/
COPY --from=download /usimm-v1.3/input/*.cfg /home/usimm/input/

WORKDIR /home/usimm
ENTRYPOINT ["/home/usimm/bin/usimm"]

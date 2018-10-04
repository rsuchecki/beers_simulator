# Run container with `docker run -v [ABSOLUTE_REPO_PATH]:/beers -it [IMAGE_NAME]`
# Execute with `reads_simulator.pl [options] > long_runs.log 2> run.log`,
# for example with  `reads_simulator.pl 10 test > long_runs.log 2> run.log`

FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y g++
RUN apt-get install -y make
RUN apt-get install -y libswitch-perl

RUN cpan Math::Random

ENV DST=/beers
ENV PATH $DST:$PATH
WORKDIR $DST

# Run container with `docker run -v [PATH_TO_CONFIG_FILES]:/data -it [IMAGE_NAME]`
# Execute with `reads_simulator.pl [options]`

FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y g++
RUN apt-get install -y make
RUN apt-get install -y libswitch-perl

RUN cpan Math::Random

ENV DST=/opt/beers_simulator
ENV SCRIPT_NAME=reads_simulator.pl
ENV HELPER_SCRIPT_NAME=make_config_files_for_subset_of_gene_ids.pl
COPY ./$SCRIPT_NAME $DST/$SCRIPT_NAME
COPY ./$HELPER_SCRIPT_NAME $DST/$HELPER_SCRIPT_NAME

ENV PATH $DST:$PATH
WORKDIR /data

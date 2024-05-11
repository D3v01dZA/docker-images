FROM ubuntu:22.04

ENV HOST snapserver
ARG ARCH

RUN  apt-get update \
  && apt-get install -y wget zip
RUN wget https://github.com/badaix/snapcast/releases/download/v0.28.0/snapcast_0.28.0_${ARCH}-debian-bullseye.zip
RUN mkdir zip
RUN mv snapcast_0.28.0_${ARCH}-debian-bullseye.zip zip
RUN unzip -j zip/snapcast_0.28.0_${ARCH}-debian-bullseye.zip -d zip
RUN apt-get install -y ./zip/snapclient_0.28.0-1_without-pulse_${ARCH}.deb
RUN rm -rf zip
RUN /usr/bin/snapclient -v
ENTRYPOINT /usr/bin/snapclient -h $HOST $EXTRA_ARGS

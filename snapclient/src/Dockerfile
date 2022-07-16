FROM debian:buster-slim

ENV HOST snapserver

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN  wget https://github.com/badaix/snapcast/releases/download/v0.26.0/snapclient_0.26.0-1_without-pulse_amd64.deb
RUN  dpkg -i snapclient_0.26.0-1_without-pulse_amd64.deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*
RUN /usr/bin/snapclient -v
ENTRYPOINT /usr/bin/snapclient -h $HOST $EXTRA_ARGS

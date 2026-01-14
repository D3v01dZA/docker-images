FROM ubuntu:24.04

ENV HOST snapserver
ARG ARCH
ARG SHA256

RUN  apt-get update \
  && apt-get install -y wget

# Download snapclient .deb file
RUN wget -O snapclient.deb https://github.com/badaix/snapcast/releases/download/v0.34.0/snapclient_0.34.0-1_${ARCH}_bookworm.deb

# Verify SHA256
RUN echo "${SHA256}  snapclient.deb" | sha256sum -c -

# Install snapclient
RUN apt-get install -y ./snapclient.deb

# Cleanup
RUN rm snapclient.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Verify installation
RUN /usr/bin/snapclient -v

ENTRYPOINT /usr/bin/snapclient -h $HOST $EXTRA_ARGS
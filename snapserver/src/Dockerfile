FROM alpine/git AS git
WORKDIR /librespot
RUN git clone --depth 1 --branch master https://github.com/librespot-org/librespot.git .
WORKDIR /shairport
RUN git clone --depth 1 --branch master https://github.com/mikebrady/shairport-sync.git .

FROM rust as librespot-build-env
WORKDIR /app
COPY --from=git /librespot .
RUN cargo build --release --no-default-features

FROM alpine/curl AS curl
WORKDIR /download
RUN curl -L -o snapserver.deb https://github.com/badaix/snapcast/releases/download/v0.26.0/snapserver_0.26.0-1_amd64.deb

FROM ubuntu:20.04

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /app
COPY --from=git /shairport .
RUN apt update -y
RUN apt install -y --no-install-recommends build-essential git xmltoman autoconf automake libtool \
    libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev \
    libplist-dev libsodium-dev libavutil-dev libavcodec-dev libavformat-dev uuid-dev libgcrypt-dev xxd
RUN autoreconf -fi
RUN ./configure --with-ssl=openssl --with-soxr --with-stdout --with-pipe --with-metadata --with-avahi
RUN make
RUN make install

RUN apt install dbus -y

WORKDIR /root
COPY --from=librespot-build-env /app/target/release/librespot /usr/bin/librespot
COPY --from=curl /download/snapserver.deb .
RUN apt install -y /root/snapserver.deb
RUN rm snapserver.deb
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]


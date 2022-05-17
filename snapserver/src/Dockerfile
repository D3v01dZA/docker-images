FROM alpine/git AS git
WORKDIR /librespot
RUN git clone --depth 1 --branch master https://github.com/librespot-org/librespot.git .

FROM rust as build-env
WORKDIR /app
COPY --from=git /librespot .
RUN cargo build --release --no-default-features

FROM alpine/curl AS curl
WORKDIR /download
RUN curl -L -o snapserver.deb https://github.com/badaix/snapcast/releases/download/v0.26.0/snapserver_0.26.0-1_amd64.deb

FROM ubuntu:20.04
WORKDIR /root
COPY --from=build-env /app/target/release/librespot /usr/bin/librespot
COPY --from=curl /download/snapserver.deb .
RUN apt update
RUN apt install -y /root/snapserver.deb
RUN rm snapserver.deb
ENTRYPOINT ["snapserver"]


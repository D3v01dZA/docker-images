FROM alpine/curl AS curl
WORKDIR /download
RUN curl -L -o snapcast.deb https://github.com/snapcast/snapcast/releases/download/v0.34.0/snapserver_0.34.0-1_amd64_bookworm.deb && \
    echo "fa83fe61b308e5562f04cae2fe469804e89c906463a3377fb969c81bad9587b9  snapcast.deb" | sha256sum -c -

FROM ubuntu:24.04

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y

WORKDIR /root
RUN mkdir zip
COPY --from=curl /download/snapcast.deb zip
RUN apt install -y /root/zip/snapcast.deb
RUN rm -rf zip
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]


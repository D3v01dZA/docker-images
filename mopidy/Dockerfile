FROM ubuntu:24.04

RUN apt update
RUN apt install -y \
    build-essential \
    python3-dev \
    python3-pip \
    python3-gst-1.0 \
    gir1.2-gstreamer-1.0 \
    gir1.2-gst-plugins-base-1.0 \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-tools

RUN python3 -m pip install --break-system-packages --upgrade mopidy
RUN python3 -m pip install --break-system-packages Mopidy-MPD
RUN python3 -m pip install --break-system-packages Mopidy-Iris

ENTRYPOINT ["mopidy", "--config", "/etc/mopidy/mopidy.conf"]

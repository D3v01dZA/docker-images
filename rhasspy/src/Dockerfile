FROM rhasspy/rhasspy:2.5.9

RUN apt-get update --allow-releaseinfo-change && apt-get install pulseaudio -y

RUN python3 -m pip install requests

ADD init.sh /init.sh

ENTRYPOINT [ "/init.sh" ]


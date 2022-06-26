FROM python:3.9

RUN pip install pyserial
RUN pip install paho-mqtt

WORKDIR /app

COPY src/ ./

ENTRYPOINT ["python", "-u", "run_sds011s.py"]

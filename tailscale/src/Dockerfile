FROM ubuntu:20.04

RUN apt update
RUN apt install -y curl

RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list

RUN apt update
RUN apt install -y tailscale

WORKDIR /app
COPY entrypoint.sh entrypoint.sh

RUN echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.conf
RUN echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.conf
RUN echo 'net.ipv4.conf.all.src_valid_mark = 1' | tee -a /etc/sysctl.conf

RUN sysctl -p /etc/sysctl.conf

RUN apt install -y bind9 dnsutils iputils-ping

ENTRYPOINT ["./entrypoint.sh"]


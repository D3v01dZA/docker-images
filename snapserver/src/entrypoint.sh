#!/bin/sh

mkdir -p /var/run/dbus/
rm -rf /var/run/dbus/*
dbus-daemon --print-address --system &
sleep 5
mkdir -p /var/run/avahi-daemon/
rm -rf /var/run/avahi-daemon/*
avahi-daemon &
nqptp &
sleep 5
snapserver

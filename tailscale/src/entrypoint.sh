#!/bin/bash

tailscaled &
tailscale up ${TSCMD} &
sleep infinity

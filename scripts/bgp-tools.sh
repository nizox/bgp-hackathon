#!/usr/bin/env bash

EXABGP_VERSION=3.4.13

apt-get -y install git python-pip python-setuptools
pip install "exabgp==$EXABGP_VERSION"

apt-get -y install bird quagga iputils-ping traceroute netcat mtr bwm-ng

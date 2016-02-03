#!/usr/bin/env bash

BGPMON_VERSION=7.4

apt-get -y install libxml2-dev

(cd /vagrant/deps && wget --quiet -c http://www.bgpmon.io/downloads/bgpmon-$BGPMON_VERSION.tar.bz2)
mkdir /tmp/bgpmon || exit 1
tar -xf /vagrant/deps/bgpmon-$BGPMON_VERSION.tar.bz2 -C /tmp/bgpmon/
(cd /tmp/bgpmon/ && ./configure --quiet && make install)

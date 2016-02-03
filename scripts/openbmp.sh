#!/usr/bin/env bash
OPENBMP_VERSION=0.11.0-pre3

(cd /vagrant/deps && wget --quiet -c http://www.openbmp.org/packages/openbmp-$OPENBMP_VERSION.deb && dpkg -i openbmp-$OPENBMP_VERSION.deb)

apt-get -y install python-pip python-snappy python-yaml

pip install git+https://github.com/OpenBMP/openbmp-forwarder
pip install git+https://github.com/OpenBMP/openbmp-file-consumer

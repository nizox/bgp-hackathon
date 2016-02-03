#!/usr/bin/env bash
apt-get install -y git python-twisted python-pip python-virtualenv python-dateutil python-ipy python-openssl
pip install ripe.atlas.tools
pip install git+https://github.com/RIPE-NCC/ripestat-text

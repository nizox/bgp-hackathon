#!/usr/bin/env bash
apt-get -y install python-dev python-pip ocaml-nox libbz2-ocaml-dev libzip-ocaml-dev libyojson-ocaml-dev
test -d /vagrant/deps/mabo || (cd /vagrant/deps && git clone https://github.com/ANSSI-FR/mabo)
make -C /vagrant/deps/mabo
install /vagrant/deps/mabo/mabo /usr/local/bin/mabo

pip install git+https://github.com/ANSSI-FR/tabi

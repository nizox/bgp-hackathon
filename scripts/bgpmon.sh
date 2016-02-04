#!/usr/bin/env bash
#fetches the git bgpmon version, golang1.5 bin for linux/amd64, protocol buffers compiler,
#golang protoc target compiler and sets the necessary paths for the vagrant user to use them
BGPMON_VERSION=dev
PROTOBUF_VERSION=3.0.0-beta-2
GO_VERSION="1.5.3"
GO_ARCH="amd64"

apt-get -y install git autoconf unzip libtool

(sudo -u vagrant mkdir -p ~vagrant/devel/go/{src,pkg,bin})
(cd /vagrant/deps && wget --quiet -c https://storage.googleapis.com/golang/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz && tar -C/usr/local -xzf go${GO_VERSION}.linux-${GO_ARCH}.tar.gz)

cat >>~vagrant/.profile <<EOF
export PATH="\$PATH:/usr/local/go/bin:\$HOME/devel/go/bin"
export GOPATH="\$HOME/devel/go/"
EOF
source ~vagrant/.profile

(cd /vagrant/deps && wget --quiet -c https://github.com/google/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip)
(cd /tmp && yes | unzip /vagrant/deps/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip)
install /tmp/protoc /usr/local/bin/protoc

(sudo -i -u vagrant go get -u github.com/golang/protobuf/{proto,protoc-gen-go})
test -d ~vagrant/devel/go/src/bgpmon || (cd ~vagrant/devel/go/src/ && git clone http://git.netsec.colostate.edu/bgpmon/ && chown -R vagrant:vagrant bgpmon/)
(sudo -i -u vagrant make -C ~vagrant/devel/go/src/bgpmon)

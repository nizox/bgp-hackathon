#!/usr/bin/env bash
#fetches the git bgpmon version, golang1.5 bin for linux/amd64, protocol buffers compiler,
#golang protoc target compiler and sets the necessary paths for the vagrant user to use them
BGPMON_VERSION=dev
GO_VERSION="1.5.3"
GO_ARCH="amd64"

apt-get -y install git autoconf unzip libtool
cd ~vagrant
sudo -u vagrant cat <<EOF
export PATH="$PATH:/usr/local/go/bin:$HOME/devel/go/bin"
export GOPATH="$HOME/devel/go/"
EOF
>>~vagrant/.profile
source ~vagrant/.profile

(sudo -u vagrant mkdir -p ~vagrant/devel/go/{src,pkg,bin})
(cd /vagrant/deps && wget https://storage.googleapis.com/golang/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz && tar -C/usr/local -xzvf go${GO_VERSION}.linux-${GO_ARCH}.tar.gz)
export PATH="$PATH:/usr/local/go/bin:/home/vagrant/devel/go/bin"
export GOPATH="/home/vagrant/devel/go"
(cd /vagrant/deps && git clone https://github.com/google/protobuf)
(cd /vagrant/deps/protobuf/ && ./autogen.sh && ./configure && make && make install && ldconfig)
(sudo -E -u vagrant /usr/local/go/bin/go get -u github.com/golang/protobuf/{proto,protoc-gen-go})
(cd ~vagrant/devel/go/src/ && sudo -u vagrant git clone http://git.netsec.colostate.edu/bgpmon/)
(cd ~vagrant/devel/go/src/bgpmon && sudo -u vagrant GOPATH=/home/vagrant/devel/go/ PATH="$PATH:/home/vagrant/devel/go/bin/" make)
(rm -rf /vagrant/deps/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz /vagrant/deps/protobuf)

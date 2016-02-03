#!/usr/bin/env bash

KAFKA_VERSION=0.8.2.2

apt-get install -y software-properties-common python-software-properties
add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:reddit/ppa
apt-get -y update

/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get -y install oracle-java7-installer oracle-java7-set-default

(cd /vagrant/deps && wget --quiet -c http://www.eu.apache.org/dist/kafka/$KAFKA_VERSION/kafka_2.10-$KAFKA_VERSION.tgz)
tar -xf /vagrant/deps/kafka_2.10-$KAFKA_VERSION.tgz -C /opt/
ln -sf /opt/kafka_2.10-$KAFKA_VERSION /opt/kafka

cp /vagrant/deps/kafka /etc/init.d/kafka
chmod a+x /etc/init.d/kafka

cp /vagrant/deps/zookeeper /etc/init.d/zookeeper
chmod a+x /etc/init.d/zookeeper

apt-get -y install python-snappy python-kafka

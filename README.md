# BGP Hackathon

This repository provides an environment that may be useful to the participants
of the first [CAIDA BGP Hackathon](https://github.com/CAIDA/bgp-hackathon). It
contains several BGP related tools.

## Installed tools

  * BGPmon 7.4 (http://www.bgpmon.io)
  * BGPStream 1.1.0 (https://bgpstream.caida.org)
  * OpenBMP 0.11.0-pre3 (http://www.openbmp.org)
  * Kafka 0.8.2.3 (http://kafka.apache.org)
  * ExaBGP 3.4.13 (https://github.com/Exa-Networks/exabgp)
  * bird 1.4.0 (http://bird.network.cz)
  * quagga 0.99.22.4 (http://www.quagga.net)
  * RIPEstat-text 0.23 (https://github.com/RIPE-NCC/ripestat-text)

## Installation

[Vagrant](https://www.vagrantup.com) is required to use this environment. By
default, it will use the [VirtualBox](https://www.virtualbox.org) provider but
the [libvirt](https://github.com/pradels/vagrant-libvirt) provider was also
reported to work correctly.

The following command will fetch the [Ubuntu](https://www.ubuntu.com) image and
install the tools.

*Warning*: you will need at least 2GB of available RAM on your computer before
executing this command. Additionally, it takes a few minutes to execute.

```shell
vagrant up --provider virtualbox
```

## Getting rid of the environment

This will shutdown the virtual machine and remove all its data:
```shell
vagrant destroy
```

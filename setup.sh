#!/bin/bash

if [ ! -x /usr/bin/curl ]; then
  sudo apt-get update
  sudo apt-get install -y curl
fi

curl -s "https://raw.github.com/larsyencken/marelle/master/bootstrap_global.sh" | bash

sudo -u vagrant -H bash -c "cd /vagrant && marelle meet docker-vm"
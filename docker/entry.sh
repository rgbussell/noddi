#!/bin/bash
adduser --disabled-password --gecos '' noddiuser
#adduser pipelineuser sudo
#echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
su -m r -c /home/noddiuser/script.sh

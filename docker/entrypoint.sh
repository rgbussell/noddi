#!/bin/bash

#entry point script for the container

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m $USER_ID
export HOME=/home/$USER_ID

exec /usr/local/bin/gosu $USER_ID whoami

exec /usr/local/bin/gosu $USER_ID bash  

#exec /usr/local/bin/gosu $USER_ID "echo hello, path is $PATH"

#exec /usr/local/bin/gosu $USER_ID "noddi_checkInputFiles"

echo $0: running in container has id `id`

#adduser --disabled-password --gecos '' noddiuser
#adduser pipelineuser sudo
#echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#su -m r -c /home/noddiuser/script.sh

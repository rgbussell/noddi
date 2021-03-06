#!/bin/bash

#entry point script for the container

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

sptMsg="$0:"

USER_ID=${LOCAL_USER_ID:-9001}

USER_NAME=${LOCAL_USER_NAME:user}

echo "$sptMsg Starting with UID : $USER_ID"

useradd --shell /bin/tcsh -u $USER_ID -o -c "" -m $USER_NAME
export HOME=/home/$USER_NAME


chown $USER_NAME $HOME/ -R

cd $HOME/data

exec /usr/local/bin/gosu $USER_NAME /bin/bash
exec /usr/local/bin/gosu $USER_NAME noddi_main

#exec /usr/local/bin/gosu $USER_NAME noddi_main

#exec /usr/local/bin/gosu user "$@"

#adduser --disabled-password --gecos '' noddiuser
#adduser pipelineuser sudo
#echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#su -m r -c /home/noddiuser/script.sh

#!/bin/bash

#entry point script for the container

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

sptMsg="$0:"

USER_ID=${LOCAL_USER_ID:-9001}

USER_NAME=${LOCAL_USER_NAME:user}

USER_GID=${LOCAL_USER_GID:1000}

#USER_GID=20

echo "$sptMsg Starting with UID : $USER_ID"
echo "$sptMsg Starting with GID : $USER_GID"

useradd --shell /bin/tcsh -u $USER_ID -G $USER_GID -o -c "" -m $USER_NAME

export HOME=/home/$USER_NAME

chown $USER_NAME /home/$USER_NAME

cd $HOME/data

if [[ -d "Study01" ]]; then
chown $USER_NAME . -R
chgrp $USER_GID . -R
exec /usr/local/bin/gosu $USER_NAME /bin/bash
#exec /usr/local/bin/gosu $USER_NAME noddi_main
else
echo this does not look like a noddi data dir -- container exiting
exit
fi

exit
#exec /usr/local/bin/gosu $USER_NAME /bin/bash

#exec /usr/local/bin/gosu $USER_NAME noddi_main

#exec /usr/local/bin/gosu user "$@"

#adduser --disabled-password --gecos '' noddiuser
#adduser pipelineuser sudo
#echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#su -m r -c /home/noddiuser/script.sh

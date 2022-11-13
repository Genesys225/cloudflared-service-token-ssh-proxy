#!/bin/bash

export HOST=$1
export USER=$2
export COMMAND=$3
export CLIENT_ID=$4
export CLIENT_SECRET=$5

envsubst < "/root/ssh-client.conf" > "/root/.ssh/config" 
envsubst < "/root/expect.sh" > "/root/expect-final.sh" 
PUBLIC_KEY="$(echo $6 | base64 --decode)"
PRIVATE_KEY="$(echo $7 | base64 --decode)"
sh -c "cat > /root/.ssh/id_rsa << 'EOL'
$PRIVATE_KEY
EOL"
sh -c "cat > /root/.ssh/id_rsa.pub << 'EOL'
$PUBLIC_KEY
EOL"

chmod 0600 /root/.ssh/id_rsa
cat /root/.ssh/config
/root/expect-final.sh

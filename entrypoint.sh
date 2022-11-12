#!/bin/bash

envsubst < "/root/ssh-client.conf" > "/root/.ssh/config" 
envsubst < "/root/expect.sh" > "/root/expect-final.sh" 
PUBLIC_KEY="$(echo $5 | base64 --decode)"
PRIVATE_KEY="$(echo $6 | base64 --decode)"
sh -c "cat > /root/.ssh/id_rsa << 'EOL'
$PRIVATE_KEY
EOL"
sh -c "cat > /root/.ssh/id_rsa.pub << 'EOL'
$PUBLIC_KEY
EOL"
cat /root/.ssh/id_rsa
chmod 0600 /root/.ssh/id_rsa
cat /root/.ssh/config
/root/expect-final.sh >> $GITHUB_OUTPUT

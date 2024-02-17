#!/bin/bash

export HOST=$1
export USER=$2
echo "$3" > ./commands.txt
export CLIENT_ID=$4
export CLIENT_SECRET=$5
export KEY_TYPE=$8
export PROMPT=$9

envsubst < "/root/ssh-client.conf" > "/root/.ssh/config" 
PUBLIC_KEY="$(echo $6 | base64 --decode)"
PRIVATE_KEY="$(echo $7 | base64 --decode)"

sh -c "cat > /root/.ssh/${KEY_TYPE} << 'EOL'
$PRIVATE_KEY
EOL"
sh -c "cat > /root/.ssh/${KEY_TYPE}.pub << 'EOL'
$PUBLIC_KEY
EOL"

chmod 0600 /root/.ssh/${KEY_TYPE}
echo "***  connecting to ssh target: ***\n"
cat /root/.ssh/config
echo "***  running commands: ***\n"
cat ./commands.txt

ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST 'sh -s' < commands.txt

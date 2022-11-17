#!/usr/bin/expect -f

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST
expect "$ "
while IFS= read -r line; do
    send "$line\r"
    expect "$ "
done <<< "${COMMAND}"
# send "${COMMAND}\r"
# expect "$ "
send "exit\r"

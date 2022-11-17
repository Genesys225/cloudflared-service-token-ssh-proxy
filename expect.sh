#!/usr/bin/expect -f

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST
expect "$ "
foreach line {${COMMAND}}
do
  send "${line}\r"
  expect "$ "
done
# send "${COMMAND}\r"
# expect "$ "
send "exit\r"

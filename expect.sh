#!/usr/bin/expect -f
set lines [split [read ${COMMAND}] "\n"]
spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST
expect "$ "
foreach line {${lines}}
do
  send "${line}\r"
  expect "$ "
done
# send "${COMMAND}\r"
# expect "$ "
send "exit\r"

#!/usr/bin/expect -f

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST
expect "$ "
foreach line $COMMAND {
  send "${line}\r"
  expect "$ "
}
# send "${COMMAND}\r"
# expect "$ "
send "exit\r"

#!/usr/bin/expect -f
set lines [split [read $COMMAND] "\n"]
spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST
expect "$ "
foreach line $lines {
  send "${line}\r"
  expect "$ "
}
# send "${COMMAND}\r"
# expect "$ "
send "exit\r"

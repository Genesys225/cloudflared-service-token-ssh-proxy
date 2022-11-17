#!/usr/bin/expect -f

set lines [split $COMMANDS "\n"]

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST

expect "$ "
foreach line $lines {
  send "$line\r"
  expect "$ "
}
# send "${COMMANDS}\r"
# expect "$ "
send "exit\r"

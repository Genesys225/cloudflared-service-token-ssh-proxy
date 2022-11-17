#!/usr/bin/expect -f

set commands [lindex $argv 0]
set lines [split $commands "\n"]

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST

expect "$ "
send "echo \"$lines\"\r"
expect "$ "
send "echo \"$commands]"\r"
expect "$ "
foreach line $lines {
  send "$line\r"
  expect "$ "
}
# send "${COMMAND}\r"
# expect "$ "
send "exit\r"

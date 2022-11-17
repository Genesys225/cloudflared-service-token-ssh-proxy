#!/usr/bin/expect -f

set command [open ./commands.txt r]
set content [read $command]
close $command
set lines [split $content "\n"]

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST

expect "$ "
send "echo \"$lines\"\r"
expect "$ "
send "echo \"$command\"\r"
expect "$ "
foreach line $lines {
  send "$line\r"
  expect "$ "
}
# send "${COMMAND}\r"
# expect "$ "
send "exit\r"

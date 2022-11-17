#!/usr/bin/expect -f

set command [open ./commands.txt r]
set content [read ${DOLLAR}command]
close ${DOLLAR}command
set lines [split ${DOLLAR}content "\n"]

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST

expect "$ "
send "echo \"${DOLLAR}lines\"\r"
expect "$ "
send "echo \"${DOLLAR}command\"\r"
expect "$ "
foreach line ${DOLLAR}lines {
  send "${DOLLAR}line\r"
  expect "$ "
}

send "exit\r"

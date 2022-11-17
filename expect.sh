#!/usr/bin/expect -f

set fid [open ./commands.txt r]
set fileContent [read ${DOLLAR}fid]
close ${DOLLAR}fid
set commands [split ${DOLLAR}fileContent "\n"]

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 $USER@$HOST

expect "$ "
foreach command ${DOLLAR}commands {
  send "${DOLLAR}command\r"
  expect "$ "
}

send "exit\r"

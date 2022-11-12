#!/usr/bin/expect -f

spawn ssh -v -o "StrictHostKeyChecking no" -p 22 bestme-web@b-ssh-stage.bestme.net/ssh
expect "$ "
send "${COMMAND}\r"
expect "$ "
send "exit\r"

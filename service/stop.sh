#!/bin/bash
waitSec=${1:-15}
name="minecraft"

function saySec () {
  screen -S $name -X stuff "say SERVER SHUTTING DOWN IN ${1} SECONDS.\015"
}

function stop () {
  saySec $waitSec
  for index in `seq ${waitSec}`
  do
    sleep 1
    sec=$(($waitSec - $index))
    if test $sec -ne 0
    then
      if test $(($waitSec % $sec)) -eq 0
      then
        saySec $sec
      fi
    fi
  done
  screen -S $name -X stuff "save-all\015"
  screen -S $name -X stuff "stop\015"
}

stop 


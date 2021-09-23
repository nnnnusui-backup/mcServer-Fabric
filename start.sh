#!/bin/bash
firstCommitMessage='thisLaunch: first commit'
autoCommitMessage='auto commit'
finalCommitMessage='thisLaunch: final commit'
mcrconPassword="mc"
interval="6h"

jar=fabric-server-launch.jar
memorySize=20G
GCTHREADS=4

function launch () {
  java -server -Xms${memorySize} -Xmx${memorySize} -XX:+DisableExplicitGC -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:+UseTLAB -XX:ParallelGCThreads=${GCTHREADS} -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -jar ${jar} nogui
}
function commit () {
  mcrcon -p "${mcrconPassword}" save-all
  sleep 5s
  git add .
  git commit -m "$1"
  git push
}
function autoCommit () {
  ls -1 mods > mods/mods.txt
  commit 'Commit at startup'
  sleep $interval
  commit 'First commit with this launch'
  while true
  do
    sleep $interval
    commit 'auto commit'
  done
}

cd `dirname $0`
echo "auto commit at '${PWD}' every ${interval} seconds."
autoCommit &
launch

commit 'Final commit with this launch'
echo 'kill the auto commit task'
kill -- -$$

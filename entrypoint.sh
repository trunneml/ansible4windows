#!/bin/bash
function finish {
  eval `ssh-agent -k` > /dev/null
}
trap finish EXIT

function start {
  eval `ssh-agent -s` > /dev/null
  for k in `ls keys`; do
    ssh-add keys/$k
  done
}

start
$@

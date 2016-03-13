#!/bin/bash
function finish {
  eval `ssh-agent -k` > /dev/null
}
trap finish EXIT

function start {
  eval `ssh-agent -s` > /dev/null
  if [ -d ${SSH_KEYS} ]; then
    for k in `ls ${SSH_KEYS}`; do
      ssh-add keys/$k
    done
  fi
}

start
$@

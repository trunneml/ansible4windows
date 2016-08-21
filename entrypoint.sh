#!/bin/bash
function finish {
  eval `ssh-agent -k` > /dev/null
}
trap finish EXIT

function start {
  eval `ssh-agent -s` > /dev/null
  if [ -d ${SSH_KEYS} ]; then
    KEY_DIR=`mktemp -d`
    cp ${SSH_KEYS}/* ${KEY_DIR}
    chmod 700 -R ${KEY_DIR}
    for k in `ls ${KEY_DIR}`; do
      ssh-add ${KEY_DIR}/$k
    done
  fi
}

start
$@

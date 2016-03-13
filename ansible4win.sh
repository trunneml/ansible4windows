#!/bin/bash
docker run --rm -v `pwd`:/ansible -it trunneml/ansible4windows $@

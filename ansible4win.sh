#!/bin/bash
docker run --rm -v `pwd`:/home/ansible -it trunneml/ansible4windows $@

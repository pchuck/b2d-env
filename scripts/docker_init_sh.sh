#!/bin/sh
export DOCKER_IP=$(boot2docker ip 2>/dev/null)
$(boot2docker shellinit)

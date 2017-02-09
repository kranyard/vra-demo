#!/bin/bash
echo $*
id
ssh root@photon-010 "/root/vra-demo/scm-blueprint.sh $*"

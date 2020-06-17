#!/usr/bin/env sh

peer-finder -on-change=/on-change.sh -on-start=/on-change.sh -service=sfs -ns=default -dns-suffix=svc.cluster.local

while true; do sleep 1000; done

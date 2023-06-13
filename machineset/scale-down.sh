#!/bin/bash

oc login -u jay -p rahasia https://api.cluster-hvt9q.hvt9q.sandbox1172.opentlc.com:6443
oc project openshift-machine-api
oc scale --replicas=0 machineset cluster-hvt9q-2sbxc-worker-ap-southeast-1b
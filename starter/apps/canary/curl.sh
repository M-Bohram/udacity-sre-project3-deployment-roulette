#!/bin/bash

kubectl run debug --image nicolaka/netshoot --namespace udacity -- sleep 1000

until kubectl get po debug --namespace udacity | grep Running > /dev/null
do
    sleep 1
done

CACHE=()

for i in {1..10}
do
    CACHE+=`kubectl exec -it debug --namespace udacity -- curl canary-svc`
done

echo ${CACHE[@]} | tee canary.txt

kubectl delete po debug --namespace udacity 
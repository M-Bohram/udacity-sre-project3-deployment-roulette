#!/bin/bash

set -e

current_dir=$(pwd)

kubectl apply -f "$current_dir/starter/apps/hello-world"
kubectl apply -f "$current_dir/starter/apps/canary/index_v1_html.yml"
kubectl apply -f "$current_dir/starter/apps/canary/canary-v1.yml"
kubectl apply -f "$current_dir/starter/apps/blue-green"
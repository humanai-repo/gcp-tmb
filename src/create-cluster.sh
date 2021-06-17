#!/bin/bash

# Requires COMPUTE_ZONE and PROJECT_ID to be set.

set -e

gcloud config set compute/zone $COMPUTE_ZONE
gcloud config set project $PROJECT_ID
gcloud container clusters create test-cluster --num-nodes=1 --machine-type=n1-highmem-8

kubectl get nodes

#!/bin/bash

gcloud container clusters get-credentials test-cluster --zone $COMPUTE_ZONE

kubectl create -f ./ectmb.yml

kubectl get pods

#!/bin/bash

gcloud container clusters get-credentials test-cluster --zone $COMPUTE_ZONE

kubectl create -f ./ectmb-helloworld.yml

kubectl get pods

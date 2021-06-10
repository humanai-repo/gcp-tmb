#!/bin/bash

# Delete the cluster
gcloud container clusters delete test-cluster --zone $COMPUTE_ZONE

# Delete the docker image
gcloud container images delete gcr.io/${PROJECT_ID}/ectmb-nodeps:latest  --force-delete-tags --quiet

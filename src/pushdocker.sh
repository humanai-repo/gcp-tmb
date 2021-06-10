#!/bin/bash

# Enable the container registry (needs to be done once per project)
gcloud services enable containerregistry.googleapis.com

# Configure Auth
gcloud auth configure-docker

# Tag the ectmb nodeps image for this repo
docker tag $IMAGE_ID gcr.io/${PROJECT_ID}/ectmb-nodeps:latest

docker push gcr.io/${PROJECT_ID}/ectmb-nodeps:latest

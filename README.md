# GCP TMB
 Run the TMB package on GCP

# Dependencies
gcloud, kubectl, docker

kubectl can installed via glcoud

```bash
gcloud components install kubectl
```

# Run

Set up a GKE cluster.

```bash
./src/create-cluster.sh
```

Push the docker image to GKE.

```bash
./src/pushdocker.sh
```

Create the ectmb job

```bash
./src/pushdocker.sh
```

Gather any stats required throught the Google Cloud console.

Crude polling of the cluster can be achieved with:

```bash
while :; do kubectl get pods; sleep 30; done
```

Cleanup the cluster and docker image.

```bash
./src/delete-cluster.sh
```

Note the cluster logs will persist post deletion, but the cluster metrics will not.

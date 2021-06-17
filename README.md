# GCP TMB
Run the [TMB package](https://github.com/humanai-repo/TMB-package) on GCP. This
package is designed to benchmark the performance of GCP against Parcel.

# Dependencies
gcloud, kubectl, docker.

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
kubectl create -f ./ectmb-test.yml
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

Note the cluster logs will persist post deletion, but the cluster metrics will
not.

# Benchmarking
There are three jobs for the benchmark:
 *  helloworld.yml -- Loads a docker image and prints the ecTMB help output
    (an R script).
 *  test.yml -- Applies a pre-trained tumour mutation burden classifier.
 *  train.yml -- Trains a new tumour mutation burden classifier.

By submitting the job and polling the cluster, the execution time can be
measured. Memory usage, CPU utilization and IO can be read from panopticon
by visiting the GCP console and following these links:
 *  Node Utilization: Cloud Console &rightarrow; Kubernetes Engine &rightarrow;
    Clusters &rightarrow; test-cluster &rightarrow; nodes &rightarrow; gke-test-cluster-default-pool-\*-\*
 *  Job Utilization: Cloud Console &rightarrow; Kubernetes Engine
    &rightarrow; Object Browser &rightarrow; batch &rightarrow; job
    &rightarrow; ectmb-\*

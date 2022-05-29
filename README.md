
# tree-api

This is the tree-api application serving a REST api.

## Tech stack

### backend

* python 3
* fastapi (https://fastapi.tiangolo.com)
* Docker
* Kubernetes


## Local development

### start the entire app

```
make dev
```

check http://localhost:8000/api/tree

## Local Testing

```
make test
```
## Deploy to dockerhub

```
make deploy-docker-hub
```

## OPEN API Documentation

```
make dev
```

check http://localhost:8000/docs

## K8s

* Autheticate with your container repository and your K8s Cluster

```
kubectl apply -f k8s/namespace
kubectl apply -f k8s/code
```
## CI/CD

* Copy the Makefile in your CI.
* Install gcloud and kubectl on the CI.
* Register your source code repository.
* Login to your docker registry using "docker login" command.
* Store GCP service account key on the CI and update the follwoing in the Makefile
```
{service-account} - Name of your service account.
{path-to-the-key} - Path to the SA key in the CI.
{gcp-project-id} - GCP project ID.
{cluster-name} - Name of the cluster.
{cluster-zone} - Zone of the cluster
```
* Use following commands

```
make deploy-docker-hub - for deploying to container registry
```
```
make deploy-gke - for deploying to K8s cluster
```

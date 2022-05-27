
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
make deploy
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
kubectl apply -f k8s/nginx
kubectl apply -f k8s/code
```
## CI/CD

* Copy the Makefile in your CI.
* Register appropriate credentials for you source code repository,
  Docker registry and K8s Cluster. 
* Setp required environment var
  iables.
* Use following commands

```
make deploy - for deploying to container registry
```
```
make deploy-k8s - for deploying to K8s cluster
```

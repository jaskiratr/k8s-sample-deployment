# K8S Sample Deployment

A sample application to demonstrate deployments with Kubernetes.

## Components

- Front-end built with Nuxt (Vue.js)
- Strapi CMS
- MongoDB

### Local Setup

```sh
minikube start

# Windows
minikube start --vm-driver=hyperv --hyperv-virtual-switch=myCluster --mount --mount-string="D:\Minikube:/minikube-host" --v=3

# Point Docker environment to Minikube
minikube docker-env | Invoke-Expression
# Verify
docker images

# Build images
docker build -t nuxt:latest ./nuxt-app
docker build -t nginx-reverse-proxy:latest ./nginx-reverse-proxy

# Deploy workloads and services
kubectl apply -f .
```

# K8S Sample Deployment

A sample application to demonstrate deployments with Kubernetes.

## Components

- Front-end built with Nuxt (Vue.js)
- Strapi CMS
- MongoDB

### Local Setup

```sh
minikube start --v=3

# Windows
minikube start --vm-driver=hyperv --hyperv-virtual-switch=myCluster --v=3

# Point Docker environment to Minikube
minikube docker-env | Invoke-Expression
# Verify
docker images

# Build front end
docker build -t nuxt:latest ./nuxt-app
kubectl apply -f .
```

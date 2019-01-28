# Local Deployment - Minikube

The images for the microservices are pulled from the Docker Hub registry.

## Deploy

```sh
minikube start

# Deploy workloads and services
kubectl apply -f .

# View all workloads
kubectl get all

# Get the IP address of minikube deployment
minikube ip

# Verify: Launch k8s dashboard for inspecting the deployment.
minikube dashboard
```

Following endpoints are exposed to browser:

- Frontend: `[minikube-ip]:30080`
- CMS: `[minikube-ip]:30083`
- Reverse Proxy for CMS API: `[minikube-ip]:30080/strapi/...` points to `[minikube-ip]:30083`

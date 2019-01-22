# K8S Sample Deployment

Postmate - A sample application to demonstrate deployments with Kubernetes.

## Components

- Front-end built with Nuxt (Vue.js)
- Strapi CMS
- MongoDB

### Local Development - Minikube

_To Do_

### Local Deployment - Minikube

```sh
minikube start

# Windows
minikube start --vm-driver=hyperv --hyperv-virtual-switch=myCluster --v=7

# Point Docker environment to Minikube
minikube docker-env | Invoke-Expression
# Verify
docker images

# Build images
docker build -t k8s-postmate-frontend:latest ./nuxt-app
docker build -t nginx-reverse-proxy:latest ./nginx-reverse-proxy

# Deploy workloads and services
kubectl apply -f .
```

#### Backing up data

_To Do_

### AWS Setup

- Create IAM User
- Attach necessary policies
- Create S3 Bucket `your-unique-state-storage`
- Export env vars

```sh
# configure the aws client to use your new IAM user
aws configure           # Use your new access and secret key here
aws iam list-users      # you should see a list of all your IAM users here

# Because "aws configure" doesn't export these vars for kops to use, we export them now
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)

export NAME="myfirstcluster.example.com"
export KOPS_STATE_STORE="s3://prefix-example-com-state-store"
export EDITOR=nano

# See availability zones
aws ec2 describe-availability-zones --region us-west-2

kops create cluster --zones us-west-2a ${NAME}

kops get ig --name ${NAME}
# Edit node config
kops edit ig nodes --name ${NAME}
# Edit master config
kops edit ig {MASTER NODE NAME FROM THE LIST} --name ${NAME}
```

### Readings:

- [Container Native Development](https://cloudblogs.microsoft.com/opensource/2018/04/23/5-reasons-you-should-be-doing-container-native-development/)

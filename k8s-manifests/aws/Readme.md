# AWS Deployment - kops

The following guide follows the setup described in the [official kops documentation](https://github.com/kubernetes/kops/blob/master/docs/aws.md)

## Prerequisites:

- IAM user with following policies attached.
  ```sh
   AmazonEC2FullAccess
   AmazonRoute53FullAccess
   AmazonS3FullAccess
   IAMFullAccess
   AmazonVPCFullAccess
  ```
- An S3 Bucket with unique name to store kops deployment configuration. E.g. `s3://k8s-postmate-state-storage`

## Deployment

- Setup `aws` client on your local machine.

```sh
# Configure the aws client to use your new IAM user
aws configure           # Use your new access and secret key here
aws iam list-users      # you should see a list of all your IAM users here
```

- Store environment variables for `kops` to refer to.

```sh
# Because "aws configure" doesn't export these vars for kops to use, we export them now
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
export KOPS_CLUSTER_NAME="postmate.k8s.local"
export KOPS_STATE_STORE="s3://k8s-postmate-state-storage"
# Optionally for convenience: Set default editor to nano
export EDITOR=nano

# Alternatively for Windows Powershell:
$AWS_ACCESS_KEY_ID = aws configure get aws_access_key_id
$AWS_SECRET_ACCESS_KEY = aws configure get aws_secret_access_key
$KOPS_CLUSTER_NAME = "postmate.k8s.local"
$KOPS_STATE_STORE = "s3://k8s-postmate-state-storage"
```

- Deploy the cluster.

```sh
# See availability zones
aws ec2 describe-availability-zones --region us-west-2

# Create cluster configuration
# - No AWS resources will be created at this point
# - You may add more availability zones to maintain high availability/
kops create cluster --zones us-west-2a --name ${KOPS_CLUSTER_NAME} --state ${KOPS_STATE_STORE}

# Optional:

  # View instance group configuration
  # This will print the list of k8s nodes and their names
  kops get ig --name ${KOPS_CLUSTER_NAME} --state ${KOPS_STATE_STORE}

  # To edit node configuration
  kops edit ig nodes --name ${KOPS_CLUSTER_NAME}  --state ${KOPS_STATE_STORE}
  # To edit master node config configuration
  kops edit ig [MASTER_NODE_NAME_FROM_THE_LIST] --name ${KOPS_CLUSTER_NAME} --state ${KOPS_STATE_STORE}

# Deploy your cluster to AWS. Creates necessary resources on your AWS account.
kops update cluster --name ${KOPS_CLUSTER_NAME} --state ${KOPS_STATE_STORE} --yes

# Wait for a few minutes for all the resources to be spun up

# Monitor the setup
watch kops validate cluster
# Alternatively on Windows
while (1) {kops validate cluster --name ${KOPS_CLUSTER_NAME} --state ${KOPS_STATE_STORE}; sleep 30}

# Verify: You can look at all the system components with the following command.
kubectl -n kube-system get po

# Deploy the microservices stack
kubectl apply -f .
```

This will create loadbalancers for exposing the services. One of those would point to `frontend` service and the other with `:30083` proxy will point to CMS.

The CMS API is also exposed via the `frontend` loadbalancer on `\strapi\...` url.

## Custom domain

You may configure your Route53 to point to `frontend` loadbalancer URL.

## Reference:

It is highly recommended to go through the [official kops aws documentation](https://github.com/kubernetes/kops/blob/master/docs/aws.md) to get more context about the above stated process.

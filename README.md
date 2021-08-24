# automate-gke-secrets
Demo code to explain how one may use Terraform and ExternalSecerts to automate secrets management.

You can read the Blog Post I made, describing the secrets creation process here: 

# Terraform modules
## Creating a GCP Secret Manager secret

In order to create a new secret, run the following steps:
```
# Clone the repository
git clone https://github.com/netanelkoli/automate-gke-secrets.git
cd automate-gke-secrets/terrafrom
```
Make sure to edit the value sin the `bakend.tf` and `values.tf` files.

```
terraform init
terraform plan 
#Inspect the plan file to see resource to be created
terraform apply
```
## Creating an IAM serviceAccount for ExternalSecrets

The terraform plan created in the previous step will also create an IAM service account resource. This will be then used int he ExternalSecret's helm chart values. Workload Identity in the GKE cluster will assume this serviceAccount to the access to the GCP Secret Manager.

# ExternalSecrets
## Installaing via helm

Change the working dir to `kubernetes` from the downloaded repo:
```
cd kubernetes/external-secrets
```

make sure to specify the right GCP project ID in the values file.

Then, start helm installation:
```
helm repo add external-secrets https://external-secrets.github.io/kubernetes-external-secrets/
helm install -n shared external-secrets external-secrets/kubernetes-external-secrets -f values.yaml --create-namespace
```
## Creating ExternalSecret 

Now, we can create the `external-secret` k8s resource. It will create a k8s secret automatically:
```
cd kubenrets/
kubectl apply -n default -f secrets.yaml
```
Lets see if the secrets created successfully
```
kubectl get externalsecret -n default
kubectl get secrets -n default
```

ENJOY!

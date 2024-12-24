# Terraform Helm Deployment with Minikube

This project demonstrates how to use Terraform to deploy Helm charts in a Minikube Kubernetes cluster. It leverages the `helm_release` resource from the Terraform Helm provider to manage the deployment of a Flask-based environment with environment variables.

## Prerequisites

Before getting started, ensure you have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [Helm](https://helm.sh/docs/intro/install/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Setup

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd <repository-folder>
```

### 2. Initialize Terraform
Initialize Terraform to download the required provider plugins and modules.

```bash
terraform init
```
### 3. Apply Terraform Configuration
Apply the Terraform configuration to create Kubernetes resources and deploy the Helm chart:

```bash
terraform apply
```
### 4. View Deployed Resources
Check the status of your Kubernetes resources:

```bash
kubectl get all --namespace helm-app
```
### 5. Verify Helm Release
To check the status of the Helm release:

```bash
helm list --namespace helm-app
```
### 6. Clean Up
To destroy the deployed resources:

```bash
terraform destroy
```
If you need to delete a namespace manually:

```bash
kubectl delete namespace helm-app
```
## Files Used
- `main.tf`: Contains the Terraform configuration for the Kubernetes and Helm providers.
- `variables.tf`: Defines input variables for the Minikube cluster's configuration.
- `outputs.tf`: Outputs relevant information such as the Minikube API URL and token.
- `flask-env-var-chart`: Custom Helm chart for the Flask application with environment variables.
Notes
- The helm-release and kubernetes providers are used to interact with the Minikube Kubernetes cluster and deploy applications using Helm.
The namespace helm-app is used to deploy resources for this example.
The application uses a simple Flask backend, frontend, and a MongoDB stack with Mongo Express.
## Troubleshooting
If you encounter issues with Helm releases, check the Helm namespace metadata and ensure that the correct labels and annotations are applied:

```bash
kubectl label namespace helm-app app.kubernetes.io/managed-by=Helm --overwrite
kubectl annotate namespace helm-app meta.helm.sh/release-name=flask-env-var --overwrite
kubectl annotate namespace helm-app meta.helm.sh/release-namespace=helm-app --overwrite
```
Verify the namespace's metadata:

```bash
kubectl get namespace helm-app -o yaml
```
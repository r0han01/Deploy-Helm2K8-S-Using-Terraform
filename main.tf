provider "kubernetes" {
  host  = "http://${var.minikube_ip}:46493"  # Updated to match kubectl proxy
}

provider "helm" {
  kubernetes {
    host  = "http://${var.minikube_ip}:46493"  # Updated to match kubectl proxy
  }
}

# Ensure the namespace exists
resource "kubernetes_namespace" "helm_app" {
  metadata {
    name = "helm-app"
  }
}


# Deploy Flask env-var Helm chart
resource "helm_release" "flask_env_var" {
  name      = "flask-env-var"
  namespace = "helm-app"  # Specify the desired namespace
  chart     = "./flask-env-var-chart"
  values    = [<<EOF
replicaCount: 2
EOF
  ]
  create_namespace = true  # Let Helm create and manage the namespace with appropriate labels and annotations
}
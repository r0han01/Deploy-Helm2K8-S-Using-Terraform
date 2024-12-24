variable "minikube_ip" {
  description = "Minikube cluster IP"
  type        = string
  default     = "127.0.0.1"  # Use the default IP if you're running Minikube locally
}

variable "minikube_kubeconfig" {
  description = "Minikube Kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

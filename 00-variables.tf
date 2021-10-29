variable "shipa_token" {
  description = "Shipa API token"
}

variable "cluster_name" {
  description = "Cluster name"
}

variable "cluster_ip" {
  description = "Kubernetes Control Plane IP"
}

variable "cluster_token" {
  description = "Cluster authentication token"
}

variable "cluster_cacert" {
  description = "Cluster authentication certificate"
}

variable "ingress_ip" {
  description = "Cluster Ingress IP"
}



variable "framework_name" {
  description = "Framework name"
}

variable "app_name" {
  description = "Application name"
}

variable "app_image" {
  description = "Application deployment image"
}
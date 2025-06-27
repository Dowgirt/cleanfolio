terraform {
  required_version = ">= 1.0"
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }
}

provider "kubernetes" {
  config_path = "C:/Users/Daniel/.kube/config"  # lub inna ścieżka do kubeconfig, którą używasz
}

provider "kubectl" {
  # konfiguracja kubectl (opcjonalnie)
}

provider "helm" {
  kubernetes = {
    config_path = "C:/Users/Daniel/.kube/config"
  }
}
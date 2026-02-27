data "ibm_container_cluster_config" "cluster_foo" {
  cluster_name_id = var.cluster
}
variable "cluster" {
}

terraform {
  required_version = "> 1.7"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~>1.61.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path = data.ibm_container_cluster_config.cluster_foo.config_file_path
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "terraform-example-namespace"
  }
}


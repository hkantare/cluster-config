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
    }
  }
}

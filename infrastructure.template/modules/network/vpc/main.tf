resource "aws_vpc" "frimorn-vpc" {
  cidr_block           = ""

  tags {
    KubernetesCluster = "${var.k8s_cluster}"
    Name              = "${terraform.workspace}-vpc"
    Environment       = "${terraform.workspace}"
    "kubernetes.io/cluster/${var.k8s_cluster}" = "shared"
  }
}

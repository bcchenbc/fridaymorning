provider "aws" {
  region = "${var.aws_region}"
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

module "vpc" {
  source      = "./modules/network/vpc/"
  tf_cluster = "${var.tf_cluster}"
}

module "security_groups" {
  source                    = "./modules/network/security_group/"

  tf_cluster               = "${var.tf_cluster}"
  vpc_id                    = "${module.vpc_network.vpc_id}"
  workstation-external-cidr = "${local.workstation-external-cidr}"
}

module "route_table_network" {
  source      = "./modules/network/route_table/"

  tf_cluster = "${var.tf_cluster}"
  vpc_id      = "${module.vpc_network.vpc_id}"
  igw_id      = "${module.igw_network.igw_id}"
}

module "launch_configuration" {
  source                       = "./modules/servers/launch_configuration/"

  aws_region                   = "${var.aws_region}"
  tf_cluster                  = "${var.tf_cluster}"
  aws_key_pair_id              = "${module.iam_global.aws_key_pair_id}"

  security_group_id            = "${module.security_groups.node_sg_id}"

  node_instance_type           = "m4.large"
  node_iam_instance_profile_id = "${module.iam_global.node_iam_instance_profile_id}"

  eks_cluster_cert_auth_0data  = "${module.eks_cluster.eks_cluster_cert_auth_0data}"
  eks_cluster_endpoint         = "${module.eks_cluster.eks_cluster_endpoint}"
}

module "eks_cluster" {
  source                = "./modules/eks/cluster/"

  tf_cluster           = "${var.tf_cluster}"
  cluster_iam_role_name = "${module.iam_global.iam_role_master_name}"
  cluster_iam_role_arn  = "${module.iam_global.iam_role_master_arn}"

  vpc_id                = "${module.vpc_network.vpc_id}"
  vpc_cidr_prefix       = "${module.vpc_network.vpc_cidr_prefix}"
  cluster_sg_id         = "${module.security_groups.cluster_sg_id}"
  public_rt_id          = "${module.route_table_network.public_rt_id}"

  node_launch_config_id = "${module.launch_configuration.node_launch_config_id}"
}

module "k8s_config_map" {
  source            = "./modules/k8s/config_map"

  node_iam_role_arn = "${module.iam_global.iam_role_node_arn}"
}

module "k8s_pods" {
  source = "./modules/k8s/pod"
  spark_user_name = "symph"
}
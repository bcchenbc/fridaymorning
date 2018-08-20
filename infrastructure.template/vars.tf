variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "tf_cluster" {
  description = "Name of the terraform cluster"
  default     = "frimorn00"
  type        = "string"
}

variable "locust_workers_count" {
  description = "Number of locust workers"
  default     = "10"
  type        = "string"
}

variable "s3_bucket" {
  description = "Must be a globally unique bucket name across aws"
  default = "symph.k8s.state"
}
# First Terraform configuration
# https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180


# Variables & Data & Options
variable "project_name" {
  default = "FridayMorning"
}

variable "project_root" {
  default = "/D/Active/fridaymorning"
  description = "NOTE! Change this to meet your need."
}

variable "default_instance_type" {
  default = "m3.medium"
  description = "Default EC2 instance type"
}

variable "default_keypair_path" {
  default = "../private/ssh_key.pub"
  description = "Default keypair file for accessing instances."
}

variable "default_aws_region" {
  default = "us-west-2"
  description = "Default AWS region: Oregon"
}

variable "default_ami" {
  type = "string"
  default = "ami-ba602bc2"
  description = "Ubuntu Server 16.04 LTS (HVM), SSD Volume Type"
  #default = "ami-ba602bc2"
  #description = "Ubuntu Server 16.04 LTS (HVM), SSD Volume Type"
}

# Shared Configurations

resource "aws_key_pair" "fridaymorning" {
  key_name   = "fridaymorning"
  public_key = "${file(var.default_keypair_path)}"
}

provider "aws" {
  region = "${var.default_aws_region}"
  profile = "default"
  shared_credentials_file = "${var.project_root}/private/aws_credentials"
}


# User Data to be injected
data "template_file" "ec2_user_data" {
  template = "${file("gitlab/user_data.sh.tpl")}"

  vars {
    ami = "${var.default_ami}"
  }
}

# EC2 Configurations

resource "aws_instance" "gitlab" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  user_data = "${data.template_file.ec2_user_data.rendered}"
  #user_data = "${file("gitlab/user_data.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "gitlab"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}

resource "aws_instance" "beats" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  #user_data = "${data.template_file.ec2_user_data.rendered}"
  user_data = "${file("beats/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "beats"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}

resource "aws_instance" "collectd" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  user_data = "${file("collectd/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "collectd"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}

resource "aws_instance" "elasticsearch" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  user_data = "${file("elasticsearch/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "elasticsearch"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}

resource "aws_instance" "frontend" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  user_data = "${file("frontend/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "frontend"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}

resource "aws_instance" "gatling" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  #user_data = "${data.template_file.ec2_user_data.rendered}"
  user_data = "${file("gatling/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "gatling"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}

/*
resource "aws_instance" "haproxy" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  #user_data = "${data.template_file.ec2_user_data.rendered}"
  user_data = "${file("haproxy/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "haproxy"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}
*/

resource "aws_instance" "kibana" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  #user_data = "${data.template_file.ec2_user_data.rendered}"
  user_data = "${file("kibana/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "kibana"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}

resource "aws_instance" "logstash" {
  ami = "${var.default_ami}"
  instance_type = "${var.default_instance_type}"

  lifecycle {
    create_before_destroy = true
  }

  #user_data = "${data.template_file.ec2_user_data.rendered}"
  user_data = "${file("logstash/install.sh")}"
  key_name = "fridaymorning"

  tags {
    ResourceName = "logstash"
    ProjectName = "${var.project_name}"
    Terraform = "services/main.tf"
  }
}




output "public_ip" {
  value = "${aws_instance.gitlab.public_ip}"
}

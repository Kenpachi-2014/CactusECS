variable "aws_access_key" {
    description = "AWS access key."
}

variable "aws_secret_key" {
    description = "AWS secret key."
}

variable "region" {
    description = "AWS region."
    default = "us-east-1"
}

variable "availability_zone" {
    description = "Availability zone"
    default = "us-east-1a"
}

variable "ecs_cluster_name" {
    description = "Name Amazon ECS cluster."
    default = "cactus-ecs-cluster"
}

variable "amis" {
    description = "AWS ECS optimized images."
    default = {
        us-east-1 = "ami-ddc7b6b7"
    }
}

variable "autoscale_min" {
    default = "1"
    description = "Minimum number of EC2"
}

variable "autoscale_max" {
    default = "10"
    description = "Maximum number of EC2"
}

variable "autoscale_desired" {
    default = "4"
    description = "Desired number of EC2"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ssh_pubkey_file" {
    description = "Path to SSH public key"
    default = "~/.ssh/id_rsa.pub"
}

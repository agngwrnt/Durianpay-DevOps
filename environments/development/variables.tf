variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "cpu_threshold" {
  description = "Threshold for CPU utilization alarm"
  type        = number
}

variable "memory_threshold" {
  description = "Threshold for memory utilization alarm"
  type        = number
}

variable "network_in_threshold" {
  description = "Threshold for network-in utilization alarm"
  type        = number
}

variable "network_out_threshold" {
  description = "Threshold for network-out utilization alarm"
  type        = number
}

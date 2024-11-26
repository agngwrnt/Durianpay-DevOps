variable "ami_id" {
  description = "The AMI ID to use for instances"
}

variable "instance_type" {
  description = "The type of EC2 instance to use"
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling group"
  default     = 2
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling group"
  default     = 5
}

variable "desired_capacity" {
  description = "The desired capacity of the Auto Scaling group"
  default     = 2
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling group"
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
}

variable "cpu_threshold" {
  description = "CPU utilization threshold for scaling out"
  default     = 45
}

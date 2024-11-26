variable "cpu_threshold" {
  default = 45
}

variable "memory_threshold" {
  default = 80
}

variable "network_in_threshold" {
  default = 10000000 # bytes
}

variable "network_out_threshold" {
  default = 10000000 # bytes
}

variable "asg_name" {}
variable "instance_id" {}
variable "environment" {}

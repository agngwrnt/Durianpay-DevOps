variable "cidr_block" {
  default = "10.1.0.0/16"
}
variable "public_subnet_cidr" {
  default = "10.1.1.0/24"
}
variable "private_subnet_cidr" {
  default = "10.1.2.0/24"
}
variable "availability_zone" {
  default = "ap-southeast-1a"
}
variable "environment" {}
variable "tags" {
  default = {}
}


module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = "10.1.0.0/16"
  public_subnet_cidr  = "10.1.1.0/24"
  private_subnet_cidr = "10.1.2.0/24"
  availability_zone   = "ap-southeast-1a"
  environment         = "dev"
  tags                = { Environment = "dev" }
}

module "autoscaling" {
  source           = "../../modules/autoscaling"
  ami_id           = "ami-0c55b159cbfafe1f0"
  instance_type    = "t2.medium"
  min_size         = 2
  max_size         = 5
  desired_capacity = 2
  subnet_ids       = [module.vpc.private_subnet_id]
  environment      = "dev"
  cpu_threshold    = 45
}

module "cloudwatch" {
  source               = "../../modules/cloudwatch"
  cpu_threshold        = 45
  memory_threshold     = 80
  network_in_threshold = 10000000
  network_out_threshold = 10000000
  asg_name             = module.autoscaling.asg_id
  instance_id          = "i-0123456789abcdef"
  environment          = var.environment
}

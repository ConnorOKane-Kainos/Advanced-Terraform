module "ec2_webservers" {
  source = "../../modules/ec2_web_module"

  region      = var.aws_region
  project     = var.project
  environment = var.environment

  instance_count  = var.web_instance_count
  instance_type   = var.web_instance_type
  instance_ami_id = data.aws_ami.ubuntu.id
  user_data_file  = file("${path.module}/ami_user_data/init.sh")
  instance_role   = "web-ec2"

  vpc_id = data.terraform_remote_state.networking.outputs.vpc_id
  # public_subnets_ids   = data.terraform_remote_state.networking.outputs.public_subnets_ids
  subnet_id = data.terraform_remote_state.networking.outputs.private_subnet_ids

  #   keypair              = aws_key_pair.ssh_key.key_name
  ec2_sg_ingress_rules = local.ec2_web_sg_ingress_rules
  ec2_sg_egress_rules  = local.ec2_web_sg_egress_rules

}
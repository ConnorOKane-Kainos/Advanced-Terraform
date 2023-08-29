output "vpc_id" {
    value = module.networking.vpc_id
}

output "public_subnet_ids" {
    value = module.networking.public_subnets_ids
}

output "private_subnet_ids" {
    value = module.networking.private_subnets_ids
}
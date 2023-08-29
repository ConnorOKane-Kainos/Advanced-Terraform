/*
This Terraform code defines an AWS Elastic IP (EIP) resource intended for NAT (Network Address Translation) gateways:

1. `count`: This creates the specified number of EIP resources based on the value of `var.nat_gateway_count`. This is useful if you need multiple EIPs, for example, for multiple NAT Gateways across several availability zones.

2. `domain`: The domain property specifies that the EIP is associated with resources within a VPC (Virtual Private Cloud) as opposed to EC2-Classic.

3. `tags`: The tags block is used to assign metadata to the EIP resource. It merges two sets of tags:
   - `local.default_tags`: Represents a set of default tags likely defined elsewhere in the Terraform code.
   - A generated map that creates a 'Name' tag with a value constructed by combining the `local.naming_prefix` with the string 'eip-' and the current resource's index. This ensures a unique name for each EIP when multiple are created.

This resource is typically used in AWS environments to allocate a public IP address that can be associated with AWS resources such as NAT Gateways or EC2 instances.
*/

resource "aws_eip" "nat" {
  count = var.module_nat_gateway_count

  domain = "vpc"

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.naming_prefix}-eip-${count.index}" })
  )

}
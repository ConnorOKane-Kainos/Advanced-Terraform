/*
This Terraform code defines an AWS Internet Gateway resource, which serves as a gateway for communication between
resources inside a VPC (Virtual Private Cloud) and the internet:

1. `count`: This checks the length of the `var.public_subnets` list. If there's at least one public subnet
(i.e., the list length is greater than 0), it creates one Internet Gateway; otherwise, it doesn't create any.
This logic ensures the Internet Gateway is only created if there are public subnets present.

2. `vpc_id`: Associates the Internet Gateway with a VPC, using the ID of the VPC resource named `aws_vpc.vpc`.

3. `tags`: The tags block assigns metadata to the Internet Gateway. It merges two sets of tags:
   - `local.default_tags`: Represents a set of default tags likely defined elsewhere in the Terraform code.
   - A generated map that creates a 'Name' tag, which combines the `local.naming_prefix` with the string 'intgw-' and the current resource's index. If multiple resources are created (although unlikely in this context), this ensures each has a unique name.

The Internet Gateway is crucial for resources inside the VPC to communicate with the outside world, particularly for resources within public subnets.
*/

resource "aws_internet_gateway" "internet_gateway" {
  count = length(var.module_public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.naming_prefix}-intgw-${count.index}" })
  )
}
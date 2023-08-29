/*
This code defines an AWS NAT Gateway, which allows resources in a VPC's private subnet to access the internet without
being directly exposed to it. 

- It creates as many NAT Gateways as specified by `var.nat_gateway_count`.
- Each NAT Gateway is associated with a unique Elastic IP and resides in a public subnet.
- Metadata tags are applied for easy identification, merging default tags and a unique naming convention based on `local.naming_prefix`.
- Creation of the NAT Gateway is dependent on the existence of an Internet Gateway, ensuring necessary network connectivity.
*/


resource "aws_nat_gateway" "nat_gateway" {
  count = var.nat_gateway_count

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.naming_prefix}-natgw-${count.index}" })
  )

  depends_on = [aws_internet_gateway.internet_gateway]
}
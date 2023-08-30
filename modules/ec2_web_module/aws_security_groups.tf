# Create an EC2 security group with a dynamic name based on a local naming prefix.

resource "aws_security_group" "ec2_sg" {
  name        = "${local.naming_prefix}-sg"
  description = "Security Group for EC2 instances"
  vpc_id      = var.vpc_id


  dynamic "ingress" {
    for_each = var.ec2_sg_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.ec2_sg_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks

    }
  }

  tags = {
    Name = "${local.naming_prefix}-sg"
  }

}
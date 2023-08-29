resource "aws_instance" "web" {
  count         = var.module_instance_count

  ami           = var.module_instance_ami_id
  instance_type = var.module_instance_type
  subnet_id     = var.module_aws_subnet[count.index % length(var.aws_subnet)]

  user_data = var.module_user_data_file

  tags = {
    Name = "${local.naming_prefix}-webserver-${count.index}"
  }

  lifecycle {
    create_before_destroy = true
  }

}
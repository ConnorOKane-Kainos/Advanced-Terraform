resource "aws_instance" "web" {
count         = var.instance_count

  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id[count.index % length(var.subnet_id)]

  user_data = var.user_data_file

  tags = {
    Name = "${local.naming_prefix}-webserver-${count.index}"
  }

  lifecycle {
    create_before_destroy = true
  }

}
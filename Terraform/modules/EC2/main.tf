resource "aws_instance" "development" {
  tags = {
    Name = var.tag
  }
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.sg_id
  user_data_base64 = var.user_data
  root_block_device {
    volume_size = var.volume_size
    encrypted   = true
  }
  iam_instance_profile = var.instance_profile
  lifecycle {
    create_before_destroy = true
  }
}

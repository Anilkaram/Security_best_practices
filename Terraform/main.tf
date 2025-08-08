
module "sg" {
  source = "./modules/SG"
  ingress_ports = [443, 80, 22, 8080, 5000, 27017, 3000]
}

module "iam" {
  source = "./modules/IAM"
}

module "EC2" {
  source = "./modules/EC2"
  tag = "development_server"
  ami_id = "ami-0a7d80731ae1b2435"
  instance_type = "t2.micro"
  key_name = "latest_key"
  sg_id = [module.sg.sg_id]
  volume_size = 28
  user_data = filebase64("${path.module}/docker.sh")
  instance_profile = module.iam.admin_profile
}



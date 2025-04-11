provider "aws" {
    region = "us-east-1"
  
}
module "ec2_instance" {
    source = "./ec2_instance/"
    ami_val = "ami-084568db4383264d4"
    instance_type_val = "t2.micro"
}

output "myserver_public_ip" {
  value = module.ec2_instance.myserver_ip
  
}
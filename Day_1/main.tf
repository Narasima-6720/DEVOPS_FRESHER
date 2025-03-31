#configure the provider
provider "aws" {
    region = "us-east-1"
  
}

#crate the ec2 resource
resource "aws_instance" "server1" {
    ami = "ami-071226ecf16aa7d96"
    instance_type = "t2.micro"
    key_name = "Ansible"
    count = 2
    tags={
        "name"="MYPRODSRV"
    }
  
}
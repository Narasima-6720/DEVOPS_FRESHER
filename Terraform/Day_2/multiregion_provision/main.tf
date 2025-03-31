#provider aws that provision resource in N.Virginia region
provider "aws" {
    region = "us-east-1"
    alias = "nv"
  
}
#provider aws that provision resource in mumbai region
provider "aws" {
    region = "ap-south-1"
    alias = "mum"
  
}

#Creating the instance in N.Virginia region
resource "aws_instance" "srv1" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    key_name="Ansiblekey"
    count = 1
    provider = aws.nv

    tags = {
        "name"="myprod1"
    }
  
}
#Creating the instance in mumbai region
resource "aws_instance" "srv2" {
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    key_name="server"
    count = 1
    provider = aws.mum

    tags = {
        "name"="myprod2"
    }
  
}

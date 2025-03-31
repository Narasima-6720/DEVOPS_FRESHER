
# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  
}
resource "aws_instance" "server" {
  ami           = "ami-053a45fff0a704a47"
  instance_type = "t2.micro"
  key_name = "aws_key"
  count = 1

  tags = {
    Name = "myserver1"
  }
}

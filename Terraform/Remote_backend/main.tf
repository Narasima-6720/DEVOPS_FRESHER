

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myserver" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    tags = {
      Name = "myserver"
    }
    count = 1

  
}


resource "aws_s3_bucket" "mybucket" {
    bucket = "mybkt-remote-bk633"
    lifecycle {
      prevent_destroy = false
    }
  
}

resource "aws_dynamodb_table" "mystatelocking" {
  name = "statelock-dbt"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  
}

provider "aws" {
  region = "region-name"
}

resource "aws_s3_bucket" "mybkt-rembd" {
  bucket = "bucket-name"
}

resource "aws_instance" "server1" {
    ami = "your-ami"
    instance_type = "your ami"
    tags = {
      name="server1"
    }
  
}

terraform {
  backend "s3" {
    
  bucket = "bucket-name"
  region = "region-name"
  key = "bucketname/terraform.tfstate"
  }
}

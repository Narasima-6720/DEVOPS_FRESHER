terraform {
  backend "s3" {
    bucket = "mybkt-remote-bk633"
    key = "mystatfile/terraform.tfstate"
    region = "us-east-1"
    dynamodb_endpoint = "statelock-dbt"

    
  }
}
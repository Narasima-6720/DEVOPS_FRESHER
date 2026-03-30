#!/bin/bash

######################
# Author: Narasimha Reddy
# Description: This script is used to list the resources in aws
# version: v1
# Usage: ./list_resources_aws.sh region servicename

#######################

# Validation of Input based on arguments

set -e
set -o pipefail

if [ $# -ne 2 ]; then
    echo "Usage: ./list_resources_aws.sh <region> <service>"
    echo "Example: ./list_resources_aws.sh us-east-1 ec2(smallercase servicename)"
    exit 1
fi

# Check if aws cli installed or not

if ! command -v aws &> /dev/null; then
    echo "Please Install the aws cli and try again..."
    exit 1
fi


# Check aws cli is configured or not

aws sts get-caller-identity > /dev/null 2>&1 || {
    echo "AWS not configured"
    exit 1
}


aws_region=$1
service_name=$2

case $service_name in
    ec2)
        echo "List all ec2 instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    s3)
        echo "List all s3 buckets in $aws_region"
        aws s3 ls --region $aws_region
        ;;
    rds)
        echo "List all the rds in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    cloudfront)
        echo "List all cloudfront"
        aws cloudfront list-distributions 
        ;;
    iam)
        echo "List of users"
        aws iam list-users 
        ;;
    elb)
        echo "List of all loadbalancers in $aws_region"
        aws elb describe-load-balancers --region $aws_region
        ;;
    dynamodb)
        echo "List all dynamodb in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    vpcs)
        echo "List of vpcs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    *)
        echo "Invalid service please enter valid service!!"
        exit 1
        ;;
esac







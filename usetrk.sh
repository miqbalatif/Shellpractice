#!/bin/bash

# Set AWS profile name (optional, if you have multiple AWS profiles configured)
AWS_PROFILE="your_aws_profile_name"

# Set the path to the log file where usage data will be saved
LOG_FILE="/path/to/usage.log"

# Function to gather EC2 instance usage
get_ec2_usage() {
    echo "EC2 Instance Usage:"
    aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name]' --output table --profile $AWS_PROFILE >> $LOG_FILE
}

# Function to gather S3 bucket usage
get_s3_usage() {
    echo "S3 Bucket Usage:"
    aws s3 ls --profile $AWS_PROFILE >> $LOG_FILE
}

# Function to gather Lambda function usage
get_lambda_usage() {
    echo "Lambda Function Usage:"
    aws lambda list-functions --profile $AWS_PROFILE >> $LOG_FILE
}

# Function to gather IAM instance usage
get_iam_usage() {
    echo "IAM Instance Usage:"
    aws iam list-users --profile $AWS_PROFILE >> $LOG_FILE
}

# Main function to run at 6 PM every day
main() {
    echo "AWS Usage Report - $(date)" >> $LOG_FILE
    get_ec2_usage
    get_s3_usage
    get_lambda_usage
    get_iam_usage
    echo "----------------------------------------" >> $LOG_FILE
}

# Call the main function
main


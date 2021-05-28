#!/bin/bash
CFN_NAME=udacity-network ; aws cloudformation create-stack --stack-name $CFN_NAME --template-body file://network.yml --parameters file://network-properties.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"
CFN_NAME=udacity-sg ; aws cloudformation create-stack --stack-name $CFN_NAME --template-body file://sg.yml
CFN_NAME=udacity-rds ; aws cloudformation create-stack --stack-name $CFN_NAME --template-body file://rds.yml --parameters  ParameterKey=RDSPassword,ParameterValue=securepassword
CFN_NAME=udacity-ec2 ; aws cloudformation create-stack --stack-name $CFN_NAME --template-body file://ec2.yml
CFN_NAME=udacity-rds ; aws cloudformation create-stack --stack-name $CFN_NAME --template-body file://cloudfront.yml --parameters  ParameterKey=WorkflowID,ParameterValue=dg2fft5w25j6gfah

aws s3 mb s3://udapeople-dg2fft5w25j6gfah --region eu-central-1   
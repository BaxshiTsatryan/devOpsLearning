#!/bin/bash

KEY_NAME="key1"
KEY_NAME_PEM="key1.pem"
IMAGE_ID="ami-024f768332f080c5e"
SG_ID="sg-0082843b77f2c682a"
SUBNET_ID="subnet-07b9968b8dc3def09"


function createKey {
aws ec2 create-key-pair --key-name $KEY_NAME --query 'KeyMaterial' --output text > $KEY_NAME_PEM
}

function deleteKey {
aws ec2 delete-key-pair --key-name $KEY_NAME
}

function launchInstance {
aws ec2 run-instances --image-id $IMAGE_ID --count 1 --instance-type t2.micro --key-name $KEY_NAME --security-group-ids $SG_ID --subnet-id $SUBNET_ID
}

function terminateInstance {
aws ec2 terminate-instances --instance-ids i-5203422c
}

createKey
launchInstance
terminateInstance
deleteKey




# if aws ec2 run-instances --image-id ami-024f768332f080c5e --count 1 --instance-type t2.micro --key-name rtl --security-group-ids sg-0082843b77f2c682a --subnet-id subnet-07b9968b8dc3def09; then
#     echo "success"
# else
#     echo "error"
# fi

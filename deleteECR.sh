#!/bin/bash

# Example string
string=`aws ecr describe-repositories --query "repositories[].repositoryName" --output text --profile personal --region ap-southeast-1`

# Save the current value of IFS
OLD_IFS=$IFS

# Set IFS to space
IFS=$'\t'

# Split the string into an array
read -ra parts <<< "$string"

# Restore the original value of IFS
IFS=$OLD_IFS

# Print each part
for part in "${parts[@]}"; do
  aws ecr delete-repository --repository-name $part --profile personal --region ap-southeast-1 > /dev/null 2>&1 < /dev/null 
done


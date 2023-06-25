#!/bin/bash

# Example string
string=`aws codecommit list-repositories --query "repositories[].repositoryName" --profile personal --region ap-southeast-1 --output text`

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
  aws codecommit delete-repository --repository-name $part --profile personal --region ap-southeast-1 
done


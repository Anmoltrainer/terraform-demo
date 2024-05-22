#!/bin/bash

# Define environments (modify as needed)
envs=(dev staging prod)

# Create workspaces (if they don't exist)
for env in "${envs[@]}"; do
  terraform workspace new "$env" || true
done

# Loop through environments and deploy
for env in "${envs[@]}"; do
  echo "Deploying to environment: $env"

  # Switch to the workspace
  terraform workspace select "$env"

  # Apply Terraform configuration (assuming main.tf is in the current directory)
  terraform apply -auto-approve

  # Optional: Output instance details after deployment
  if [ "$env" == "prod" ]; then
    echo "** Production Instance Details (if applicable):"
    terraform output | grep instance_id | awk '{print $3}'
  fi
done

echo "Deployment complete!"

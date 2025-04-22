#!/bin/bash

# Deployment script that dynamically handles different environments
# Used with the conditional execution example in GitLab CI/CD

# Get environment name from first argument
ENVIRONMENT=$1
VERSION=${CI_COMMIT_TAG:-$CI_COMMIT_SHORT_SHA}

echo "Starting deployment process for $GLOBAL_APP_NAME"
echo "Environment: $ENVIRONMENT"
echo "Version: $VERSION"

# Create environment-specific configuration
case $ENVIRONMENT in
  production)
    echo "Deploying to PRODUCTION environment"
    DEPLOY_URL="https://production.example.com"
    DEBUG_MODE="false"
    ;;
  staging)
    echo "Deploying to STAGING environment"
    DEPLOY_URL="https://staging.example.com"
    DEBUG_MODE="true"
    ;;
  qa)
    echo "Deploying to QA environment"
    DEPLOY_URL="https://qa.example.com"
    DEBUG_MODE="true"
    ;;
  *)
    echo "Deploying to custom environment: $ENVIRONMENT"
    DEPLOY_URL="https://$ENVIRONMENT.example.com"
    DEBUG_MODE="true"
    ;;
esac

# Generate configuration based on environment
echo "Generating environment-specific configuration..."
cat > config.$ENVIRONMENT.json << EOF
{
  "version": "$VERSION",
  "environment": "$ENVIRONMENT",
  "app_name": "$GLOBAL_APP_NAME",
  "url": "$DEPLOY_URL",
  "debug": $DEBUG_MODE
}
EOF

echo "Configuration created:"
cat config.$ENVIRONMENT.json

echo "Deployment completed successfully!"

# This script doesn't actually deploy anything - it's just for the workshop demonstration
exit 0
#!/bin/bash

# Exit on any error
set -e

# Configuration
IMAGE_NAME="starchain-mainnet"
REGISTRY="registry.starlabs.web.id"
DOCKERFILE="mainnet.Dockerfile"

# Generate timestamp for versioning

echo "Starting Docker build and push process..."

# Check if Dockerfile exists
if [ ! -f "$DOCKERFILE" ]; then
    echo "Error: $DOCKERFILE not found!"
    exit 1
fi

# Build Docker image
echo "Building Docker image from $DOCKERFILE..."
docker build -f "$DOCKERFILE" -t "$IMAGE_NAME:latest" .

if [ $? -eq 0 ]; then
    echo "✓ Docker image built successfully"
else
    echo "✗ Docker build failed"
    exit 1
fi

# Tag images for registry
echo "Tagging images for registry $REGISTRY..."
docker tag "$IMAGE_NAME:latest" "$REGISTRY/$IMAGE_NAME:latest"

if [ $? -eq 0 ]; then
    echo "✓ Images tagged successfully"
else
    echo "✗ Image tagging failed"
    exit 1
fi

# Push images to registry
echo "Pushing images to registry..."
echo "Pushing $REGISTRY/$IMAGE_NAME:latest..."
docker push "$REGISTRY/$IMAGE_NAME:latest"

if [ $? -eq 0 ]; then
    echo "✓ Latest image pushed successfully"
else
    echo "✗ Failed to push latest image"
    exit 1
fi

# Summary
echo "==========================================="
echo "✓ Build and push completed successfully!"
echo "==========================================="
echo "Images pushed:"
echo "${REGISTRY}/${IMAGE_NAME}:latest"
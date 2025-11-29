#!/bin/bash

# DanStack Configuration Applicator
# This script installs dependencies and applies system configuration

set -e

echo "🚀 DanStack Configuration Applicator"
echo ""

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEPLOY_DIR="$SCRIPT_DIR/deploy"

# Install dependencies
echo "📦 Installing dependencies..."
cd "$DEPLOY_DIR"
npm install

# Run deployment
echo ""
echo "⚙️  Running deployment..."
npm run deploy

echo ""
echo "✨ Done!"

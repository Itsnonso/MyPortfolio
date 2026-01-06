#!/bin/bash
# GitHub Pages Deployment Script for Mac/Linux
# This script builds and prepares your Blazor portfolio for GitHub Pages

echo "===================================="
echo "GitHub Pages Deployment Script"
echo "===================================="
echo

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "ERROR: Git is not installed"
    echo "Please install Git first"
    exit 1
fi

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "ERROR: GitHub username cannot be empty"
    exit 1
fi

echo
echo "Using GitHub username: $GITHUB_USERNAME"
echo "Your site will be: https://$GITHUB_USERNAME.github.io"
echo

# Update URLs in files
echo "Updating URLs in project files..."

sed -i.bak "s/yourusername/$GITHUB_USERNAME/g" wwwroot/sitemap.xml && rm wwwroot/sitemap.xml.bak
sed -i.bak "s/yourusername/$GITHUB_USERNAME/g" wwwroot/robots.txt && rm wwwroot/robots.txt.bak
sed -i.bak "s/yourusername/$GITHUB_USERNAME/g" wwwroot/index.html && rm wwwroot/index.html.bak

echo "URLs updated successfully!"
echo

# Build the project
echo "Building project in Release mode..."
dotnet publish -c Release -o ./publish

if [ $? -ne 0 ]; then
    echo "ERROR: Build failed!"
    exit 1
fi

echo "Build successful!"
echo

# Prepare wwwroot for GitHub Pages
echo "Preparing for GitHub Pages deployment..."
cd publish/wwwroot

# Create .nojekyll file
touch .nojekyll
echo "Created .nojekyll file"

# Create 404.html for SPA routing
cp index.html 404.html
echo "Created 404.html for SPA routing"

echo
echo "===================================="
echo "Preparation Complete!"
echo "===================================="
echo
echo "Next steps:"
echo
echo "1. Create a GitHub repository named: $GITHUB_USERNAME.github.io"
echo "   Go to: https://github.com/new"
echo
echo "2. Run these commands to deploy:"
echo "   cd publish/wwwroot"
echo "   git init"
echo "   git add ."
echo "   git commit -m 'Initial portfolio deployment'"
echo "   git branch -M main"
echo "   git remote add origin https://github.com/$GITHUB_USERNAME/$GITHUB_USERNAME.github.io.git"
echo "   git push -u origin main"
echo
echo "3. Configure GitHub Pages:"
echo "   - Go to repository Settings > Pages"
echo "   - Source: main branch, / (root) folder"
echo "   - Save"
echo
echo "4. Your site will be live in 2-5 minutes at:"
echo "   https://$GITHUB_USERNAME.github.io"
echo

# Ask if user wants to deploy now
read -p "Would you like to deploy now? (y/n): " DEPLOY_NOW

if [ "$DEPLOY_NOW" = "y" ] || [ "$DEPLOY_NOW" = "Y" ]; then
    echo
    echo "Deploying to GitHub..."
    
    git init
    git add .
    git commit -m "Initial portfolio deployment"
    git branch -M main
    git remote add origin "https://github.com/$GITHUB_USERNAME/$GITHUB_USERNAME.github.io.git"
    
    echo
    echo "Pushing to GitHub..."
    echo "You may be prompted for your GitHub credentials."
    git push -u origin main
    
    if [ $? -ne 0 ]; then
        echo
        echo "Push failed. You may need to:"
        echo "1. Create the repository on GitHub first"
        echo "2. Configure Git credentials"
        echo "3. Run: git push -u origin main manually"
    else
        echo
        echo "===================================="
        echo "Deployment Successful!"
        echo "===================================="
        echo
        echo "Your portfolio is being deployed..."
        echo "It will be live in 2-5 minutes at:"
        echo "https://$GITHUB_USERNAME.github.io"
        echo
        echo "Don't forget to:"
        echo "- Configure GitHub Pages in repository settings"
        echo "- Share your portfolio link!"
    fi
else
    echo
    echo "Deployment skipped. Run the git commands manually when ready."
fi

echo

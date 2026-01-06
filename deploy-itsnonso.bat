@echo off
REM Quick Deployment Script for itsnonso.github.io
REM This deploys to a NEW repository for clean URL

echo ====================================
echo Deploy to itsnonso.github.io
echo ====================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/
    pause
    exit /b 1
)

echo GitHub Username: itsnonso
echo Site URL: https://itsnonso.github.io
echo.

REM Build the project
echo [1/5] Building project in Release mode...
dotnet publish -c Release -o ./publish

if errorlevel 1 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo Build successful!
echo.

REM Prepare wwwroot for GitHub Pages
echo [2/5] Preparing for GitHub Pages deployment...
cd publish\wwwroot

REM Create .nojekyll file (critical for Blazor)
echo. > .nojekyll
echo Created .nojekyll file

REM Create 404.html for SPA routing
copy /Y index.html 404.html >nul
echo Created 404.html for SPA routing

echo.
echo [3/5] Files prepared successfully!
echo.

REM Show instructions
echo ====================================
echo IMPORTANT: Create Repository First!
echo ====================================
echo.
echo Before continuing, create a NEW repository on GitHub:
echo.
echo 1. Go to: https://github.com/new
echo 2. Repository name: itsnonso.github.io
echo 3. Description: Professional .NET Backend Developer Portfolio
echo 4. Visibility: Public (required for free GitHub Pages)
echo 5. DO NOT initialize with README, .gitignore, or license
echo 6. Click "Create repository"
echo.
echo Once created, come back here and continue.
echo.
pause

echo.
echo [4/5] Initializing Git repository...

REM Initialize git
git init
if errorlevel 1 (
    echo ERROR: Git init failed!
    pause
    exit /b 1
)

git add .
if errorlevel 1 (
    echo ERROR: Git add failed!
    pause
    exit /b 1
)

git commit -m "Initial portfolio deployment - Chinonso Iwu .NET Backend Developer"
if errorlevel 1 (
    echo ERROR: Git commit failed!
    pause
    exit /b 1
)

git branch -M main
git remote add origin https://github.com/Itsnonso/itsnonso.github.io.git

echo Git repository initialized!
echo.

echo [5/5] Pushing to GitHub...
echo You may be prompted for your GitHub credentials.
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ====================================
    echo Push Failed - Manual Steps Required
    echo ====================================
    echo.
    echo This usually happens if:
    echo 1. Repository doesn't exist on GitHub yet
    echo 2. Git credentials need to be configured
    echo 3. Remote already exists
    echo.
    echo To fix, run these commands manually:
    echo.
    echo   cd publish\wwwroot
    echo   git push -u origin main -f
    echo.
    echo Or if remote exists:
    echo   cd publish\wwwroot
    echo   git remote remove origin
    echo   git remote add origin https://github.com/Itsnonso/itsnonso.github.io.git
    echo   git push -u origin main
    echo.
    pause
    exit /b 1
)

echo.
echo ====================================
echo Deployment Successful!
echo ====================================
echo.
echo Your portfolio has been pushed to GitHub!
echo.
echo NEXT STEPS (Important!):
echo.
echo GitHub Pages Auto-Deploy:
echo   For repositories named "username.github.io", GitHub Pages
echo   automatically deploys from the main branch. No configuration needed!
echo.
echo Your site will be live in 2-5 minutes at:
echo   https://itsnonso.github.io
echo.
echo What to do now:
echo   1. Wait 2-5 minutes for GitHub to build your site
echo   2. Visit: https://itsnonso.github.io
echo   3. Test all pages (Home, About, Portfolio, Contact)
echo   4. Send a test email via the contact form
echo   5. Share your portfolio link!
echo.
echo Verification:
echo   - Go to: https://github.com/Itsnonso/itsnonso.github.io
echo   - Check if files are there
echo   - GitHub Actions will show deployment progress
echo.
echo To update your portfolio later:
echo   1. Make changes to your code
echo   2. Run this script again
echo   3. Your site updates automatically in 2-5 minutes
echo.
echo ====================================
echo.
echo Press any key to exit...
pause >nul

@echo off
REM GitHub Pages Deployment Script for Windows
REM This script builds and prepares your Blazor portfolio for GitHub Pages

echo ====================================
echo GitHub Pages Deployment Script
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

REM Get GitHub username
set /p GITHUB_USERNAME="Enter your GitHub username: "
if "%GITHUB_USERNAME%"=="" (
    echo ERROR: GitHub username cannot be empty
    pause
    exit /b 1
)

echo.
echo Using GitHub username: %GITHUB_USERNAME%
echo Your site will be: https://%GITHUB_USERNAME%.github.io
echo.

REM Update URLs in files
echo Updating URLs in project files...

powershell -Command "(gc wwwroot\sitemap.xml) -replace 'yourusername', '%GITHUB_USERNAME%' | Out-File -encoding ASCII wwwroot\sitemap.xml"
powershell -Command "(gc wwwroot\robots.txt) -replace 'yourusername', '%GITHUB_USERNAME%' | Out-File -encoding ASCII wwwroot\robots.txt"
powershell -Command "(gc wwwroot\index.html) -replace 'yourusername', '%GITHUB_USERNAME%' | Out-File -encoding ASCII wwwroot\index.html"

echo URLs updated successfully!
echo.

REM Build the project
echo Building project in Release mode...
dotnet publish -c Release -o ./publish

if errorlevel 1 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo Build successful!
echo.

REM Prepare wwwroot for GitHub Pages
echo Preparing for GitHub Pages deployment...
cd publish\wwwroot

REM Create .nojekyll file
echo. > .nojekyll
echo Created .nojekyll file

REM Create 404.html for SPA routing
copy /Y index.html 404.html >nul
echo Created 404.html for SPA routing

echo.
echo ====================================
echo Preparation Complete!
echo ====================================
echo.
echo Next steps:
echo.
echo 1. Create a GitHub repository named: %GITHUB_USERNAME%.github.io
echo    Go to: https://github.com/new
echo.
echo 2. Run these commands to deploy:
echo    cd publish\wwwroot
echo    git init
echo    git add .
echo    git commit -m "Initial portfolio deployment"
echo    git branch -M main
echo    git remote add origin https://github.com/%GITHUB_USERNAME%/%GITHUB_USERNAME%.github.io.git
echo    git push -u origin main
echo.
echo 3. Configure GitHub Pages:
echo    - Go to repository Settings ^> Pages
echo    - Source: main branch, / (root) folder
echo    - Save
echo.
echo 4. Your site will be live in 2-5 minutes at:
echo    https://%GITHUB_USERNAME%.github.io
echo.
echo Would you like to deploy now? (This will initialize git and push)
set /p DEPLOY_NOW="Deploy now? (y/n): "

if /i "%DEPLOY_NOW%"=="y" (
    echo.
    echo Deploying to GitHub...
    
    git init
    git add .
    git commit -m "Initial portfolio deployment"
    git branch -M main
    git remote add origin https://github.com/%GITHUB_USERNAME%/%GITHUB_USERNAME%.github.io.git
    
    echo.
    echo Pushing to GitHub...
    echo You may be prompted for your GitHub credentials.
    git push -u origin main
    
    if errorlevel 1 (
        echo.
        echo Push failed. You may need to:
        echo 1. Create the repository on GitHub first
        echo 2. Configure Git credentials
        echo 3. Run: git push -u origin main manually
    ) else (
        echo.
        echo ====================================
        echo Deployment Successful!
        echo ====================================
        echo.
        echo Your portfolio is being deployed...
        echo It will be live in 2-5 minutes at:
        echo https://%GITHUB_USERNAME%.github.io
        echo.
        echo Don't forget to:
        echo - Configure GitHub Pages in repository settings
        echo - Share your portfolio link!
    )
) else (
    echo.
    echo Deployment skipped. Run the git commands manually when ready.
)

echo.
echo Press any key to exit...
pause >nul

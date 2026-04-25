@echo off
REM Deploy to Existing MyPortfolio Repository
REM Your site: https://itsnonso.github.io/MyPortfolio/

echo ====================================
echo Deploy to MyPortfolio Repository
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

echo Site URL: https://itsnonso.github.io/MyPortfolio/
echo Repository: https://github.com/Itsnonso/MyPortfolio
echo.

REM Build the project
echo [1/6] Building project in Release mode...
dotnet publish -c Release -o ./publish

if errorlevel 1 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo Build successful!
echo.

REM Rewrite base href and sitemap/robots ONLY in publish output
echo [2/6] Rewriting base href and sitemap/robots for GitHub Pages (/MyPortfolio)...

REM Update base href in published index.html
powershell -Command "(gc publish\\wwwroot\\index.html) -replace '<base href=\"/\" />', '<base href=\"/MyPortfolio/\" />' | Out-File -encoding UTF8 publish\\wwwroot\\index.html"

REM Update sitemap URLs in published sitemap.xml
powershell -Command "(gc publish\\wwwroot\\sitemap.xml) `
  -replace 'https://itsnonso.github.io/', 'https://itsnonso.github.io/MyPortfolio/' |
  Out-File -encoding UTF8 publish\\wwwroot\\sitemap.xml"

REM Update robots.txt sitemap URL in published robots.txt
powershell -Command "(gc publish\\wwwroot\\robots.txt) `
  -replace 'https://itsnonso.github.io/sitemap.xml', 'https://itsnonso.github.io/MyPortfolio/sitemap.xml' |
  Out-File -encoding UTF8 publish\\wwwroot\\robots.txt"

echo Rewrite complete.
echo.

REM Navigate to publish folder
echo [3/6] Preparing for GitHub Pages deployment...
cd publish\wwwroot

REM Create .nojekyll file (critical for Blazor)
echo. > .nojekyll
echo Created .nojekyll file

REM Create 404.html for SPA routing
copy /Y index.html 404.html >nul
echo Created 404.html for SPA routing

echo.
echo [4/6] Files prepared successfully!
echo.

REM Check if this is a git repo
if not exist .git (
    echo [5/6] Initializing Git repository...
    git init
    git branch -M main
    git remote add origin https://github.com/Itsnonso/MyPortfolio.git
) else (
    echo [5/6] Git repository already exists, updating...
)

REM Add and commit files
git add .
git commit -m "Update portfolio - %date% %time%"

echo.
echo [6/6] Pushing to GitHub...
echo You may be prompted for your GitHub credentials.
echo.

REM Push to GitHub
git push -u origin main -f

if errorlevel 1 (
    echo.
    echo ====================================
    echo Push Failed - Troubleshooting
    echo ====================================
    echo.
    echo This can happen if:
    echo 1. Git credentials need to be configured
    echo 2. Branch protection is enabled
    echo 3. Network connectivity issues
    echo.
    echo Try manually:
    echo   cd publish\wwwroot
    echo   git push -u origin main -f
    echo.
    pause
    exit /b 1
)

echo.
echo ====================================
echo Deployment Successful!
echo ====================================
echo.
echo Your portfolio has been updated!
echo.
echo NEXT: Configure GitHub Pages (if not done already)
echo.
echo 1. Go to: https://github.com/Itsnonso/MyPortfolio
echo 2. Click Settings ^> Pages
echo 3. Source: main branch, / (root) folder
echo 4. Click Save
echo.
echo Your site will update in 2-5 minutes at:
echo   https://itsnonso.github.io/MyPortfolio/
echo.
echo What to verify:
echo   - All pages load (Home, About, Portfolio, Contact)
echo   - CSS and JavaScript work
echo   - Images display correctly
echo   - Contact form works
echo   - Navigation functions properly
echo.
echo To update again later:
echo   1. Make your changes
echo   2. Run this script again
echo   3. Site updates in 2-5 minutes
echo.
echo ====================================
echo.
echo Press any key to exit...
pause >nul

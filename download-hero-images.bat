@echo off
REM Hero Image Download Script for Windows
REM This script downloads optimized versions of your hero image from Unsplash

echo ========================================
echo ?? Hero Image Optimization Tool
echo ========================================
echo.

REM Create images directory
if not exist "wwwroot\images" mkdir "wwwroot\images"

echo ?? Downloading mobile version (800x1200)...
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800&h=1200&fit=crop&q=75&auto=format&fm=webp" -o wwwroot\images\hero-mobile.webp
echo.

echo ?? Downloading tablet version (1200x900)...
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=1200&h=900&fit=crop&q=75&auto=format&fm=webp" -o wwwroot\images\hero-tablet.webp
echo.

echo ?? Downloading desktop version (1920x1080)...
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=1920&h=1080&fit=crop&q=80&auto=format&fm=webp" -o wwwroot\images\hero-desktop.webp
echo.

echo ??? Downloading large desktop version (2560x1440)...
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=2560&h=1440&fit=crop&q=80&auto=format&fm=webp" -o wwwroot\images\hero-desktop-large.webp
echo.

echo ? All images downloaded!
echo.
echo ?? Files created:
dir /B wwwroot\images\hero-*.webp
echo.

echo ========================================
echo ?? Next Steps:
echo ========================================
echo 1. Verify images are in wwwroot\images\
echo 2. Open wwwroot\css\app.css
echo 3. Uncomment the "local images" section
echo 4. Update preload link in wwwroot\index.html
echo 5. Build and test: dotnet run
echo 6. Run Lighthouse audit in Chrome DevTools
echo ========================================
echo.

pause

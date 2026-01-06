#!/bin/bash

# Hero Image Download & Optimization Script
# This script downloads optimized versions of your hero image from Unsplash

echo "?? Downloading optimized hero images..."

# Create images directory
mkdir -p wwwroot/images

# Download mobile version (800x1200, WebP, 75% quality)
echo "?? Downloading mobile version..."
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800&h=1200&fit=crop&q=75&auto=format&fm=webp" \
  -o wwwroot/images/hero-mobile.webp

# Download tablet version (1200x900, WebP, 75% quality)
echo "?? Downloading tablet version..."
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=1200&h=900&fit=crop&q=75&auto=format&fm=webp" \
  -o wwwroot/images/hero-tablet.webp

# Download desktop version (1920x1080, WebP, 80% quality)
echo "?? Downloading desktop version..."
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=1920&h=1080&fit=crop&q=80&auto=format&fm=webp" \
  -o wwwroot/images/hero-desktop.webp

# Download large desktop version (2560x1440, WebP, 80% quality)
echo "??? Downloading large desktop version..."
curl "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=2560&h=1440&fit=crop&q=80&auto=format&fm=webp" \
  -o wwwroot/images/hero-desktop-large.webp

echo "? All images downloaded!"
echo ""
echo "?? Image sizes:"
ls -lh wwwroot/images/hero-*.webp | awk '{print $9, "-", $5}'

echo ""
echo "?? Next steps:"
echo "1. Verify images are in wwwroot/images/"
echo "2. Uncomment local images section in wwwroot/css/app.css"
echo "3. Update preload link in wwwroot/index.html"
echo "4. Test your site"
echo "5. Run Lighthouse audit"

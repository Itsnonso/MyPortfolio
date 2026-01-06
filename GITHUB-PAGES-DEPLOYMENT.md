# GitHub Pages Deployment Guide

This guide will help you deploy your Blazor WebAssembly portfolio to GitHub Pages.

## ?? Prerequisites

- GitHub account
- Git installed on your computer
- Your portfolio built successfully

## ?? Quick Deployment Steps

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: **yourusername.github.io** (replace `yourusername` with your GitHub username)
   - Example: If your username is `chinonsoiwu`, name it `chinonsoiwu.github.io`
3. Description: "Professional portfolio showcasing my .NET backend development work"
4. Choose **Public** (required for free GitHub Pages)
5. **DO NOT** initialize with README, .gitignore, or license
6. Click **Create repository**

### Step 2: Update Your URLs

Before deploying, update these placeholders with your actual GitHub username:

**Files to update:**
1. `wwwroot/sitemap.xml` - Replace `yourusername` (4 times)
2. `wwwroot/robots.txt` - Replace `yourusername` (1 time)
3. `wwwroot/index.html` - Replace `yourusername` (1 time)

**Find and Replace:**
```
Find: yourusername.github.io
Replace: [YOUR-GITHUB-USERNAME].github.io
```

### Step 3: Build for Production

Open terminal in your project directory and run:

```bash
dotnet publish -c Release -o ./publish
```

This creates optimized production files in the `publish` folder.

### Step 4: Prepare for GitHub Pages

GitHub Pages requires a special configuration for Blazor WebAssembly:

1. Navigate to the publish folder:
```bash
cd publish/wwwroot
```

2. Create a `.nojekyll` file (tells GitHub Pages to skip Jekyll processing):
```bash
# Windows (PowerShell)
New-Item .nojekyll -Type File

# Mac/Linux
touch .nojekyll
```

3. Create a `404.html` file for SPA routing (copy from index.html):
```bash
# Windows (PowerShell)
Copy-Item index.html 404.html

# Mac/Linux
cp index.html 404.html
```

### Step 5: Deploy to GitHub

Initialize git and push to GitHub:

```bash
# Make sure you're in publish/wwwroot folder
git init
git add .
git commit -m "Initial portfolio deployment"
git branch -M main
git remote add origin https://github.com/yourusername/yourusername.github.io.git
git push -u origin main
```

**Replace `yourusername` with your actual GitHub username!**

### Step 6: Configure GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** ? **Pages** (left sidebar)
3. Under **Source**, select:
   - Branch: `main`
   - Folder: `/ (root)`
4. Click **Save**

### Step 7: Wait for Deployment

- GitHub will automatically deploy your site
- Wait 2-5 minutes
- Your site will be live at: `https://yourusername.github.io`

## ? Verification Checklist

After deployment, verify:

- [ ] Home page loads correctly
- [ ] Navigation works (About, Portfolio, Contact)
- [ ] All images display properly
- [ ] Contact form shows (EmailJS still works)
- [ ] Links work correctly
- [ ] Responsive design works on mobile

## ?? How to Update Your Portfolio

When you make changes:

1. Make your code changes
2. Build for production:
```bash
dotnet publish -c Release -o ./publish
```

3. Navigate and deploy:
```bash
cd publish/wwwroot
git add .
git commit -m "Update portfolio"
git push
```

GitHub will automatically redeploy (takes 2-5 minutes).

## ?? Important Notes

### Base Path Configuration
If your repository name is NOT `yourusername.github.io`, you need to update the base path:

**In `wwwroot/index.html`:**
```html
<!-- For yourusername.github.io (recommended) -->
<base href="/" />

<!-- For other repository names (e.g., portfolio) -->
<base href="/portfolio/" />
```

### .nojekyll File
This file is CRITICAL! Without it:
- CSS won't load
- JavaScript won't work
- Pages will show 404 errors

Always include `.nojekyll` in your deployment.

### 404.html for SPA Routing
Blazor uses client-side routing. The `404.html` copy of `index.html` ensures:
- Direct links to `/about` work
- Page refreshes don't break
- Deep linking works correctly

## ?? Troubleshooting

### Problem: Site shows blank page
**Solution:**
- Check browser console for errors
- Verify `.nojekyll` file exists
- Check base path in `index.html`

### Problem: CSS/JS not loading
**Solution:**
- Ensure `.nojekyll` file is present
- Wait 5 minutes for GitHub to fully deploy
- Clear browser cache (Ctrl+Shift+R)

### Problem: 404 errors on navigation
**Solution:**
- Ensure `404.html` exists
- Verify it's a copy of `index.html`

### Problem: Images not loading
**Solution:**
- Check image paths are relative (not absolute)
- Verify images are in `wwwroot` folder
- Hero images from Unsplash should work (external URL)

## ?? Custom Domain (Optional)

To use a custom domain (e.g., `chinonsoiwu.com`):

1. Buy domain from provider (Namecheap, GoDaddy, etc.)
2. Add `CNAME` file in repository root:
```
yourdomain.com
```
3. Configure DNS with your domain provider:
   - Add A records pointing to GitHub's IPs
   - Or add CNAME record pointing to `yourusername.github.io`
4. In GitHub Settings ? Pages, enter your custom domain
5. Wait for DNS propagation (up to 24 hours)

## ?? HTTPS

GitHub Pages automatically provides HTTPS for:
- `yourusername.github.io` domains
- Custom domains (after DNS verification)

Always use HTTPS URLs in your sitemap.xml!

## ?? Analytics (Optional)

To track visitors, add Google Analytics:

1. Create Google Analytics account
2. Get tracking ID
3. Add to `wwwroot/index.html` before `</head>`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## ? Post-Deployment Checklist

After your site is live:

- [ ] Test all pages
- [ ] Test on mobile device
- [ ] Send test email via contact form
- [ ] Share on LinkedIn
- [ ] Update resume with portfolio link
- [ ] Submit sitemap to Google Search Console

## ?? You're Live!

Congratulations! Your portfolio is now publicly accessible at:
`https://yourusername.github.io`

Share it with:
- LinkedIn profile
- Resume
- Job applications
- GitHub profile README

---

**Need help?** Check GitHub Pages documentation: https://docs.github.com/en/pages

# ?? GitHub Pages Deployment Checklist

## ? Pre-Deployment (Complete)

- [x] Build successful
- [x] All pages working (Home, About, Portfolio, Contact)
- [x] EmailJS configured
- [x] Sitemap.xml created (with placeholder URL)
- [x] Robots.txt created (with placeholder URL)
- [x] Meta tags added for SEO
- [x] Responsive design implemented
- [x] Hero image optimized

## ?? Before You Deploy

### 1. Choose Your GitHub Username
Your site will be: `https://YOUR-USERNAME.github.io`

Example: If your username is `chinonsoiwu`, your site will be `https://chinonsoiwu.github.io`

### 2. Create GitHub Repository

Go to: https://github.com/new

- **Repository name:** `YOUR-USERNAME.github.io` (EXACTLY this format)
- **Description:** Professional portfolio showcasing my .NET backend development work
- **Visibility:** Public (required for free GitHub Pages)
- **DO NOT** check "Initialize with README"
- Click "Create repository"

## ?? Quick Deployment (Choose One Method)

### Method 1: Automated Script (Recommended)

**Windows:**
```bash
.\deploy-github-pages.bat
```

**Mac/Linux:**
```bash
chmod +x deploy-github-pages.sh
./deploy-github-pages.sh
```

The script will:
1. Ask for your GitHub username
2. Update all URLs automatically
3. Build your project
4. Prepare files for GitHub Pages
5. (Optional) Deploy to GitHub

### Method 2: Manual Deployment

**Step 1: Update URLs**

Replace `yourusername` with your actual GitHub username in:
- `wwwroot/sitemap.xml` (4 occurrences)
- `wwwroot/robots.txt` (1 occurrence)
- `wwwroot/index.html` (1 occurrence)

**Step 2: Build for Production**
```bash
dotnet publish -c Release -o ./publish
```

**Step 3: Prepare for GitHub Pages**
```bash
cd publish/wwwroot

# Create .nojekyll file
# Windows PowerShell:
New-Item .nojekyll -Type File

# Mac/Linux:
touch .nojekyll

# Create 404.html
# Windows PowerShell:
Copy-Item index.html 404.html

# Mac/Linux:
cp index.html 404.html
```

**Step 4: Deploy to GitHub**
```bash
git init
git add .
git commit -m "Initial portfolio deployment"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-USERNAME.github.io.git
git push -u origin main
```

**Step 5: Configure GitHub Pages**
1. Go to your repository on GitHub
2. Settings ? Pages
3. Source: `main` branch, `/ (root)` folder
4. Click Save

## ?? Wait Time

After pushing:
- GitHub processes your files: ~2-5 minutes
- Your site will be live at: `https://YOUR-USERNAME.github.io`

## ? Post-Deployment Checklist

Once live, verify:

- [ ] Home page loads correctly
- [ ] Click "About" - page loads
- [ ] Click "Portfolio" - page loads with all 6 projects
- [ ] Click "Contact" - form displays
- [ ] Test contact form (send yourself a test email)
- [ ] Test on mobile device
- [ ] Check all project modals open
- [ ] Verify images load correctly

## ?? Troubleshooting

### Blank Page After Deployment

**Cause:** Missing `.nojekyll` file

**Fix:**
1. Navigate to `publish/wwwroot`
2. Create `.nojekyll` file
3. `git add .nojekyll`
4. `git commit -m "Add .nojekyll"`
5. `git push`

### CSS/JS Not Loading

**Cause:** GitHub treating it as Jekyll site

**Fix:** Same as above - ensure `.nojekyll` exists

### 404 Errors on Page Navigation

**Cause:** Missing `404.html`

**Fix:**
1. Navigate to `publish/wwwroot`
2. Copy `index.html` to `404.html`
3. `git add 404.html`
4. `git commit -m "Add 404.html for SPA routing"`
5. `git push`

### Changes Not Showing

**Solution:**
- Wait 5 minutes for GitHub to rebuild
- Clear browser cache (Ctrl + Shift + R)
- Try incognito/private browsing mode

## ?? After Going Live

### Share Your Portfolio

Add to:
- [ ] LinkedIn profile (Featured section)
- [ ] Resume (Portfolio/Website field)
- [ ] GitHub profile README
- [ ] Email signature
- [ ] Business cards

### Submit to Search Engines

- [ ] Google Search Console: https://search.google.com/search-console
  - Add property: `https://YOUR-USERNAME.github.io`
  - Submit sitemap: `https://YOUR-USERNAME.github.io/sitemap.xml`

- [ ] Bing Webmaster Tools: https://www.bing.com/webmasters
  - Add site
  - Submit sitemap

### Monitor

- [ ] Test contact form weekly
- [ ] Check for broken links monthly
- [ ] Update projects as you complete new work

## ?? Updating Your Portfolio

When you make changes:

1. Edit your code
2. Run deployment script again, OR:
   ```bash
   dotnet publish -c Release -o ./publish
   cd publish/wwwroot
   git add .
   git commit -m "Update portfolio - [describe changes]"
   git push
   ```
3. Wait 2-5 minutes for GitHub to redeploy

## ?? Custom Domain (Optional)

To use your own domain (e.g., `chinonsoiwu.com`):

1. Buy domain from registrar (Namecheap, GoDaddy, etc.)
2. Add `CNAME` file to repository root:
   ```
   yourdomain.com
   ```
3. Configure DNS at your registrar:
   - Add A records to GitHub's IPs, OR
   - Add CNAME to `YOUR-USERNAME.github.io`
4. In GitHub repo Settings ? Pages ? Custom domain: enter your domain
5. Enable "Enforce HTTPS" (after DNS propagates)

## ?? Analytics (Optional)

Track visitors with Google Analytics:

1. Create account: https://analytics.google.com
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

## ? Final Checks Before Sharing

- [ ] All pages load without errors
- [ ] Contact form sends emails
- [ ] Site loads fast (< 3 seconds)
- [ ] Looks good on mobile
- [ ] Your name/info is correct everywhere
- [ ] No "lorem ipsum" or placeholder text
- [ ] EmailJS working

## ?? You're Live!

**Congratulations!** Your portfolio is now publicly accessible.

**Your URL:** `https://YOUR-USERNAME.github.io`

**Share it everywhere!** This is your professional online presence showcasing 4+ years of .NET development experience.

---

## ?? Documentation Files

- `GITHUB-PAGES-DEPLOYMENT.md` - Detailed deployment guide
- `deploy-github-pages.bat` - Windows deployment script
- `deploy-github-pages.sh` - Mac/Linux deployment script
- This file - Quick reference checklist

## ?? Need Help?

- GitHub Pages docs: https://docs.github.com/en/pages
- Blazor WASM deployment: https://docs.microsoft.com/en-us/aspnet/core/blazor/host-and-deploy/webassembly
- EmailJS docs: https://www.emailjs.com/docs/

---

**Ready to deploy?** Run `.\deploy-github-pages.bat` and you'll be live in 10 minutes! ??

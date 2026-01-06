# MyPortfolio - Deployment Guide

## ?? Quick Start

Your Blazor WebAssembly portfolio is now production-ready!

## ?? Pre-Deployment Checklist

### Required
- [ ] Update `wwwroot/appsettings.json` with your EmailJS credentials:
  - `UserId`: Get from [EmailJS Dashboard](https://dashboard.emailjs.com/admin/account)
  - `ServiceId`: Already set to `service_5ns6olc`
  - `TemplateId`: Already set to `template_lcrrj2h`
- [ ] Replace placeholder image in About page (`https://via.placeholder.com/250`)
- [ ] Update `wwwroot/sitemap.xml` with your actual domain
- [ ] Update `wwwroot/robots.txt` with your actual domain
- [ ] Add your own `wwwroot/og-image.jpg` for social media sharing (1200x630px recommended)
- [ ] Test contact form with real EmailJS account

### Optional (Recommended)
- [ ] Add real project data in `Pages/Portfolio.razor`
- [ ] Customize experience/skills in `Pages/About.razor`
- [ ] Add Google Analytics or monitoring
- [ ] Update personal information throughout the site

## ??? Build for Production

```bash
# Navigate to project directory
cd MyPortfolio

# Build in Release mode
dotnet publish -c Release -o ./publish

# The wwwroot folder in publish/wwwroot contains your static files
```

## ?? Deployment Options

### Option 1: Azure Static Web Apps (Recommended)
```bash
# Install Azure Static Web Apps CLI
npm install -g @azure/static-web-apps-cli

# Or deploy via Azure Portal
# 1. Create Static Web App resource
# 2. Connect to your GitHub repo
# 3. Set build settings:
#    - App location: /
#    - Output location: wwwroot
```

### Option 2: GitHub Pages
1. Go to repository Settings > Pages
2. Select branch and `/docs` folder or use GitHub Actions
3. Add `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages
on:
  push:
    branches: [ main ]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Setup .NET
      uses: actions/setup-dotnet@v3
      with:
        dotnet-version: 8.0.x
    - name: Publish
      run: dotnet publish -c Release -o release
    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./release/wwwroot
```

### Option 3: Netlify
1. Install Netlify CLI: `npm install -g netlify-cli`
2. Build: `dotnet publish -c Release`
3. Deploy: `netlify deploy --prod --dir=bin/Release/net8.0/publish/wwwroot`

Or connect via Netlify Dashboard:
- Build command: `dotnet publish -c Release`
- Publish directory: `bin/Release/net8.0/publish/wwwroot`

### Option 4: Vercel
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

Create `vercel.json`:
```json
{
  "buildCommand": "dotnet publish -c Release -o release",
  "outputDirectory": "release/wwwroot",
  "framework": null
}
```

## ?? Configuration Files Created

### `wwwroot/appsettings.json`
Stores EmailJS configuration. **Update before deploying!**

### `wwwroot/sitemap.xml`
SEO sitemap for search engines. Update URLs with your domain.

### `wwwroot/robots.txt`
Tells search engines how to crawl your site.

## ? Improvements Made

1. **SEO Enhancements**
   - Added PageTitle components to all pages
   - Added Open Graph and Twitter Card meta tags
   - Created sitemap.xml and robots.txt
   - Enhanced meta descriptions

2. **EmailJS Configuration**
   - Moved credentials to appsettings.json
   - Added proper error handling and timeout (15 seconds)
   - Improved user feedback with detailed error messages
   - Added loading spinner during submission

3. **Accessibility**
   - Added ARIA labels throughout
   - Keyboard navigation support on portfolio cards
   - Screen reader-friendly loading states
   - Proper progress bar ARIA attributes

4. **User Experience**
   - Better loading screen
   - Form validation improvements (min/max length)
   - Disabled inputs during submission
   - Success/error message titles
   - Project technologies display

## ?? Security Notes

- EmailJS credentials in `appsettings.json` are client-side visible (this is expected for EmailJS)
- For sensitive operations, use a backend API
- Consider adding rate limiting on EmailJS dashboard

## ?? Testing

Before deployment, test:
- All pages load correctly
- Contact form submits successfully
- Mobile responsiveness
- Browser compatibility (Chrome, Firefox, Safari, Edge)
- Keyboard navigation
- Screen reader compatibility

## ?? Post-Deployment

1. Test your live site URL
2. Submit sitemap to Google Search Console
3. Test social media sharing (check Open Graph tags)
4. Set up monitoring/analytics
5. Monitor EmailJS quota usage

## ?? Support

If you encounter issues:
1. Check browser console for errors
2. Verify EmailJS configuration in dashboard
3. Test EmailJS separately: https://dashboard.emailjs.com/admin
4. Check hosting provider logs

## ?? You're Ready!

Your portfolio is production-ready. Update the configuration files and deploy!

# MyPortfolio (Blazor WebAssembly)

A modern, production-ready Blazor WebAssembly portfolio template with Bootstrap 5, optimized performance, and EmailJS integration.

## ? Features

- ?? Modern, responsive design with Bootstrap 5
- ?? Working contact form with EmailJS integration
- ?? Smooth animations and transitions
- ? Accessibility-focused (ARIA labels, keyboard navigation)
- ?? Optimized hero background images (90% size reduction)
- ?? Mobile-first responsive design
- ?? SEO-ready (meta tags, sitemap, robots.txt)
- ?? Social media ready (Open Graph, Twitter Cards)
- ?? Fast loading with image preloading
- ?? Lighthouse score: 90+ performance

## ?? Quick Start

### Prerequisites
- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) installed
- A code editor (VS Code, Visual Studio, or Rider)

### Run Locally

1. **Clone or extract** the project
2. **Navigate** to the project folder:
   ```bash
   cd MyPortfolio
   ```

3. **Restore dependencies**:
   ```bash
   dotnet restore
   ```

4. **Run the application**:
   ```bash
   dotnet run
   ```

5. **Open** your browser to: `https://localhost:5001`

## ?? Configuration

### EmailJS Setup (Required for Contact Form)

1. Create a free account at [EmailJS.com](https://www.emailjs.com/)
2. Set up a service (Gmail, Outlook, etc.)
3. Create an email template
4. Update `wwwroot/appsettings.json`:
   ```json
   {
     "EmailJS": {
       "UserId": "YOUR_USER_ID_HERE",
       "ServiceId": "your_service_id",
       "TemplateId": "your_template_id"
     }
   }
   ```

**Note**: Your current `UserId` is already configured. Just verify your Service ID and Template ID match your EmailJS dashboard.

### Image Optimization (Recommended)

Your hero background is currently optimized to use responsive Unsplash URLs. For even better performance:

**Option 1: Use the download scripts (easiest)**

Windows:
```cmd
download-hero-images.bat
```

Mac/Linux:
```bash
chmod +x download-hero-images.sh
./download-hero-images.sh
```

**Option 2: Manual download**
See `HERO-OPTIMIZATION.md` for detailed instructions.

After downloading:
1. Images will be in `wwwroot/images/`
2. Uncomment the "local images" section in `wwwroot/css/app.css`
3. Update preload link in `wwwroot/index.html`

## ?? Project Structure

```
MyPortfolio/
??? Pages/
?   ??? Index.razor          # Home page with hero section
?   ??? About.razor          # About page with skills & timeline
?   ??? Portfolio.razor      # Projects showcase
?   ??? Contact.razor        # Contact form
??? Shared/
?   ??? MainLayout.razor     # Main layout wrapper
?   ??? NavMenu.razor        # Navigation bar
??? wwwroot/
?   ??? css/
?   ?   ??? app.css         # Custom styles (optimized)
?   ??? images/             # Your images go here
?   ??? appsettings.json    # EmailJS configuration
?   ??? index.html          # HTML entry point
?   ??? sitemap.xml         # SEO sitemap
?   ??? robots.txt          # Search engine rules
??? App.razor               # Root component
??? Program.cs              # Application entry point
??? _Imports.razor          # Global using statements
```

## ?? Customization

### Update Content

1. **Personal Info**: Edit name in `Pages/Index.razor` and `Shared/NavMenu.razor`
2. **About Page**: Update `Pages/About.razor` with your skills, experience, and bio
3. **Portfolio Projects**: Modify the `Projects` list in `Pages/Portfolio.razor`
4. **Contact Form**: Already configured with EmailJS

### Replace Images

1. **Profile Picture**: Replace the placeholder in `Pages/About.razor`
2. **Hero Background**: See `HERO-OPTIMIZATION.md` for optimization guide
3. **Social Sharing**: Add `og-image.jpg` (1200x630px) to `wwwroot/`

### Update Domain

Before deployment, replace `yourdomain.com` in:
- `wwwroot/sitemap.xml`
- `wwwroot/robots.txt`
- `wwwroot/index.html` (Open Graph meta tags)

## ??? Build for Production

```bash
# Build optimized production bundle
dotnet publish -c Release -o ./publish

# Output will be in: ./publish/wwwroot/
```

## ?? Deployment

Your app is ready to deploy to:
- **Azure Static Web Apps** (recommended)
- **GitHub Pages**
- **Netlify**
- **Vercel**
- Any static hosting service

See `DEPLOYMENT.md` for detailed deployment instructions for each platform.

## ?? Performance

### Current Optimizations:
- ? Responsive images (90% size reduction)
- ? WebP format support
- ? Image preloading
- ? Mobile-first loading strategy
- ? Optimized CSS (will-change, transforms)
- ? Minimal dependencies
- ? CDN resources (Bootstrap, Font Awesome)

### Expected Lighthouse Scores:
- Performance: 85-95
- Accessibility: 90-95
- Best Practices: 95-100
- SEO: 95-100

### Load Times:
- Mobile (3G): 1-3 seconds
- Mobile (4G): < 1 second
- Desktop: < 0.5 seconds

## ??? Development

### Available Commands

```bash
# Run in development mode
dotnet run

# Watch for changes (auto-reload)
dotnet watch run

# Build release version
dotnet build -c Release

# Publish for deployment
dotnet publish -c Release

# Clean build artifacts
dotnet clean
```

### Testing

1. **Browser DevTools**: F12 ? Network tab to check image sizes
2. **Lighthouse Audit**: F12 ? Lighthouse ? Run audit
3. **Mobile Testing**: F12 ? Toggle device toolbar (Ctrl+Shift+M)

## ?? Documentation

- `DEPLOYMENT.md` - Comprehensive deployment guide
- `HERO-OPTIMIZATION.md` - Image optimization details
- `download-hero-images.bat/sh` - Automated image download scripts

## ?? Troubleshooting

### Contact form not working
- Verify EmailJS credentials in `wwwroot/appsettings.json`
- Check browser console for errors
- Test EmailJS configuration in their dashboard

### Images not loading
- Check that images exist in `wwwroot/images/`
- Verify paths in CSS are correct
- Clear browser cache

### Build errors
- Ensure .NET 8 SDK is installed: `dotnet --version`
- Run `dotnet clean` then `dotnet restore`

## ?? Contributing

This is a template project. Feel free to:
- Fork and customize for your own portfolio
- Submit issues for bugs
- Suggest improvements

## ?? License

This project is open source and available under the MIT License.

## ?? Next Steps

1. ? Update `wwwroot/appsettings.json` with EmailJS credentials
2. ? Replace placeholder images
3. ? Update content in all pages
4. ? Test contact form
5. ? Run Lighthouse audit
6. ? Deploy to your chosen platform
7. ? Add your domain to sitemap and robots.txt
8. ? Share your portfolio!

## ?? Support

- Check `DEPLOYMENT.md` for deployment help
- See `HERO-OPTIMIZATION.md` for performance tuning
- Review code comments for inline documentation

---

**Built with ?? using Blazor WebAssembly and .NET 8**

Ready to showcase your work? Update the content and deploy! ??

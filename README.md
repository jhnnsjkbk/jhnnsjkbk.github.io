# Dr. Johannes Jakubik - Personal Website

A beautiful, modern academic website built with Jekyll and the al-folio theme, showcasing research, publications, and professional achievements in AI and Earth observation.

## 🌟 Features

- **Modern Design**: Clean, professional layout with custom styling
- **Responsive**: Fully responsive design that works on all devices
- **Dark Mode**: Automatic dark/light mode switching
- **Publications**: Comprehensive list of research papers with links
- **CV**: Detailed curriculum vitae with timeline
- **News & Announcements**: Latest updates and achievements
- **Social Integration**: Links to Google Scholar, GitHub, LinkedIn

## 🚀 Quick Start

### Prerequisites

- Ruby (>= 2.7)
- Jekyll (>= 4.0)
- Bundler

### Installation

1. Clone the repository:
```bash
git clone https://github.com/jhnnsjkbk/jhnnsjkbk.github.io.git
cd jhnnsjkbk.github.io
```

2. Install dependencies:
```bash
bundle install
```

3. Run the development server:
```bash
bundle exec jekyll serve
```

4. Open your browser and navigate to `http://localhost:4000`

## 📁 Project Structure

```
├── _config.yml           # Main configuration file
├── _pages/              # Main content pages
│   ├── about.md         # Homepage/About page
│   ├── cv.md            # Curriculum Vitae
│   ├── publications.md  # Publications list
│   └── honors.md        # Awards and media coverage
├── _news/               # News announcements
├── _data/               # Data files
│   └── socials.yml      # Social media links
├── _sass/               # Custom styles
│   └── _custom.scss     # Custom CSS
├── assets/
│   ├── img/             # Images
│   └── css/             # Stylesheets
└── README.md            # This file
```

## 🎨 Customization

### Personal Information

Edit `_config.yml` to update:
- Name and title
- Email and contact information
- Social media links
- Site description

### Content Pages

- **About**: Edit `_pages/about.md`
- **CV**: Edit `_pages/cv.md`
- **Publications**: Edit `_pages/publications.md`
- **Honors**: Edit `_pages/honors.md`

### News Announcements

Add new announcements in the `_news/` directory following the existing format.

### Styling

Custom styles are in `_sass/_custom.scss`. Modify colors, fonts, and layout as needed.

## 🌐 Deployment

### GitHub Pages

1. Push your changes to the `main` branch
2. GitHub Pages will automatically build and deploy your site
3. Your site will be available at `https://jhnnsjkbk.github.io`

### Custom Domain

To use a custom domain:
1. Add a `CNAME` file with your domain name
2. Configure DNS settings with your domain provider
3. Update the `url` in `_config.yml`

## 📝 Content Guidelines

### Adding Publications

Add publications to `_pages/publications.md` following this format:

```markdown
**Conference/Journal Name**
<br>
Author list. (Year). Title. Venue. [Paper](link) [Code](link)
```

### Adding News

Create a new file in `_news/` with this format:

```markdown
---
layout: post
date: YYYY-MM-DD HH:MM:SS-OFFSET
inline: true
related_posts: false
---

Your announcement text here with emojis! :sparkles:
```

## 🛠️ Technologies Used

- **Jekyll**: Static site generator
- **al-folio**: Academic theme
- **Bootstrap**: CSS framework
- **Font Awesome**: Icons
- **MathJax**: Mathematical equations
- **GitHub Pages**: Hosting

## 📊 Key Sections

### About
Professional bio highlighting:
- Current position at IBM Research Europe
- Research focus on AI for climate impact
- Awards and recognition
- Personal interests

### CV
Comprehensive career history including:
- Professional experience
- Education
- Affiliations
- Timeline format with icons

### Publications
Organized by:
- Conference papers (ICCV, CVPR, NeurIPS, AAAI, etc.)
- Journal publications (JAIR, EJOR, POM, etc.)
- Supervised students and their achievements

### Honors & Media
- Awards and recognition
- Invited talks and keynotes
- Media coverage (WSJ, Forbes, etc.)

## 🎯 Design Features

- **Clean Typography**: Roboto font family for readability
- **Color Scheme**: Professional blue theme with dark mode support
- **Hover Effects**: Smooth transitions and animations
- **Card Layouts**: Modern card-based design for publications
- **Timeline**: Visual timeline for CV entries
- **Responsive Images**: Optimized images with lazy loading

## 📧 Contact

Dr. Johannes Jakubik
- Email: johannes.jakubik@icloud.com
- Google Scholar: [Profile](https://scholar.google.com/citations?user=Bz3X5pQAAAAJ)
- LinkedIn: [Profile](https://www.linkedin.com/in/johannes-jakubik-8763ba167/)

## 📄 License

This project is based on the [al-folio](https://github.com/alshedivat/al-folio) theme.

## 🙏 Acknowledgments

- al-folio theme by Maruan Al-Shedivat
- Jekyll community
- GitHub Pages

---

**Last Updated**: March 2026

Built with ❤️ using Jekyll and al-folio

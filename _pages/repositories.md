---
layout: page
permalink: /repositories/
title: repositories
description: 
nav: true
nav_order: 4
---

<style>
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.repo-animate {
  opacity: 0;
  animation: fadeInUp 0.6s ease-out forwards;
}

.repositories > * {
  opacity: 0;
  animation: fadeInUp 0.6s ease-out forwards;
}

.repositories > *:nth-child(1) { animation-delay: 0.1s; }
.repositories > *:nth-child(2) { animation-delay: 0.2s; }
.repositories > *:nth-child(3) { animation-delay: 0.3s; }
.repositories > *:nth-child(4) { animation-delay: 0.4s; }
.repositories > *:nth-child(5) { animation-delay: 0.5s; }
.repositories > *:nth-child(6) { animation-delay: 0.6s; }
.repositories > *:nth-child(7) { animation-delay: 0.7s; }
.repositories > *:nth-child(8) { animation-delay: 0.8s; }
.repositories > *:nth-child(9) { animation-delay: 0.9s; }
.repositories > *:nth-child(10) { animation-delay: 1.0s; }
.repositories > *:nth-child(11) { animation-delay: 1.1s; }
.repositories > *:nth-child(12) { animation-delay: 1.2s; }
.repositories > *:nth-child(13) { animation-delay: 1.3s; }
</style>


My open-source work spans multiple domains including Earth observation foundation models, geospatial AI, quantum computing, and machine learning. Key contributions include:

- **1000+ GitHub Stars** across contributed repositories
- **300+ Forks** from the research community
- Active development in **IBM Research** and **NASA-IMPACT** projects

---

{% if site.data.repositories.github_repos %}

## GitHub Repositories

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

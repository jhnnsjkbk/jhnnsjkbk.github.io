---
layout: page
title: Partial Recovery of Meter-Scale Surface Weather
description: Downscaling coarse-resolution weather forecasts to meter-scale resolution using deep learning
img: assets/img/meter_scale_weather.png
importance: 5
category: weather
related_publications: true
---

## Partial Recovery of Meter-Scale Surface Weather

This work addresses the challenge of **downscaling coarse-resolution weather forecasts to meter-scale resolution**, enabling highly localized weather predictions for applications in agriculture, urban planning, and renewable energy.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/meter_scale_weather.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

### The Challenge

Modern numerical weather prediction models typically operate at resolutions of several kilometers, which is insufficient for many practical applications requiring meter-scale precision.

### Our Approach

We develop a **deep learning-based super-resolution framework** that:

- Leverages convolutional neural networks for hierarchical representations
- Incorporates topographic and land-use information
- Integrates physical constraints into the learning process
- Provides probabilistic predictions with confidence intervals

### Resources

<div class="resource-cards">
  <a href="https://arxiv.org/abs/2602.23146" class="resource-card" target="_blank">
    <div class="resource-preview">
      <img src="https://api.microlink.io/?url=https://arxiv.org/abs/2602.23146&screenshot=true&meta=false&embed=screenshot.url" alt="Paper Preview" loading="lazy">
    </div>
    <div class="resource-content">
      <h4>Paper (arXiv)</h4>
      <p>arxiv.org/abs/2602.23146</p>
    </div>
  </a>
</div>

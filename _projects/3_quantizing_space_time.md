---
layout: page
title: Quantizing Space and Time
description: Fusing time series and images for Earth observation
img: assets/img/quantizing_space_time.png
importance: 4
category: weather
related_publications: true
---

## Quantizing Space and Time: Fusing Time Series and Images for Earth Observation

This work introduces a task-agnostic framework for multimodal fusion of time series and images, enabling cross-modal generation and robust downstream performance for Earth observation applications.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/quantizing_space_time.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>


### Key Innovation

The framework proposes a **unified representation space** for spatiotemporal data through:

- **Discrete Quantization**: Transforms continuous time series into discrete tokens
- **Masked Correlation Learning**: Aligns discrete image and time series tokens
- **Task-Agnostic Design**: Enables both cross-modal generation and robust downstream performance
- **Scalable Architecture**: Handles variable-length time series and different spatial resolutions

### Resources

<div class="resource-cards">
  <a href="https://arxiv.org/pdf/2510.23118" class="resource-card" target="_blank">
    <div class="resource-preview">
      <img src="https://api.microlink.io/?url=https://arxiv.org/abs/2510.23118&screenshot=true&meta=false&embed=screenshot.url" alt="Paper Preview" loading="lazy">
    </div>
    <div class="resource-content">
      <h4>Paper (arXiv)</h4>
      <p>arxiv.org/pdf/2510.23118</p>
    </div>
  </a>
</div>

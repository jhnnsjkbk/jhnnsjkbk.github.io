---
layout: page
title: Phaedra
description: Learning high-fidelity discrete tokenization for the physical sciences
img: assets/img/phaedra.png
importance: 2
category: quantization
related_publications: true
---

## Phaedra: Learning High-Fidelity Discrete Tokenization for the Physical Sciences

Phaedra introduces a groundbreaking approach to discrete tokenization specifically designed for physical sciences data, including Earth observation, weather modeling, and climate assessment. This work addresses a fundamental challenge in applying modern deep learning to physical sciences: how to transform high-dimensional data into sequences that can be efficiently learned, generated, and generalized.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include video.liquid path="assets/img/phaedra.mp4" class="img-fluid rounded z-depth-1" controls=true autoplay=true %}
    </div>
</div>

### The Challenge

Tokens are discrete representations that allow modern deep learning to scale by transforming high-dimensional data into sequences. However, existing tokenizers designed for realistic visual perception of images struggle to capture **both fine details and precise magnitudes** - properties that are crucial for physical sciences applications.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/phaedra.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    <strong>Figure 1:</strong> Phaedra's tokenization pipeline. <em>Top Left:</em> Density field of compressible Euler equations showing fine details and ground truth. <em>Bottom Left:</em> The encoding-decoding process with amplitude and image tokens, demonstrating how Phaedra separates magnitude and shape information. <em>Right:</em> Visualization showing how Phaedra captures both high-frequency information and smooth structures, enabling accurate reconstruction of physical phenomena.
</div>

### Key Innovation

Inspired by classical **shape-gain quantization** and **basis function decomposition**, Phaedra proposes a novel tokenization approach that:

- **Captures Fine Details**: Preserves the intricate spatial patterns and structures in physical data
- **Maintains Precise Magnitudes**: Accurately represents the quantitative values essential for scientific analysis
- **Dual-Stream Architecture**: Separates amplitude (magnitude) and image (shape) information for optimal representation
- **Enables High-Fidelity Reconstruction**: Achieves superior reconstruction quality across multiple metrics
- **Generalizes Across Domains**: Demonstrates out-of-distribution generalization to unseen PDEs, unknown PDEs, and real-world data

### Technical Approach

Phaedra's tokenization pipeline works in two streams:

1. **Amplitude Tokens**: Encode the precise magnitudes and global coherent structures
2. **Image Tokens**: Capture fine details and local high-frequency features

This decomposition, inspired by classical signal processing, allows the model to:
- Focus on fine details while maintaining precise amplitudes
- Learn global and local features separately
- Achieve better reconstruction with fewer tokens
- Generalize to new physical systems

### Resources

<div class="resource-cards">
  <a href="https://camlab-ethz.github.io/Phaedra/" class="resource-card" target="_blank">
    <div class="resource-preview">
      <img src="https://api.microlink.io/?url=https://camlab-ethz.github.io/Phaedra/&screenshot=true&meta=false&embed=screenshot.url" alt="Project Website Preview" loading="lazy">
    </div>
    <div class="resource-content">
      <h4>Project Website</h4>
      <p>camlab-ethz.github.io/Phaedra</p>
    </div>
  </a>
  
  <a href="http://arxiv.org/pdf/2602.03915v1" class="resource-card" target="_blank">
    <div class="resource-preview">
      <img src="https://api.microlink.io/?url=https://arxiv.org/abs/2602.03915&screenshot=true&meta=false&embed=screenshot.url" alt="Paper Preview" loading="lazy">
    </div>
    <div class="resource-content">
      <h4>Paper (arXiv)</h4>
      <p>arxiv.org/pdf/2602.03915v1</p>
    </div>
  </a>
  
  <a href="https://github.com/camlab-ethz/Phaedra" class="resource-card" target="_blank">
    <div class="resource-preview">
      <img src="https://api.microlink.io/?url=https://github.com/camlab-ethz/Phaedra&screenshot=true&meta=false&embed=screenshot.url" alt="GitHub Preview" loading="lazy">
    </div>
    <div class="resource-content">
      <h4>Code (GitHub)</h4>
      <p>github.com/camlab-ethz/Phaedra</p>
    </div>
  </a>
</div>

### Impact

This work bridges the gap between modern deep learning tokenization approaches and the rigorous requirements of physical sciences, enabling more accurate and reliable AI systems for scientific applications.

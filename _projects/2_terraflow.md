---
layout: page
title: TerraFlow
description: Multimodal, Multitemporal Representation Learning for Earth Observation
img: assets/img/terraflow.png
importance: 2
category: quantization
related_publications: true
---

## TerraFlow: Multimodal, Multitemporal Representation Learning for Earth Observation
We propose TerraFlow, a novel approach to multimodal, multitemporal learning for Earth observation. TerraFlow builds on temporal training objectives that enable sequence-aware learning across space, time, and modality, while remaining robust to the variable-length inputs commonly encountered in real-world Earth observation data.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/terraflow.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

### Key Features

- **Multimodal & Multitemporal Foundation Model**
Jointly learns from multiple EO modalities (e.g., optical, SAR, DEM) and temporal sequences via early temporal fusion in a unified transformer.

- **Explicit Temporal Pretraining**
Incorporates temporal attention with rotary positional embeddings (RoPE) to model relative time differences and handle irregular, variable-length time series.

- **Temporal Disjoint Sampling (TDS)**
A novel training objective that enforces true temporal reasoning by separating input and target timestamps, encouraging learning of dynamics rather than single-timestep shortcuts.

- **Strong, Parameter-Efficient Performance**
Consistently outperforms state-of-the-art EO foundation models on GEO-Bench-2 temporal tasks, with small models rivaling much larger baselines.
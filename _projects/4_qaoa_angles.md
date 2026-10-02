---
layout: page
title: Learning Angles for QAOA
description: Replacing per-instance classical optimization in quantum approximate optimization with a single neural network forward pass
img: assets/img/qaoa_angles.png
importance: 1
category: quantum
related_publications: true
---

## Learning Angles for Quantum Approximate Optimization

The **Quantum Approximate Optimization Algorithm (QAOA)** is one of the leading candidates for tackling hard combinatorial optimization problems on quantum hardware. Its performance, however, hinges entirely on a set of variational angles $$(\boldsymbol{\beta}, \boldsymbol{\gamma})$$ — and finding good ones is an instance-specific, non-convex, and computationally expensive classical optimization task. This classical overhead, not the quantum circuit itself, is often the real bottleneck.

In this work, we **learn the mapping from the problem instance directly to high-quality QAOA angles**. A single forward pass of a neural network replaces the per-instance optimization loop, running several orders of magnitude faster at near-identical quality.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/qaoa_angles.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    <strong>Figure 1:</strong> The three stages of our approach. <em>Left:</em> A combinatorial optimization problem (here, weighted MaxCut) is reformulated as an Ising Hamiltonian, normalized, and cast as a weighted (hyper-)graph. <em>Center:</em> A deep learning model consumes the raw graph topology together with aggregated global features; backbones range from edge-aware message-passing graph neural networks to transformer architectures. <em>Right:</em> The predicted angle vector parameterizes the depth-$$p$$ QAOA circuit, whose quality we validate both in simulation and on quantum hardware.
</div>

### The Bottleneck

QAOA samples candidate solutions from a variational state built by alternating $$p$$ layers of a cost Hamiltonian $$H_C$$ and a mixer $$H_M$$:

$$|\psi_p(\boldsymbol{\beta}, \boldsymbol{\gamma})\rangle = \prod_{k=1}^{p} \left( e^{-i\beta_k H_M} e^{-i\gamma_k H_C} \right) |+\rangle^{\otimes n}$$

The angles $$\boldsymbol{\beta}, \boldsymbol{\gamma}$$ must be tuned to minimize the expected energy $$\langle H_C \rangle$$. The energy landscape is non-convex and rugged, and locating high-quality angles is itself NP-hard. Classical alternatives trade quality for speed: a **fixed-angle lookup** derived from tree subgraphs is effectively free but yields the lowest approximation ratios, while a full per-instance optimizer (our *solver* baseline) achieves the best quality at a steep runtime cost.

### Our Approach

We reframe angle selection as **supervised, graph-level regression**. For a target depth $$p$$, a single network maps a weighted graph $$G = (V, E, \{J_{ij}\})$$ to the $$2p$$ angles:

$$f_\theta(G) = (\beta_1, \ldots, \beta_p, \gamma_1, \ldots, \gamma_p)$$

Three ingredients make this work:

- **Ising reformulation and graph representation**: The optimization problem is mapped to a normalized Ising Hamiltonian and represented as a weighted graph, so a single model can consume instances from very different problem families.

- **Per-instance $$\gamma$$ rescaling**: Because QAOA applies $$e^{-i\gamma H_C}$$, a global rescaling of the cost Hamiltonian inversely rescales the $$\gamma$$ angles — instances with large edge weights require small $$\gamma$$. We rescale $$H_C \rightarrow a^{-1} H_C$$ using the mean squared magnitude of the cost operator's Pauli coefficients and train on $$\tilde{\gamma} = \gamma a$$. **This is the key ingredient** that lets one network learn across random-regular, Erdős–Rényi, and heavy-hex graphs at once.

- **Architecture comparison across three model classes**: We evaluate seven architectures — edge-token transformers, node-based graph encoders (Graph Transformer, GCN), and message-passing networks (GNN, GIN) — alongside a global-feature MLP baseline that sees only coarse graph statistics. This isolates how much the graph *structure* actually contributes.

Training labels come from a dataset of **12,191 weighted MaxCut instances** spanning random $$d$$-regular, Erdős–Rényi, and heavy-hex topologies with up to 144 nodes, with angles optimized by COBYLA and energies evaluated via Pauli propagation.

### Results

**Orders-of-magnitude speedup at near-solver quality.** Across circuit depths $$p \in \{1, \ldots, 5\}$$, the learned models sit in a favorable region of the runtime–accuracy Pareto front: inference costs several orders of magnitude less than the solver's per-instance optimization while recovering **over 99% of the solver's approximation ratio**. Because inference is a single forward pass, its cost is largely independent of circuit depth — so the runtime advantage over the solver *grows* with $$p$$.

**Mean performance hides what matters.** Average solver-relative performance (*Reach*) is close to 1 for all learned models, so we instead report the fraction of instances reaching at least 99.9% of the solver AR. Here the architectures separate sharply: at $$p = 3$$ the GNN reaches this threshold on **86.64%** of test instances versus **51.02%** for the global-feature MLP. Models that see graph structure are not merely exploiting angle concentration.

**Zero-shot generalization to unseen topologies and sizes.** A single trained model transfers without any retraining or fine-tuning to Barabási–Albert and 2D-grid graphs — structurally distinct from anything in training — lifting median Reach from roughly 0.81–0.94 for the fixed-angle baseline to approximately 0.99–1.0. It also extrapolates to Erdős–Rényi graphs of 150 and 200 nodes, well beyond the training distribution. Interestingly, plain transformer architectures generalize to larger and unseen graphs **more reliably than message-passing networks**, which appear to fit training topologies more strongly at the expense of transfer.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/qaoa_hardware.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    <strong>Figure 2:</strong> Hardware validation on <code>ibm_boston</code>. Average approximation ratio over 630 hardware-native heavy-hex graphs (12–144 nodes, none seen during training) at depths $$p = 1, 2, 3$$, reported as CVaR$$_\alpha$$ at $$\alpha = 90\%, 95\%, 99\%$$. All deep learning models are largely indistinguishable from the solver and consistently outperform the fixed-angle conjecture (FA).
</div>

**Validated on quantum hardware.** We predicted angles for 630 heavy-hex graphs on `ibm_boston` and drew 8,192 samples per circuit at depths $$p = 1, 2, 3$$. The resulting sample distributions from our models are **statistically indistinguishable from those of the solver** and clearly better than the fixed-angle conjecture — confirming that the learned angles hold up under real device noise.

### Honest Limits

We also probe where the approach breaks down. The training objective is an **MSE loss on angles**, which is only a proxy for the quantity that actually matters — the energy $$\langle H_C \rangle$$. By visualizing iso-MSE contours against the underlying energy landscape, we show that the span of iso-MSE rings grows with distance from the optimum: the proxy decorrelates from the true objective as errors increase. MSE works while errors are small and the landscape is reasonably well-behaved, but for more complex energy landscapes it may be ill-defined as a surrogate. This is a real trade-off, not a footnote: regression losses are cheap to compute but impose non-negligible inaccuracies, while optimizing the energy directly carries a substantial computational overhead.

Encouragingly, even **10% of the training data** suffices for all architectures to outperform the fixed-angle baseline, and performance scales smoothly toward the solver with more data.

### Why It Matters

This work amortizes a major bottleneck in QAOA: the per-instance classical optimization is replaced by an up-front, one-time cost of data generation and model training. That cost pays off in exactly the settings that matter for industrial deployment — **where many similar problems are optimized on a regular basis**. Combined with demonstrated zero-shot transfer across graph families and validation on real hardware, this moves learned angle prediction from a classically-simulable curiosity toward a practical component of quantum optimization pipelines.

### Resources

<div class="resource-cards">
  <a href="https://research.ibm.com/" class="resource-card" target="_blank">
    <div class="resource-content">
      <h4>IBM Research</h4>
      <p>Modeling &amp; Algorithms for Impact</p>
    </div>
  </a>
</div>

*Johannes Jakubik, Isabelle Wittmann, Zaheed Gaffoor, Gciniwe Simphiwe Baloyi, Craig Mahlasi, Etienne Vos, Thomas Brunschwiler, Daniel J. Egger — IBM Research. Training and inference code is open-sourced together with pretrained model weights.*

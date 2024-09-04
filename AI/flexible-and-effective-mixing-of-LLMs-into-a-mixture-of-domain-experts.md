# Flexible and Effective Mixing of Large Language Models into a Mixture of Domain Experts

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
4. Methodology
   4.1 MOE Model Mixing
   4.2 Gate-free MOE
   4.3 Noisy MOE
   4.4 Router Training
5. Experimental Results
   5.1 Low-cost MOE Creation
   5.2 Impact of Router Training
   5.3 Ablation Study on llama3-8B
6. Conclusions
7. References

## 1. Document Overview

This knowledge base entry is based on the research paper titled "Flexible and Effective Mixing of Large Language Models into a Mixture of Domain Experts" by Rhui Dih Lee, Laura Wynter, and Raghu Kiran Ganti from IBM Research. The paper introduces a toolkit for creating low-cost Mixture-of-Domain-Experts (MOE) models from pre-trained language models. It explores various approaches to mixing expert models, including gate-free and noisy MOE architectures, and examines the impact of router training on model performance.

The document is significant in the field of natural language processing and machine learning, as it presents a cost-effective method for enhancing the capabilities of large language models by combining them with domain-specific expert models. This approach has the potential to improve model performance across multiple domains without the need for extensive training or computational resources.

## 2. Introduction

The introduction provides context for the research and outlines the main contributions of the paper. Key points include:

- Mixture of Experts (MOE) models have shown superior performance compared to larger, dense models.
- MOE models activate fewer parameters per token, offering faster inference times.
- The paper introduces a toolkit for creating low-cost Mixture-of-Domain-Experts (MOE) from trained models.
- The proposed approach allows for flexible mixing of expert models to enhance the capabilities of a base model.

<quote>We present a toolkit for creating low-cost Mixture-of-Domain-Experts (MOE) from trained models. The toolkit can be used for creating a mixture from models or from adapters.</quote>

The authors highlight the potential of their approach to create true domain experts by mixing multiple trained models:

<quote>By selecting domain-specialised, trained models of interest to augment the capabilities of the source model, the resulting MOE model can deliver the promise of a true Mixture of Domain Experts.</quote>

## 3. Related Work

The paper discusses several related works and approaches in the field of MOE model creation:

1. Mergekit repository by Charles Goddard:
   <quote>The recommendation provided there is to set the router weights from the hidden states in the FFN of each expert obtained when running each expert on a set of targeted prompts.</quote>

2. A similar library created by a different team, but without experimental results.

3. LoRA adapter-based approach:
   <quote>The authors of [12] propose a similar approach but require the experts to be LoRA adapters and the use of a single linear-layer router shared across all of the LoRA layers.</quote>

4. On-demand selection and combination of LoRA adapters:
   <quote>In [13] the authors propose an "on-demand selection and combination" of LoRA adapters at inference time and provide a their code publicly.</quote>

5. CALM approach:
   <quote>Lastly, we mention CALM [14], a version of the MOE idea comprising two models: a base model and an augmenting model.</quote>

The authors note that their approach offers more flexibility in defining experts and routing mechanisms compared to these related works.

## 4. Methodology

### 4.1 MOE Model Mixing

The paper introduces a toolkit for mixing expert models into a base model:

<quote>Our MOE Model Mixing toolkit swaps the FFN layers of each expert model, along with a gate, in place of the FFN layers of a base model.</quote>

This approach allows for the creation of a Mixture of Domain Experts (MOE) by combining pre-trained models with domain-specific expertise.

### 4.2 Gate-free MOE

The authors propose a Gate-free MOE architecture:

<quote>We thus propose creating a Gate-less MOE, which assigns an equal weight to each expert.</quote>

This approach is particularly effective when the number of expert models is small, offering optimal performance in terms of model creation cost and subsequent model performance on evaluation tasks.

### 4.3 Noisy MOE

To address the increased inference cost of the Gate-free MOE when the number of experts grows, the authors introduce the Noisy MOE:

<quote>To this end, we also allow creating a Noisy MOE, which uses a single linear layer of dimension hidden-size by number of experts, and defines the weight of each element to be white noise centered at 0 with a small variance, and then uses a top K strategy to select the K experts to route each token to.</quote>

The Noisy MOE provides a balance between performance and inference cost, especially when dealing with a larger number of expert models.

### 4.4 Router Training

While the authors found that router training is not always necessary, they provide the option in their toolkit:

<quote>While we have found that the routers need not be trained to achieve good results, our toolkit offers the possibility to train the routers or a combination of the routers and the attention layers.</quote>

This flexibility allows users to experiment with different approaches and optimize performance for specific use cases.

## 5. Experimental Results

The paper presents extensive experimental results to validate the proposed approaches and compare them with existing methods.

### 5.1 Low-cost MOE Creation

The authors demonstrate that low-cost creation of an MOE from trained expert models is a viable approach to improving model performance:

<quote>The key observation is that low-cost creation of an MOE from trained expert models is a viable approach to improving the performance of a model in a cost-effective manner.</quote>

They show that the MOE models maintain or improve performance across various evaluation tasks compared to the base model and individual expert models.

### 5.2 Impact of Router Training

The experiments reveal that router training can be beneficial but is not always required:

<quote>We thus see that some benefit can be achieved by training the routers on a small amount of targeted data, but that such training is not needed to obtain very competitive results with the MOE.</quote>

The authors observe that router training can be particularly beneficial for specific tasks, such as math-related problems.

### 5.3 Ablation Study on llama3-8B

The paper includes an ablation study using llama3-8B models to examine various aspects of the proposed methodology:

1. Impact of MOE base model:
   <quote>The base model used for the MOE has a noticeable impact, as can be seen from bars 4-6 (dark-blue, green and red) in Figure 5. The MOE with a math-trained base performs the best on the GSM8K math test and the MOE with a medical-trained base performs best on the medical tests.</quote>

2. Comparison of FFN mixing and LoRA adapter MOE mixing:
   <quote>However, overall FFN mixing is a better choice than mixing LoRA adapters into an MOE, as evidenced by comparing the 9 bars from bars 4-12 (dark blue to light purple) with the last two bars representing LoRA-adapter experts, (blue and cyan).</quote>

3. Fine-grained router training:
   <quote>Comparing the pink and red bars show that router training is not always needed though it can help performance in some cases, primarily here for the math tests, as was also the case with the Merlinite-based MOE.</quote>

4. Performance comparison with baselines:
   <quote>The conclusion of this comparison is that there is often a mixed MOE that performs better than the baselines, but that a validation exercise is needed to select which is the best-performing variant.</quote>

## 6. Conclusions

The paper concludes by summarizing the key findings and contributions:

<quote>We propose low-cost creation of an MOE from a given source model by mixing it with other expert models having the same architecture. We show that the best results are obtained when the source model is completed by well-performing models and that a Gate-free policy, which is the cheapest option to create, is often the best or at least highly competitive with the best approach.</quote>

The authors highlight the flexibility of their approach:

<quote>Both of these model mixing procedures allow for swapping in and out of expert models into an MOE at practically zero cost.</quote>

They also emphasize the importance of experimentation and validation:

<quote>As expected, results vary according to the base and expert models employed and datasets used. For that reason, the toolkit we provide the capability to use Gate-free, Noisy MOE, or router-training, and offer both FFN-based expert mixing as well as LoRA-adapter-based expert mixing.</quote>

## 7. References

The paper includes an extensive list of references, which can be found at the end of the document. Some key references include:

1. MistralAI, "Mixtral-of-experts."
2. O. Sanseviero et al., "Mixture of experts explained."
3. DeepSeek-AI et al., "Deepseek-v2: A strong, economical, and efficient mixture-of-experts language model."
4. D. Cheng et al., "Adapting large language models via reading comprehension."
5. S. Sukhbaatar et al., "Branch-train-mix: Mixing expert llms into a mixture-of-experts llm."
6. C. Goddard, "Mixture of experts for clowns (at a circus)."
7. J. Kang et al., "Self-moe: Towards compositional large language models with self-specialized experts."
8. R. Bansal et al., "Llm augmented llms: Expanding capabilities through composition."
# Generative AI-based Prompt Evolution Engineering Design Optimization With Vision-Language Model

## Table of Contents

1. Document Overview
2. Introduction
3. Literature Review
4. Methods
   4.1 Overview
   4.2 Strategies for Constructing the Prompt
   4.3 Prompt Evolutionary Design Optimization with Vision-Language Model
5. Experiments and Discussion
   5.1 Experiment Settings
   5.2 Experiment Results and Discussion
6. Conclusion and Outlook
7. Acknowledgment
8. References

## 1. Document Overview

This knowledge base entry is based on a research paper titled "Generative AI-based Prompt Evolution Engineering Design Optimization With Vision-Language Model" by Melvin Wong, Thiago Rios, Stefan Menzel, and Yew Soon Ong. The paper presents a novel approach to engineering design optimization using generative AI, prompt evolution, and vision-language models. It focuses on optimizing car designs for aerodynamic performance while maintaining practicality.

The document is significant in the field of AI-assisted engineering design, as it introduces a new framework called Prompt Evolution Design Optimization (PEDO) that leverages the power of large language models and vision-language models to guide the design process. This approach has the potential to revolutionize how engineers and designers create and optimize complex 3D structures.

## 2. Introduction

The introduction of the paper sets the context for the research and highlights the importance of generative AI in various fields, including engineering design optimization. 

<quote>Generative artificial intelligence (GenAI) and large language models (LLMs) are currently contributing to major advances in a variety of fields, such as text and image-based content generation, dialog-based systems, knowledge retrieval and management, and co-programming, among others.</quote>

The authors point out that while there have been significant advancements in image and video synthesis from text prompts, 3D shape synthesis through prompt-based data-driven generative models remains challenging. They identify several key issues:

1. Limited availability of annotated 3D object datasets for training text-to-3D models.
2. High computational and manual effort required to generate 3D design data with high variability and corresponding performance annotations.
3. The tendency of generative models to "hallucinate" designs that may fit the description but are impractical for engineering purposes.

To address these challenges, the authors propose the PEDO framework, which incorporates:

1. A derivative-free evolutionary optimizer
2. A text-to-3D generative model
3. A novel integration of vision-language models
4. A physics-based solver to evaluate car design performance

<quote>We present a prompt evolution design optimization (PEDO) framework contextualized in a vehicle design scenario that leverages a vision-language model for penalizing impractical car designs synthesized by a generative model.</quote>

## 3. Literature Review

The paper provides a concise literature review, highlighting recent advancements in geometric deep learning and text-to-3D models. Key points include:

1. Successful attempts to use generative models like autoencoders for learning 3D design data and performing geometric operations based on learned latent representations.

2. The release of Point-E and Shap-E by OpenAI, allowing users to generate 3D shapes from text prompts.

3. The challenges of using text-to-X generative models as black-box tools for obtaining diverse sets of designs quickly in computational engineering design optimization.

4. Recent work on generating annotated datasets focused on design modifications through text prompts, which improves control over design modifications but is still limited to a small number of object classes.

5. The concept of prompt evolution for GenAI, which demonstrated the feasibility of leveraging the evolutionary process and a vision-language model as black-box preference guidance to synthesize multiple outputs that best satisfy target preferences inferred by the text prompt.

<quote>The recently conceptualized prompt evolution paradigm for GenAI [17] demonstrated the feasibility of leveraging the evolutionary process and a vision-language model as the black-box preference guidance to synthesize multiple outputs that best satisfy target preferences inferred by the text prompt.</quote>

## 4. Methods

### 4.1 Overview

The PEDO framework comprises four key components:

1. A derivative-free evolutionary optimizer
2. A text-to-3D generative model
3. A novel integration of vision-language models
4. A physics-based solver to evaluate car design performance

The framework begins with the optimizer sampling a population of N set of words, which are used to instantiate a prompt template. These prompts are then fed into the text-to-3D generative model to synthesize N designs. The designs are evaluated using a physics-based solver, and the performance is normalized to serve as fitness scores for the optimizer.

<quote>Our framework begins with the optimizer sampling a population of N set of words where each word is selected based on a distance function between a reference word and its corresponding sample word (Fig. 2). Each set of words is then used to instantiate the prompt template containing the immutable specifications expressed in free-form natural language.</quote>

### 4.2 Strategies for Constructing the Prompt

The paper discusses two strategies for constructing prompts:

1. Bag-of-Words (BoW) strategy:
   - Uses the Wordnet vocabulary set
   - Optimizer samples pairs of <adjective> and <noun>
   - Prompt template: "A <adjective> car in the shape of <noun>"
   - Words are selected using Wu & Palmer (WUP) similarity metric

2. Tokenization strategy:
   - Prompt template: "A car in the shape of <string>"
   - <string> comprises the most common words in vocabulary
   - Tokens are sampled from a normal distribution

<quote>We adopt the following approach to select the most common words in vocabulary. Let X ⊂ R^D denote a space of latent variables of D dimensions. We use a linear model h(z): R^D → [0, 1]^V to select a token out of V tokens in GPT-4 [23] vocabulary.</quote>

### 4.3 Prompt Evolutionary Design Optimization with Vision-Language Model

To address the issue of generating ill-defined designs, the authors propose using a vision-language model as a soft constraint. The penalty score is computed as follows:

<quote>s_penalty = -log(g(x, p_target)),</quote>

where x is a single viewpoint image of the 3D design, p_target is the encoded text prompt of visual preferences, and s_penalty > 0.

The optimization objective is then modified to include this penalty term:

<quote>min f_score = (s_design / (max(s_base) - min(s_base))) + αs_penalty,</quote>

where α > 0 is the penalty weight that controls the contribution of the penalized term.

## 5. Experiments and Discussion

### 5.1 Experiment Settings

The experiments use the following components:

- Shape-E model as the text-to-3D model
- CMA-ES as the derivative-free evolutionary optimizer
- BLIP-2 and CLIP as vision-language models
- Penalty weight α = 1.0 for both vision-language models

The experiments compare the performance of the baseline framework with the proposed PEDO variants using two design performance objectives:
1. Projected frontal area
2. Normalized drag coefficient

### 5.2 Experiment Results and Discussion

The results show significant improvements in finding practical car designs when using the vision-language model:

<quote>We observed a significant improvement of more than 20% in finding practical car designs when the vision-language model is introduced.</quote>

Key findings include:

1. The tokenization strategy generally performs better than the BoW strategy.
2. The PEDO variants maintain a high degree of accuracy throughout the generations, while the baseline method cannot obtain such performance.
3. The text-to-3D model initially found a diverse set of novel designs, many of which were impractical, demonstrating the need for visual guidance.
4. Both CLIP and BLIP2 models effectively penalize impractical designs, allowing the selection pressure to prioritize viable designs.
5. The prompt length directly impacts the prompt evolution performance.
6. Visual inspection of the generated car designs shows that the PEDO framework can minimize the likelihood of finding ill-defined designs.

<quote>Our proposed technique that uses a vision-language model can minimize the likelihood of the derivative-free optimizer finding such ill-defined designs as shown in Fig. 6 (b), (c) and (f).</quote>

## 6. Conclusion and Outlook

The paper concludes that prompt evolution is a promising paradigm for finding novel designs with a high degree of accuracy maintained throughout the evolutionary process. It provides ease of use in specifying design specifications and preferences via a natural language interface.

The authors suggest several areas for future research:

1. Investigating the impact of prompt length on prompt evolution performance.
2. Studying the effects of the penalty contribution in relation to different penalty weights.
3. Exploring the proposed methods in other types of engineering design applications.
4. Examining the relationship between geometric differences and textual descriptions in the prompt on prompt evolution performance.

<quote>Prompt evolution presents abundant research opportunities in generative AI for evolutionary engineering design optimization.</quote>

## 7. Acknowledgment

The authors express gratitude to individuals, especially Dr. Jiao Liu, for their expertise and valuable critiques. The research is partly supported by the Honda Research Institute Europe (HRI-EU) and the College of Computing & Data Science (CCDS), Nanyang Technological University (NTU).

## 8. References

The paper includes 23 references, which are not fully listed in the provided PDF excerpt. Some of the key references mentioned in the text include:

1. OpenAI's Dall-E 3
2. Stable diffusion
3. Midjourney and Lumiere
4. Point-E and Shap-E by OpenAI
5. ShapeNetCore dataset
6. GPT-4

<quote>[23] J. Achiam, S. Adler, S. Agarwal, L. Ahmad, I. Akkaya, F. L. Aleman, D. Almeida, J. Altenschmidt, S. Altman, S. Anadkat et al., "Gpt-4 technical report," arXiv preprint arXiv:2303.08774, 2023.</quote>
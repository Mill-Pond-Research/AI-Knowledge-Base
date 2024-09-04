# Automated Black-box Prompt Engineering for Personalized Text-to-Image Generation

## Table of Contents

1. Introduction
2. Related Works
3. Method
   3.1 Problem Statement
   3.2 Algorithm
   3.3 Designing and updating F and p_θF
   3.4 Designing the judge model D
4. Experiments
   4.1 Experimental Settings
   4.2 Personalized Text-to-Image Generation
   4.3 Direct Image Inversion
   4.4 Ablation Study
   4.5 Prompt Editing
5. Conclusion and Broader Impact Statement
6. References
7. Appendices

## 1. Introduction

<introduction>
This knowledge base document is based on a research paper that introduces PRISM (Prompt Refinement and Iterative Sampling Mechanism), a novel algorithm for automated prompt engineering in text-to-image generation. The paper addresses the challenge of creating effective prompts for text-to-image (T2I) generative models, which is typically a labor-intensive process requiring manual crafting.

Key points from the introduction:

1. Prompt engineering is effective for controlling text-to-image generative models but is laborious due to the need for manually crafted prompts.
2. Existing automated prompt generation methods often struggle with transferability across T2I models, require white-box access to the underlying model, and produce non-intuitive prompts.
3. PRISM is introduced as an algorithm that automatically identifies human-interpretable and transferable prompts for desired concepts, given only black-box access to T2I models.
4. The method is inspired by large language model (LLM) jailbreaking and leverages the in-context learning ability of LLMs to iteratively refine candidate prompt distributions for given reference images.

Quote: "An important goal of generative modeling is to design algorithms capable of steering generative models to produce desired output images."
</introduction>

## 2. Related Works

<related_works>
The paper discusses several areas of related work:

1. Controllable T2I generation:
   - Methods using pretrained diffusion models as priors for data distribution
   - Approaches like ControlNet, IP-Adapter, Dreambooth, SuTI, and InstantBooth that improve controllability but require fine-tuning or re-training
   - Prompt tuning methods like Textual Inversion, PEZ, and PH2P that don't require fine-tuning but need access to model parameters

2. Prompt engineering:
   - Manual prompt engineering is popular but laborious and sensitive to phrasing
   - Automated prompt construction methods have been proposed to address these issues
   - LLM jailbreaking is particularly relevant, using auxiliary LLMs to construct prompts that elicit specific behaviors

Quote: "Manual prompt engineering is one of the most popular approaches to eliciting desired behaviors from large pre-trained models because it uses little or no data and does not require fine-tuning."
</related_works>

## 3. Method

### 3.1 Problem Statement

<problem_statement>
The paper formally defines the problem of finding the best prompt for personalized text-to-image generation:

- Let x ∈ X denote an image, and y ∈ Y denote a textual prompt
- Given a collection of reference images {x_i}^M_i=1, a prompt engineer F : X → Δ(Y) samples a candidate prompt y
- A T2I generative model G : Y → Δ(X) uses this candidate prompt to generate a new image
- A judge model D : X × X → [0, 1] scores the visual similarity between the images based on some criteria

The goal is to find the best prompt:

y* = arg max_y∈Y Σ^M_i=1 Score(x_i, y)

where Score(x_target, y) = E_x~p_θG(x|y) [D(x, x_target)]

The resulting y* should be able to generate an image very close to the reference images based on the criteria with some (possibly unseen) T2I models p_θ(x|y).
</problem_statement>

### 3.2 Algorithm

<algorithm>
PRISM (Prompt Refinement and Iterative Sampling Mechanism) is an iterative process that repeats a prompt-refinement subroutine for K iterations in N parallel streams. The algorithm works as follows:

1. At iteration k, the n-th stream of PRISM randomly selects a reference image x_k,n from {x_i}^M_i=1
2. F samples a candidate prompt y_k,n from p_θF(y|x_k,n)
3. G generates a single x̂_k,n from y_k,n with p_θG(x|y_k,n)
4. D evaluates the prompt with an in-iteration score Score'(x_k,n, y_k,n) = D(x_k,n, x̂_k,n)
5. The generated y_k,n and its score are used to update p_θF(y|x)

After the entire process:
1. Collect the subset {y_c}^C_c=1 with the C-best in-iteration scores
2. Re-evaluate this subset with total score Σ^M_i=1 Score(x_i, y_c)
3. Return the prompt with the best total score (in case of a tie, return the prompt with the highest log-likelihood)

Quote: "The key difference between PRISM and prior methods is that PRISM updates the entire sampling distribution of prompts, whereas prior works directly update the tokens of a single prompt or the embedding of the prompt."
</algorithm>

### 3.3 Designing and updating F and p_θF

<designing_F>
The paper discusses the design choices for the prompt engineer assistant F and its distribution p_θF:

1. What is p(y|x)?
   - Traditional captioning models fall short for controlled image generation
   - The goal is to model "possible prompts that are used to generate this image" rather than just "a good description of an image"

2. Desiderata for F:
   - Sample from a distribution p_θF(y|x) that models "the prompt that can be used to generate this image"
   - Easily updated if the current generation is suboptimal
   - Ideally, updates can be done without retraining or fine-tuning

3. Multimodal LLM as the choice for F:
   - Can directly tailor the generation of prompts via system prompts
   - Adapts through in-context learning without requiring access to the model's parameters
   - Can incorporate reference images, intermediate prompts, generated images, and associated scores in the context
   - Facilitates iterative refinement of the prompt to update the posterior distribution based on feedback
   - Processes how the image generative model is affected by different prompts, proposes improvements, and creates new prompts

Quote: "Multimodal LLM stands out as the ideal choice for F due to their ability to directly tailor the generation of prompts via system prompts and to adapt through in-context learning without requiring access to the model's parameters."
</designing_F>

### 3.4 Designing the judge model D

<designing_D>
The paper discusses the design considerations for the judge model D:

1. Limitations of pre-trained discriminative models:
   - Models like CLIP and DINO have limitations in attending to fine-grained details
   - The criteria for success in image generation can be nuanced and difficult to quantify through traditional distance or similarity functions

2. Ideal characteristics of the judge model:
   - Maximally flexible for different kinds of criteria
   - Ability to perform fine-grained analysis of images
   - Easily specify metrics that may be otherwise difficult to describe or evaluate
   - Applicable to a wide range of tasks

3. Multimodal LLM as the choice for D:
   - Can easily specify metrics using system prompts and in-context learning
   - Allows for intervention in the reasoning chain if needed
   - The same model can be applied to a wide range of tasks

Quote: "Once again, a multimodal LLM emerges as the perfect candidate: using system prompts and in-context learning, we can easily specify metrics that may be otherwise difficult to describe or evaluate and even intervene in the reasoning chain if we want to, and, more importantly, the same model can be applied to a wide range of tasks."
</designing_D>

## 4. Experiments

### 4.1 Experimental Settings

<experimental_settings>
The paper describes the following experimental settings:

1. Implementation Details:
   - GPT-4V is chosen as both the prompt engineer assistant model F and the judge D
   - SDXL-Turbo is fixed as the T2I generator for all experiments
   - Different system prompts are designed for F and D for each task
   - Evaluation is done with five different T2I models: SD 2.1, SDXL-Turbo, Dall-E 2, Dall-E 3, and Midjourney

2. Comparison Settings:
   - Two settings: personalized T2I generation and direct image inversion
   - For personalized T2I generation: maximum budget of 40, N = 10, K = 4
   - For direct image inversion: maximum budget of 30, N = 6, K = 5
   - Chat history length of 3 is kept, and prompt length is used as an approximation of log-likelihood

3. Baselines:
   - Textual Inversion (TI)
   - BLIP-2 (BLIP2)
   - CLIP-Interrogator (CLIP-Int)
   - PEZ

4. Evaluation Metrics:
   - Prompt interpretability: mean negative log-likelihood (NLL) calculated from Mistral 7B
   - Image quality: CLIP image similarity score (CLIP-I) and DINO V2 embedding similarity
   - For Dall-E 2 and Dall-E 3: number of times each method fails to pass its black-box safeguard

Quote: "We compare PRISM and baselines in two settings: personalized T2I generation and direct image inversion, and we will elaborate on the task definitions in their corresponding sections below."
</experimental_settings>

### 4.2 Personalized Text-to-Image Generation

<personalized_T2I>
The paper presents results for personalized text-to-image generation:

1. Datasets:
   - DreamBooth dataset: 30 daily objects, 4-6 images per subject, 25 prompt templates
   - Wikiart dataset: used for qualitative demonstration of artistic style representation

2. Quantitative Results (DreamBooth dataset):
   - PRISM achieves the best performance across most metrics
   - Only method producing fully human-readable prompts for subjects
   - Consistently achieves accurate depiction of target subjects
   - Marginally lower CLIP-I and DINO scores with SDXL-Turbo compared to Textual Inversion

3. Qualitative Results:
   - PRISM captures fine-grained details better than baselines
   - Only method that can tackle complicated objects when others fail
   - Generates fewer unsafe prompts judged by Dall-E safeguards

4. Wikiart Results:
   - PRISM precisely identifies genres, eras, and sometimes artist names
   - Provides fine-grained details like pen stroke styles and color palettes

Quote: "PRISM is the only method in our experiments that can produce fully human-readable prompts for these subjects."
</personalized_T2I>

### 4.3 Direct Image Inversion

<direct_image_inversion>
The paper presents results for the task of direct image inversion:

1. Task Description:
   - Goal: Find the prompt that can exactly generate the input image
   - Number of reference images M = 1
   - Aim to capture all aspects of the image, including subjects, background, theme, style, and other details

2. Dataset:
   - DiffusionDB dataset: wide variety of image pairs generated by Stable Diffusion
   - Random sample of 100 images from the large_random_10k split on Huggingface

3. Results:
   - Significant improvement in readability of inverted prompts using PRISM
   - PRISM finds text that more closely aligns with a learned distribution of English language text
   - CLIP-Interrogator and PEZ show high performance on Stable Diffusion models but poor generalizability to other models
   - PRISM's prompts generalize significantly better and achieve the best results on Dall-E 3

4. Qualitative Observations:
   - PRISM provides prompts that are both semantically aligned with and can generate images visually similar to the reference
   - Captures fine-grained details and specific structures (e.g., grid of animal faces) that other methods miss

Quote: "Qualitatively, our method also provides prompts that are both semantically aligned with and can generate images that are visually similar to the reference."
</direct_image_inversion>

### 4.4 Ablation Study

<ablation_study>
The paper presents several ablation studies to understand the effectiveness of different components in PRISM:

1. Comparison with GPT-4V:
   - PRISM consistently outperforms GPT-4V's zero-shot performance
   - GPT-4V can capture high-level semantics but misses fine-grained details

2. Trade-off between N and K:
   - Performance can degrade if refinement is repeated too many times (K is too large)
   - Optimal N and K vary depending on the task complexity
   - For simple concepts, small N and K are generally sufficient
   - For rarer and more complicated concepts, larger K (reasoning depth) is more helpful

3. Effect of increasing total budget:
   - Steady performance improvements in both human readability and prompt accuracy when increasing N while keeping K fixed
   - General upward trend in prompt accuracy when increasing K while keeping N fixed, but not monotonic

4. Importance of using a multimodal LLM as the Judge:
   - CLIP-based judges often include irrelevant elements and omit important details
   - GPT-4V judged PRISM adheres better to object-oriented details and ignores unrelated factors
   - In style-driven T2I personalization, GPT-4V judged PRISM produces more precise and focused prompts for reference styles

Quote: "We see in Table 6 that PRISM consistently outperforms GPT-4V's zero-shot performance, although the latter is already compelling."
</ablation_study>

### 4.5 Prompt Editing

<prompt_editing>
The paper demonstrates the capability of PRISM for prompt editing:

1. Human-interpretable prompts:
   - PRISM produces prompts that are easily understandable and modifiable by humans

2. Attribute modification:
   - After obtaining a prompt from reference images, users can easily modify specific attributes in the desired generated images

3. Example demonstration:
   - Figure 10 shows an example of prompt editing with PRISM in Midjourney
   - Simple and intuitive prompt edits allow changing specific attributes while keeping other components in the scene unchanged

Quote: "With simple and intuitive prompt edit, we are able to change specific attributes of the images while keeping the other components in the scene unchanged."
</prompt_editing>

## 5. Conclusion and Broader Impact Statement

<conclusion>
The paper concludes with the following points:

1. Summary of PRISM:
   - An algorithm that automatically creates human-interpretable and accurate text prompts for text-to-image generative models
   - Based on visual concepts provided by reference images
   - Iteratively refines the sampling distribution of text prompts via LLM in-context learning
   - Capable of creating prompts transferable to any T2I model, including black-box platforms like Dall-E and Midjourney

2. Broader Impact:
   - Acknowledges potential vulnerabilities to malicious intent, bias, or limitations in base models
   - Commits to implementing necessary safeguards upon public release of the code
   - Pledges to keep up with future advancements in improving the safety of the method

Quote: "In this paper, we propose PRISM, an algorithm that automatically creates human-interpretable and accurate text prompts for text-to-image generative models, based on visual concepts provided by reference images."
</conclusion>

## 6. References

<references>
The paper includes an extensive list of references, which are not fully reproduced here due to space constraints. Some key references include:

1. Brown, T., et al.: Language models are few-shot learners. Proc. NeurIPS 33, 1877–1901 (2020)
2. Chao, P., et al.: Jailbreaking black box large language models in twenty queries. arXiv preprint arXiv:2310.08419 (2023)
3. Gal, R., et al.: An image is worth one word: Personalizing text-to-image generation using textual inversion. In: Proc. ICLR (2023)
4. He, Y., et al.: Manifold preserving guided diffusion. In: Proc. ICLR (2024)
5. Rombach, R., et al.: High-resolution image synthesis with latent diffusion models. In: Proc. CVPR. pp. 10684–10695 (2022)
6. Ruiz, N., et al.: Dreambooth: Fine tuning text-to-image diffusion models for subject-driven generation. In: Proc. CVPR. pp. 22500–22510 (2023)

These references cover a range of topics including language models, text-to-image generation, prompt engineering, and related techniques.
</references>

## 7. Appendices

<appendices>
The paper includes several appendices with additional details:

1. Additional Experiment Details:
   - Specifics on quantitative analysis settings
   - Details on prompt evaluation and re-evaluation processes
   - Information on handling run-time errors and token limits

2. Designing System Prompts:
   - Guidelines for creating system prompts for the prompt engineer assistant F and the judge D
   - Components included in the system prompts: Setting, Format, Examples

3. Additional Results:
   - Qualitative examples for subject-driven and style-driven T2I personalization
   - Examples of direct image inversion and prompt editing
   - Demonstration of the iteration and refinement process in PRISM

4. Additional Ablation Study:
   - Detailed analysis of the effect of different components in PRISM
   - Comparisons with GPT-4V and studies on the trade-off between N and K

5. Limitations and Future Works:
   - Discussion on current limitations of PRISM
   - Potential directions for improvement and future research

6. Full System Prompts:
   - Complete system prompts used for different tasks in the experiments

Quote: "We provide details about the system prompts in the appendix."
</appendices>
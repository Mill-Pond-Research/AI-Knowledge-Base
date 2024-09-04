# BeautifulPrompt: Towards Automatic Prompt Engineering for Text-to-Image Synthesis

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
   3.1 Text-to-Image Synthesis (TIS)
   3.2 TIS Evaluation
   3.3 Prompt Engineering for TIS
4. Dataset Creation
5. The BeautifulPrompt Model
   5.1 Supervised Fine-tuning (SFT)
   5.2 Reward Modeling (RM)
   5.3 Reinforcement Learning
6. Experiments
   6.1 Overall Results
   6.2 Detailed Analysis
7. Industrial Application
8. Conclusion
9. Limitations
10. Ethical Considerations
11. Glossary
12. References and Further Reading

## 1. Document Overview

This knowledge base entry is based on the research paper "BeautifulPrompt: Towards Automatic Prompt Engineering for Text-to-Image Synthesis" by Tingfeng Cao, Chengyu Wang, Bingyan Liu, Ziheng Wu, Jinhui Zhu, and Jun Huang. The paper introduces a novel approach to automatic prompt engineering for text-to-image synthesis models, aiming to improve the quality of generated images without manual intervention.

The document presents the BeautifulPrompt model, which uses a combination of supervised fine-tuning, reward modeling, and reinforcement learning to generate high-quality prompts from simple user inputs. The research demonstrates the effectiveness of this approach through extensive experiments and showcases its potential for industrial applications.

## 2. Introduction

Text-to-Image Synthesis (TIS) has seen remarkable advancements in recent years, particularly with the development of diffusion-based models like Stable Diffusion. However, these models often require carefully crafted prompts to produce high-quality images, which can be challenging for non-expert users.

The authors introduce BeautifulPrompt to address this challenge:

<quote>We propose BeautifulPrompt, a novel generative model that can write high-quality prompts for diffusion-based TIS models. For better user experience, it re-writes and optimizes the original, low-quality prompts into high-qualities ones to generate better images. It also provides a good source of inspiration for further manual prompt editing.</quote>

Key contributions of the study include:

1. A new dataset containing 143k prompt pairs and 2k test prompts for developing prompt engineering models.
2. The BeautifulPrompt model, which can write high-quality prompts for diffusion-based TIS models.
3. A Reinforcement Learning with Visual AI Feedback training scheme for better visual alignment without human labeling.
4. Extensive experimental results demonstrating the superiority of BeautifulPrompt over strong baselines.
5. Integration of BeautifulPrompt into an industrial product for better image generation service.

## 3. Related Work

### 3.1 Text-to-Image Synthesis (TIS)

The document provides a brief overview of the evolution of TIS models:

<quote>TIS is a multi-modal task of generating images conditioned on texts. In the early years, popular image generation networks were mainly based on Generative Adversarial Network (GAN) (Goodfellow et al., 2014; Reed et al., 2016). Recently, diffusion models (Ho et al., 2020; Sohl-Dickstein et al., 2015; Liu et al., 2023), such as DALLE-2 (Ramesh et al., 2022), Imagen (Saharia et al., 2022), and Stable Diffusion (Rombach et al., 2022) have achieved remarkable results.</quote>

### 3.2 TIS Evaluation

The paper discusses various metrics used for evaluating TIS models:

- CLIP score: Measures similarity between generated images and prompts.
- Aesthetic score: Evaluates the aesthetic quality of individual images.
- Human preference metrics: HPS, Image Reward, and PickScore.

The authors note the advantages of PickScore:

<quote>Among the human preference metrics, PickScore stands out due to its stable scoring and larger, more diverse training datasets, which includes a wider range of implementations (e.g., model size, backbone, hyperparameters) (Kirstain et al., 2023). These factors can potentially contribute to more stable training and facilitate easier extension to other TIS models.</quote>

### 3.3 Prompt Engineering for TIS

The document highlights the growing interest in prompt engineering for TIS:

<quote>Due to the extraordinary potential of TIS, there is a surge of interest in prompt engineering (i.e., creating good prompts). Liu and Chilton (2022) conduct a series of experiments and propose several design guidelines for text-to-image prompt engineering. Oppenlaender (2022) identifies six types of prompt modifiers through a three-month ethnographic study of the online generative art community.</quote>

The authors also mention existing approaches like BestPrompt and MagicPrompt, but emphasize the unique capabilities of BeautifulPrompt:

<quote>BeautifulPrompt, on the other hand, can re-write the original prompts to give users a good source of inspiration and generate more beautiful images.</quote>

## 4. Dataset Creation

The authors describe their process for creating a dataset to train BeautifulPrompt:

1. Collection of Prompt Pairs:
   - Source: DiffusionDB (Wang et al., 2022b)
   - Methods:
     a) Using BLIP to caption images associated with high-quality prompts
     b) Using ChatGPT to summarize high-quality prompts
     c) Using ChatGPT to generate better prompts from low-quality prompts

2. Post-processing:
   - Filtering out non-English and NSFW content
   - Filtering based on aesthetic scores of generated images
   - Ensuring consistency between low-quality and high-quality prompts

The resulting dataset includes:
<quote>We finally collect 143k prompt pairs as our training set. In addition, we randomly extract 2k entries from low-quality prompts as our testing set. For the training set, the average lengths of low-quality and high-quality prompts are 40.3 and 197.8, respectively, indicating that high-quality prompts contain more descriptions of details.</quote>

## 5. The BeautifulPrompt Model

The BeautifulPrompt model is trained in three stages:

### 5.1 Supervised Fine-tuning (SFT)

The model is fine-tuned on the collected dataset of prompt pairs:

<quote>Given a dataset of prompt pairs D = {(x, y)}, containing pairs of low-quality prompts x and high-quality prompts y, we fine-tune a decoder-only language model to output a high-quality prompt of tokens y = {y1, ..., yn} with a given instruction and a low-quality prompt x.</quote>

### 5.2 Reward Modeling (RM)

The authors introduce a novel approach called Reinforcement Learning with Visual AI Feedback (RLVAIF):

<quote>We propose RLVAIF: a method that incorporates visual feedback into the training of language models, thereby avoiding the cost of expensive human labeling. We focus on the quality of the final generated image and its similarity to the low-quality prompt x. Therefore, we consider PickScore (Kirstain et al., 2023) and the aesthetic score (Schuhmann et al., 2022) as our visual AI feedback to train reward models to fit these scores.</quote>

### 5.3 Reinforcement Learning

The final stage uses Proximal Policy Optimization (PPO) to optimize the model:

<quote>To further improve the model performance, we initialize a policy π = ρ, and then fine-tune π to perform the task using reinforcement learning. We leverage the Proximal Policy Optimization (PPO) (Schulman et al., 2017) algorithm to directly optimize the expected reward.</quote>

## 6. Experiments

### 6.1 Overall Results

The authors compare BeautifulPrompt against several baselines:

<quote>From Table 2, our method consistently outperforms the other baselines in most scores. As the CLIP score reflects the semantic consistency between the text and image, it is natural that sending the original prompts to Stable Diffusion unchanged obtains the highest score. Our method does not decrease the CLIP score to a large extent, showing that BeautifulPrompt well preserves the semantics of the original input prompts.</quote>

Human evaluation results also demonstrate the superiority of BeautifulPrompt:

<quote>As shown in Figure 4, the human evaluation experiment shows the superiority of our approach, with a win rate of over 57% against all other baselines.</quote>

### 6.2 Detailed Analysis

The document provides an ablation study on the reward modeling process:

<quote>Using rps alone can drive an increase in aesthetic score, while using raes alone does not drive an increase in PickScore. This is consistent with the finding that PickScore reflects real human preferences, incorporating various factors such as image aesthetics, text-image matching, etc (Kirstain et al., 2023). Combining the two rewards allows for more rapid and stable growth of both metrics and makes the training process more stable.</quote>

The authors also explore the transferability of BeautifulPrompt to other TIS models:

<quote>Although Deliberate already performs well in most vanilla prompts, BeautifulPrompt is still able to make Deliberate generate more beautiful images in most cases. This shows BeautifulPrompt can also be applied to other TIS models.</quote>

## 7. Industrial Application

The document describes the integration of BeautifulPrompt into a cloud-native AI platform:

<quote>Currently, we have integrated BeautifulPrompt into a cloud-native AI platform (Platform of Artificial Intelligence, Alibaba Cloud) to assist users (especially designers and art workers) to create and edit artistic images based on a variety of Stable Diffusion-style models, together with other modules such as LoRA (Hu et al., 2021) and ControlNet (Zhang et al., 2023).</quote>

## 8. Conclusion

The authors summarize the key contributions and findings of their research:

<quote>We propose a deep generative model named BeautifulPrompt to create high-quality prompts, which can be feed to Stable Diffusion-style models to produce more beautiful images. Specifically, we collect and release a new dataset for training prompt engineering models. A Reinforcement Learning with Visual AI Feedback technique is introduced to fine-turn the LLMs based on our dataset. Extensive experimental results show that BeautifulPrompt outperforms existing methods in terms of both automatic and human evaluation.</quote>

## 9. Limitations

The document acknowledges some limitations of the BeautifulPrompt model:

<quote>Although BeautifulPrompt can generate more aesthetically pleasing images, limited by the training data, it sometimes ignores part of the information in the original prompts or generates meaningless prompts. In a few cases, the generated images can be semantically inconsistent with the original prompts, due to the auto-regressive and generative nature of language models.</quote>

## 10. Ethical Considerations

The authors address potential ethical concerns:

<quote>The techniques for training the BeautifulPrompt model presented in this work are fully methodological. Hence, there are no direct negative social impacts of our method. As for the model, to ensure that the generated contents are suitable for public release, we have also filtered out NSFW prompts from our training data. However, since the generative process is difficult to control, it is possible (although not likely) for our model to create toxic contents. We suggest that in our case, BeautifulPrompt should not be used to generate offensive or inappropriate images for people intentionally. Users should carefully deal with the potential risks for online deployment.</quote>

## 11. Glossary

<definition>Text-to-Image Synthesis (TIS)</definition>: A multi-modal task of generating images conditioned on texts.

<definition>Generative Adversarial Network (GAN)</definition>: A class of machine learning frameworks designed by Ian Goodfellow and his colleagues in 2014.

<definition>Diffusion models</definition>: A class of generative models that have achieved remarkable results in text-to-image synthesis.

<definition>CLIP score</definition>: A metric that measures the similarity between generated images and prompts.

<definition>Aesthetic score</definition>: A metric that evaluates the aesthetic quality of individual images.

<definition>PickScore</definition>: A human preference metric for evaluating text-to-image generation models.

<definition>Prompt engineering</definition>: The process of creating effective prompts for AI models, particularly in the context of text-to-image synthesis.

<definition>Reinforcement Learning with Visual AI Feedback (RLVAIF)</definition>: A technique introduced in this paper that incorporates visual feedback into the training of language models for prompt generation.

<definition>Proximal Policy Optimization (PPO)</definition>: A reinforcement learning algorithm used in the final stage of training the BeautifulPrompt model.

## 12. References and Further Reading

1. Goodfellow, I., Pouget-Abadie, J., Mirza, M., Xu, B., Warde-Farley, D., Ozair, S., Courville, A., & Bengio, Y. (2014). Generative adversarial nets. In Advances in Neural Information Processing Systems, volume 27. Curran Associates, Inc.

2. Ho, J., Jain, A., & Abbeel, P. (2020). Denoising diffusion probabilistic models. Advances in Neural Information Processing Systems, 33:6840-6851.

3. Kirstain, Y., Polyak, A., Singer, U., Matiana, S., Penna, J., & Levy, O. (2023). Pick-a-pic: An open dataset of user preferences for text-to-image generation. arXiv preprint arXiv:2305.01569.

4. Liu, B., Lin, W., Duan, Z., Wang, C., Wu, Z., Zipeng, Z., Jia, K., Jin, L., Chen, C., & Huang, J. (2023). Rapid diffusion: Building domain-specific text-to-image synthesizers with fast inference speed. In Proceedings of the The 61st Annual Meeting of the Association for Computational Linguistics: Industry Track, pages 295-304. Association for Computational Linguistics.

5. Liu, V., & Chilton, L. B. (2022). Design guidelines for prompt engineering text-to-image generative models. In Proceedings of the 2022 CHI Conference on Human Factors in Computing Systems, pages 1-23.

6. Oppenlaender, J. (2022). A taxonomy of prompt modifiers for text-to-image generation. arXiv preprint arXiv:2204.13988.

7. Ramesh, A., Dhariwal, P., Nichol, A., Chu, C., & Chen, M. (2022). Hierarchical text-conditional image generation with clip latents. arXiv preprint arXiv:2204.06125.

8. Rombach, R., Blattmann, A., Lorenz, D., Esser, P., & Ommer, B. (2022). High-resolution image synthesis with latent diffusion models. In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition, pages 10684-10695.

9. Saharia, C., Chan, W., Saxena, S., Li, L., Whang, J., Denton, E. L., Ghasemipour, K., Lopes, R. G., Ayan, B. K., Salimans, T., et al. (2022). Photorealistic text-to-image diffusion models with deep language understanding. Advances in Neural Information Processing Systems, 35:36479-36494.

10. Schulman, J., Wolski, F., Dhariwal, P., Radford, A., & Klimov, O. (2017). Proximal policy optimization algorithms. arXiv preprint arXiv:1707.06347.

11. Wang, Z. J., Montoya, E., Munechika, D., Yang, H., Hoover, B., & Chau, D. H. (2022b). DiffusionDB: A large-scale prompt gallery dataset for text-to-image generative models. arXiv preprint arXiv:2210.14896.

12. Zhang, L., Rao, A., & Agrawala, M. (2023). Adding conditional control to text-to-image diffusion models. In Proceedings of the IEEE/CVF International Conference on Computer Vision, pages 3836-3847.
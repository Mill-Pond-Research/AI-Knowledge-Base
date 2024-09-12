# PromptMagician: Interactive Prompt Engineering for Text-to-Image Creation

## Table of Contents

1. Introduction
2. Related Work
   2.1 Prompt Engineering
   2.2 Visual Exploration of Image Collections
   2.3 Text-to-Image Generation
3. Overview
   3.1 Background
   3.2 Design Requirements
   3.3 System Overview
4. Prompt Recommendation
   4.1 Image Retrieval
   4.2 Image Embedding
   4.3 Hierarchical Clustering
   4.4 Prompt Keyword Mining
   4.5 Prompt-Cluster Matching
5. System Design
   5.1 User Interface
   5.2 Multi-Level Image-Prompt Visualization
   5.3 Image Evaluation
6. Usage Scenarios
   6.1 Scenario 1: Prompting for the Desired Image Style
   6.2 Scenario 2: Prompting for Open-Ended Creation
7. User Study
   7.1 Participants
   7.2 Baseline Systems
   7.3 Procedure and Tasks
   7.4 Results Analysis
   7.5 Notable Observations
8. Discussion
   8.1 Design Implications
   8.2 System Generalizability
   8.3 Limitations and Future Work
9. Conclusion

## 1. Introduction

<introduction>
Generative text-to-image models have gained great popularity among the public for their powerful capability to generate high-quality images based on natural language prompts. However, developing effective prompts for desired images can be challenging due to the complexity and ambiguity of natural language. This research proposes PromptMagician, a visual analysis system that helps users explore the image results and refine the input prompts.
</introduction>

The backbone of PromptMagician is a prompt recommendation model that takes user prompts as input, retrieves similar prompt-image pairs from DiffusionDB, and identifies special (important and relevant) prompt keywords. To facilitate interactive prompt refinement, PromptMagician introduces a multi-level visualization for the cross-modal embedding of the retrieved images and recommended keywords, and supports users in specifying multiple criteria for personalized exploration.

<significance>
Two usage scenarios, a user study, and expert interviews demonstrate the effectiveness and usability of our system, suggesting it facilitates prompt engineering and improves the creativity support of the generative text-to-image model.
</significance>

## 2. Related Work

### 2.1 Prompt Engineering

Prompt engineering has become a promising paradigm for interacting with models. With this paradigm, users can focus on designing and refining the prompt input to improve the performance of the pre-trained model in specific application scenarios, directly utilizing the knowledge and capability of the pre-trained model without the additional training process.

<quote>
"Previous studies have focused on automatic approaches for prompt formulation and refinement. AutoPrompt [46] applied gradient-guided search in the collection of trigger tokens to automatically create prompts for masked language models. Gao et al. [14] employed the generative T5 model to generate the prompt templates and pruned brute-force search for label word selection."
</quote>

To facilitate human-AI collaboration in prompt engineering, interactive and visual systems were proposed:

<quote>
"PromptIDE [51] provides interactive visualizations to help users evaluate the performance of prompts on a small dataset and iteratively refine prompts. For complex tasks that require multi-step operations, PromptChainer [61] allows users to interactively construct chains of prompts for the corresponding targeted sub-tasks, increasing the transparency and controllability of large language models."
</quote>

### 2.2 Visual Exploration of Image Collections

Prior studies have proposed many techniques for image exploration at scale, such as tree-based visualizations, enhanced scatter plots, and node-link graphs. One major challenge is the summary and exploration of the complex semantics associated with images.

<quote>
"Semantic Image Browser [65] annotates semantic content in images and uses a Multi-Dimensional-Scaling-based image layout that aggregates semantically similar images together. Similarly, Xie et al. [64] produced semantic image descriptions using image captioning techniques. Then, they utilized a co-embedding model to project images and their semantic descriptions into the same 2D space and employed a galaxy metaphor to provide a semantic overview of image collections."
</quote>

### 2.3 Text-to-Image Generation

Text-to-image generation refers to translating natural language descriptions (e.g., words and sentences) into realistic images. Recent breakthroughs in computer vision (CV) and natural language processing (NLP) techniques have greatly improved text-to-image generation quality.

<quote>
"Modern text-to-image models typically utilize an encoder-decoder architecture, where encoders learn the contextual representations of input text, and decoders use the learned information to generate corresponding images. Particularly, text encoders are usually pre-trained language models (e.g., GPT [3] and BERT [10]), and to-image decoders generally use GAN-based and Diffusion-based models."
</quote>

Stable Diffusion, one of the state-of-the-art diffusion models, achieves high performance while consuming fewer computational resources:

<quote>
"By compressing the images from pixel space into latent space, Stable Diffusion preserves the semantic information while removing the image details, resulting in a simplified representation space and a faster generation process."
</quote>

## 3. Overview

### 3.1 Background

#### Stable Diffusion

<definition>
Stable Diffusion is a state-of-the-art diffusion model for text-to-image generation. It achieves high performance while consuming fewer computational resources by compressing images from pixel space into latent space, preserving semantic information while removing image details.
</definition>

The importance of the text prompt guidance is controlled by the hyper-parameter guidance scale:

<quote>
"A larger guidance scale brings better alignments between the generated images and the prompts with the sacrifice of image diversity."
</quote>

#### DiffusionDB

<definition>
DiffusionDB is the first large-scale dataset that comprises 14 million input-output data pairs (i.e., text prompts and hyper-parameters input by users and their corresponding model-generated images).
</definition>

<quote>
"DiffusionDB anonymizes image creators to protect user privacy and excludes harmful or NSFW (not safe for work) images. Since some users may use the same text prompt for several attempts with different hyper-parameters (e.g., random seeds and guidance scales), the 14 million data items contain 1.8 million unique text prompts."
</quote>

### 3.2 Design Requirements

Based on interviews with 9 ordinary users interested in text-to-image creation, the following design requirements were identified:

<list>
R1. Generate a collection of image results for the user prompt.
R1.1. Generate multiple image results with varying hyper-parameter values.
R1.2. Provide similar image work to inspire prompt refinement.
R2. Provide a visual summary for image collection.
R3. Support efficient image evaluation from different aspects.
R4. Support iterative refinement of prompt and model hyper-parameters.
</list>

### 3.3 System Overview

The workflow of PromptMagician consists of four major components:

1. User input of prompts and model hyper-parameters
2. Image generation using Stable Diffusion
3. Prompt recommendation model
4. Visualization of image results and prompt keywords

<quote>
"The system supports user input of prompts and model hyper-parameters (R1), including the range of guidance scale and the number of generations (for different random seeds). Then the system generates a collection of images using prompts and hyper-parameters (R1.1). To help users improve the prompts, the system introduces a prompt recommendation model that retrieves similar creation results from DiffusionDB (R1.2) and identifies the related prompt keywords from the corresponding prompts."
</quote>

## 4. Prompt Recommendation

The prompt recommendation model mines special and relevant prompt keywords from similar image creations. The model pipeline consists of five steps:

### 4.1 Image Retrieval

<quote>
"To retrieve similar images that match the user prompts, both images and their original prompts in the DiffusionDB dataset [58] can be used as a search space. However, due to the nature of text-to-image generative models [23], many cases in the DiffusionDB contain significantly different images generated by the same or very similar prompts [58]. Using the image features as the search space can better distinguish their differences and return more similar results."
</quote>

The system utilizes the CLIP model to align user prompts with the image space:

<quote>
"Pre-trained on a vast dataset with 400 million text-image pairs, the CLIP model has aligned the feature vectors of the text and image in each pair. We use cosine distance to measure the feature similarity of user prompts and images."
</quote>

### 4.2 Image Embedding

For the retrieved results, both the images and their prompts are used for embedding to better capture the semantic features of the images:

<quote>
"We employ the CLIP model to encode both the images and prompts into 512-dimensional vectors. Then, the text and image features are concatenated together as 512+512=1024 dimensional vectors, which serve as the final representation of the images."
</quote>

The t-SNE algorithm is used for feature dimension reduction to enable user exploration of images according to their semantic similarity.

### 4.3 Hierarchical Clustering

Hierarchical clustering is used to organize the images and aggregate common characteristics:

<quote>
"Each image (leaf nodes in the tree) is initialized as its own cluster and progressively merged with the neighboring nodes into a larger cluster (non-leaf nodes in the tree). The clustering process is bottom-up and ends when all the image nodes are merged into one tree."
</quote>

Constraints are applied to limit the volume of clusters based on the number and position range of child nodes.

### 4.4 Prompt Keyword Mining

The system focuses on recommending prompt keywords to help users refine the original prompt input:

<quote>
"For each cluster, we aim to identify special keywords from the prompts of the image clusters. By 'special,' we mean that these keywords are significantly more crucial for the current cluster than for others."
</quote>

The importance of each keyword for the current cluster is measured using cluster-level TF-IDF values:

<code>
tfidf_i,x = tf_i,x × idf_i
</code>

Where tf_i,x is the term frequency of the given keyword t_i in the current cluster c_x, and idf_i is the inverse document frequency of this keyword.

### 4.5 Prompt-Cluster Matching

To better illustrate the effect of the keywords, they are matched to their most related cluster node:

<quote>
"We normalize the importance values of keywords within the same cluster and select the cluster with the highest TF-IDF value for the given keyword t_i as its best cluster cb_t_i."
</quote>

## 5. System Design

### 5.1 User Interface

The user interface of PromptMagician encompasses four views:

1. Model Input View
2. Image Browser View
3. Image Evaluation View
4. Local Exploration View

<quote>
"The Model Input View (Figure 1A) allows users to input the text prompt and customize the model hyper-parameters. The Image Browser View (Figure 1B) visualizes the image collection, including model-generated and retrieved images as well as the recommended prompt keywords. The Image Evaluation View (Figure 1C) empowers users to establish aesthetic criteria for assessing and filtering out irrelevant images. Users can navigate through the Image Browser View and select specific images for further examination in Local Exploration View (Figure 1D)."
</quote>

### 5.2 Multi-Level Image-Prompt Visualization

To minimize visual clutter and support semantic zoom, PromptMagician employs a hierarchical structure of image clusters to construct multi-level visualization of images:

<quote>
"For the image clusters, we choose the images closest to the cluster center as the representative images and present them at the overview level. For the prompt keywords mapped to the image clusters, we position them near the images whose prompts contain the keywords."
</quote>

The positions of the keywords are calculated by the weighted average of their image positions.

### 5.3 Image Evaluation

Image evaluation allows users to specify criteria for images from both objective aspects and subjective aspects:

<quote>
"Inspired by prior work [53], we use CLIP model [41] to capture the relationship between text and visual perception. We use pairs of opposing texts related to human perception (e.g., real and abstract) to fill in the pre-defined template for image evaluation (i.e., [text] image)."
</quote>

The system calculates the feature cosine similarity of each image with the two texts and computes the image rating between the pair of keywords on a scale of [0, 1] using Softmax.

## 6. Usage Scenarios

### 6.1 Scenario 1: Prompting for the Desired Image Style

This scenario demonstrates how PromptMagician helps a user improve her text prompt and adjust the model hyper-parameters to achieve the desired image result with the target image style.

<quote>
"The user desires to create an anime-style work featuring her cat. She provides the initial prompt 'a cat on a table under a tree in the style of Japanese anime.' in Model Input View (Figure 4 A1). Being unfamiliar with the model hyper-parameters, she sets the guidance scale range from 5 to 30 and requires the system to generate 100 images at a time."
</quote>

Through the process of exploring similar images, evaluating results, and refining the prompt based on recommended keywords, the user eventually achieves the desired outcome:

<quote>
"As a result, the system generates a collection of images in the style of the Totoro movie (Figure 4 C2). Finally, the user selects a favorite image as the outcome of this creation process."
</quote>

### 6.2 Scenario 2: Prompting for Open-Ended Creation

This scenario exemplifies how PromptMagician inspires a user with a broad creative goal and guides him in gradually clarifying the subjects of the images and improving the quality of the generated results.

<quote>
"In this scenario, the user begins with the broad creative goal of illustrating a picture of a future world. He inputs the prompt 'a man from the real world comes into the world in a science fiction film' to leverage the imaginative capabilities of the generative model (Figure 5A)."
</quote>

Through iterative exploration, prompt refinement, and image evaluation, the user progressively improves the generated results:

<quote>
"Upon examining some detailed robot images, the user identifies a set of prompt keywords and phrases, such as '8k,' 'highly detailed,' and 'unreal engine.' He adds these keywords and phrases to his prompt (Figure 5E). This time, the results returned contain more images with high details and textures, from which the user selects an image as the final creation outcome."
</quote>

## 7. User Study

### 7.1 Participants

<quote>
"We recruited 12 participants (P1-P12, four females and eight males, aged 24-32) from a local university through an internal school forum. The participants are mainly undergraduate and master's students from various disciplines, including industrial design, digital media, computer science, and literature. They had more or less experience with text-to-image generation tools but lacked sufficient knowledge about the generative models and how best to use them."
</quote>

### 7.2 Baseline Systems

Two baseline systems were designed for comparative study:

1. Baseline A: Provides similar image retrieval without prompt keyword recommendation
2. Baseline B: Presents only model-generated images and introduces Promptist, an automatic prompting method

### 7.3 Procedure and Tasks

The user study consisted of four main stages:

1. Introduction (15 min)
2. Target replication training (15 min)
3. Open-ended creation (60 min)
4. Semi-structured interview (30 min)

### 7.4 Results Analysis

The results of the user study were analyzed based on the following aspects:

1. Effectiveness of the Prompting Model
2. Effectiveness of the Visual System
3. Usability
4. Creativity Support Comparison

Key findings include:

<quote>
"Most of the participants thought the recommended keywords were meaningful and easy to understand (Q1). P3 commented, 'I can easily understand which parts of the prompts I can improve with the keywords.'"
</quote>

<quote>
"The Image Browser View was appreciated by the participants for image exploration (Q4). The semantic-based visualization 'effectively grouped similar images together' (P3) and facilitated users to 'batch select images for detailed comparison' (P7)."
</quote>

<quote>
"All the participants agreed that our system was easy to learn (Q8) and easy to use (Q9). The participants thought that the workflow of our system was intuitive and the interface was user-friendly."
</quote>

### 7.5 Notable Observations

Three prominent patterns in the way users craft their prompts were observed:

1. Starting with basic sentences and progressively enhancing image details
2. Summarizing suggestions when detailed descriptions fail
3. Selective replacement of certain keywords

## 8. Discussion

### 8.1 Design Implications

The study revealed several important design implications:

1. Ideating with text-to-image creation
2. Balancing between the brevity and effectiveness of prompts
3. Incorporating aesthetic aspects into machine evaluation
4. Tracking the iterative creation process
5. Fine-tuning with multimodal interactions

### 8.2 System Generalizability

PromptMagician can be generalized to various applications:

<quote>
"Besides facilitating prompt engineering for text-to-image generation, our system can be generalized to various applications, such as content moderation and model analysis. For content moderation, our system can help examine and mitigate the potential misuse of text-to-image models. The prompt keyword recommendation and Local Explanation View empower content reviewers to effectively identify and scrutinize harmful content prompted by specific groups of words and limit the usage of such prompts."
</quote>

### 8.3 Limitations and Future Work

Some limitations and areas for future work include:

1. Supporting tuning of multiple hyper-parameters
2. Applying deep learning models, especially large language models, for prompt improvement
3. Integrating models like GPT-4 to facilitate human-in-the-loop prompt improvement

## 9. Conclusion

<conclusion>
PromptMagician is a visual analytic system for interactive prompt engineering in text-to-image creation. The system helps users generate and explore a collection of image results and iteratively refine the input prompt. The prompt recommendation model recommends special and related prompt keywords for user prompts, which are mined from DiffusionDB with semantic-based retrieval and hierarchical keyword extraction.
</conclusion>
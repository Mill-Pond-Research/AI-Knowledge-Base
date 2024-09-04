# Paraphrase Types Elicit Prompt Engineering Capabilities: A Comprehensive Knowledge Base

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
4. Data and Models
5. Experiments
   5.1 Sensitivity to Paraphrase Perturbations
   5.2 Linguistic Changes Affecting Models
   5.3 Other Influencing Factors
   5.4 Evolution Across Models and Tasks
6. Results and Discussion
7. Conclusion
8. Limitations
9. Terminology and Definitions
10. References and Further Reading

## 1. Document Overview

This knowledge base entry is based on the research paper titled "Paraphrase Types Elicit Prompt Engineering Capabilities" by Jan Philip Wahle, Terry Ruas, Yang Xu, and Bela Gipp. The paper presents a systematic and empirical evaluation of how variations in the linguistic expression of prompts affect large language models (LLMs). It explores the impact of different paraphrase types on model performance across various tasks and models, providing insights into prompt engineering and the robustness of LLMs to linguistic variations.

## 2. Introduction

The introduction sets the stage for the research, emphasizing the importance of prompt engineering in the success of modern language models. The authors highlight the gap in understanding how variations in linguistic expression affect these models.

<quote>Much of the success of modern language models depends on finding a suitable prompt to instruct the model. Until now, it has been largely unknown how variations in the linguistic expression of prompts affect these models.</quote>

Key points from the introduction:

- The study systematically evaluates linguistic features that influence models through paraphrase types.
- The research covers five models across 120 tasks and six families of paraphrases.
- The authors control for other prompt engineering factors such as prompt length, lexical diversity, and proximity to training data.
- Results show potential for language models to improve tasks when prompts are adapted in specific paraphrase types.

<quote>Our results show a potential for language models to improve tasks when their prompts are adapted in specific paraphrase types (e.g., 6.7% median gain in Mixtral 8x7B; 5.5% in LLaMA 3 8B; cf. Figure 1).</quote>

## 3. Related Work

The paper discusses several areas of related work in prompt engineering and language model evaluation:

1. Prompt-based learning
   - Advantages over traditional supervised learning
   - Early prompt tuning methods using trainable continuous prompt embeddings
   - Discrete prompts and cloze-style phrases for few-shot learning

2. Automatic prompt generation and optimization
   - AutoPrompt and Automatic Prompt Engineer
   - Self-Instruct and other minimal human intervention approaches

3. Linguistic features in prompts
   - Studies on the influence of linguistic features on LLM performance
   - Optimization of prompt selection using unified scoring frameworks

The authors position their work as addressing a gap in the systematic evaluation of linguistic variations in prompts:

<quote>Our work contributes to previous work in several key aspects. While previous studies have explored hand-crafted linguistic features on LLM performance (Leidinger et al., 2023; Lu et al., 2023), we take a systematic approach by decomposing paraphrases into a set of six families of changes (i.e., syntax, lexicon, lexico-syntax, morphological, semantic, and others).</quote>

## 4. Data and Models

### Dataset

The study uses the SuperNaturalInstructions dataset, which contains over 1,600 tasks with their respective prompts. The authors sampled 120 different tasks from 24 task families, with the following conditions:

- Task family must have at least 10 tasks
- Primary language is English
- Each task has 200 examples

### Models

Five models were chosen based on the LMSYS chatbot arena leaderboard as of May 1, 2024:

1. LLaMA 3 Instruct (70B)
2. Command R+ (104B)
3. Mixtral 8x7B Instruct (47B)
4. LLaMA 3 Instruct (8B)
5. Gemma Instruct (7B)

Model settings:
- Temperature: 0.2
- Top p (probability mass to sample words): 0.9
- Penalty for repeatedly sampling the same sequence of tokens: 0.1
- Maximum number of tokens generated: Average of human references for that task

Hardware and Computational Resources:
<quote>We use 40 NVIDIA A100 GPUs (40GB) with 16-bit precision (8 A100s for each model). Our experiments required a total computational budget of approximately 2880 A100 GPU hours, resulting in 311kg of CO2 equivalent.</quote>

## 5. Experiments

The experiments in this study are designed to answer four key questions:

1. How sensitive are the models to specific paraphrase perturbations of the prompt?
2. Which linguistic changes in the prompt affect models the most?
3. What other factors play a role, such as the length and lexical diversity of the prompt or proximity to the training data?
4. How does the above evolve across models and tasks?

### 5.1 Sensitivity to Paraphrase Perturbations

Methodology:
1. Start with a seed prompt designed for a specific task.
2. Paraphrase each prompt with one of 26 linguistic changes using a fine-tuned model.
3. Test each model's few-shot settings for the original prompt and its 26 paraphrases.

Results:
<quote>As Figure 1 already revealed, we can observe marked changes when adjusting prompts. Command R+ experiences up to 6.3% median performance gain, and Gemma 7B up to 13.4%.</quote>

### 5.2 Linguistic Changes Affecting Models

The study decomposed the results into different paraphrase types:

<quote>Lexicon changes (+1.26%), closely followed by syntax changes (+1.19%), account for the largest median performance gain. The potential loss is comparable across changes. Overall, paraphrases had more upside than downside potential (+1.16% vs. -0.87% median change).</quote>

Examples of effective changes:
- Morphology: Changing modal verbs helps LLMs follow instructions more clearly.
- Lexicon: More specific vocabulary benefits task prompts.

### 5.3 Other Influencing Factors

The study investigated several other factors that could influence model performance:

1. Prompt complexity
   - Measured using absolute token deviation, word position deviation, and lexical deviation
   - Results showed no significant correlation between changes in prompt complexity and task performance

2. Proximity to training data
   - Used the FineWeb corpus with 350 billion tokens to search for examples close to paraphrased prompts
   - Computed similarity using ROUGE-L scores
   - Found that successful paraphrased prompts with high downstream task performance do not necessarily show higher similarity to training data

3. Lexical richness of model responses
   - Measured using Root Type-Token Ratio (RTTR), Maas, Moving Average Type-Token Ratio (MATTR), and Measure of Lexical Diversity (MTLD)
   - Analyzed responses in generative tasks such as summarization, question generation, question rewriting, and dialogue generation

4. Temperature variations
   - Tested 11 temperature variations from zero to one for selected tasks and paraphrase types
   - Analyzed the performance difference between original and paraphrased prompts at different temperatures

### 5.4 Evolution Across Models and Tasks

The study compared the performance of different models, particularly focusing on the differences between smaller and larger models:

<quote>Note how the smaller 8B version of LLaMA 3 can gain up to 5.5% median task performance, while the larger 70B model can gain much less with up to 2.8%. LLaMA 3 8B has a lower baseline performance of 0.58, while the 70B model's baseline is at 0.65.</quote>

The researchers also analyzed how different paraphrase types affected various task families, such as text completion, question answering, and sentiment analysis.

## 6. Results and Discussion

Key findings from the experiments:

1. Paraphrase types can significantly improve model performance:
   <quote>We can observe marked changes when adjusting prompts. Command R+ experiences up to 6.3% median performance gain, and Gemma 7B up to 13.4%.</quote>

2. Lexicon and syntax changes have the most impact:
   <quote>Lexicon changes (+1.26%), closely followed by syntax changes (+1.19%), account for the largest median performance gain.</quote>

3. Smaller models show more sensitivity to paraphrase changes:
   <quote>Smaller models are more sensitive and have the highest possible gain potential when adjusting prompts (e.g., Gemma 7B: +10.2% gain through lexicon; LLaMA 8B +8.2% gain through morphology).</quote>

4. Task-specific improvements:
   <quote>Title generation (+6.01%), text completion (+5.86%), and question answering (+5.60%) gain the most performance while having a low potential for a negative impact.</quote>

5. Prompt complexity and training data proximity:
   - No significant correlation found between prompt complexity and task performance
   - Successful paraphrased prompts do not necessarily show higher similarity to training data

6. Lexical richness in model responses:
   - Summarization and question rewriting tasks showed high lexical diversity
   - Generative tasks like question generation and dialogue generation yielded lower lexical diversity scores

7. Temperature effects:
   <quote>While we cannot fully exclude that randomness might improve results (i.e., there are some hills even in the high temperature ranges), most of the gains stem from low temperatures, suggesting that significant performance gains are due to paraphrase types.</quote>

## 7. Conclusion

The study provides several important insights into prompt engineering and the behavior of large language models:

1. Paraphrasing prompts can significantly improve the performance of language models across various tasks.

2. Specific linguistic types of paraphrases (e.g., lexicon changes) are more effective in improving task performance.

3. Smaller models show more sensitivity to paraphrase changes and have higher potential for improvement through prompt engineering.

4. The effectiveness of paraphrase types varies across different tasks and models, suggesting the need for task-specific prompt engineering strategies.

5. Prompt complexity and similarity to training data do not significantly correlate with performance improvements, indicating that the linguistic nature of the changes is more important.

The authors conclude:

<quote>Current model performance represents a lower performance bound for tasks as we showed that semantically identical instructions hold marked upside gain. While it is not entirely clear why language models are often sensitive to changes in instruction, we have systematically tested different lexical features and found that some have a larger positive impact (e.g., morphology) than others (e.g., syntax), depending on the tasks.</quote>

They also suggest future directions:

<quote>Since humans understand tasks presented in different ways and are robust to small (or even complex) changes in instruction, language models should have a similarly robust interface to communication in the future. We have contributed to this development of robust language interfaces by showing how specific types can benefit or harm models over a large set of tasks and prompts.</quote>

## 8. Limitations

The authors acknowledge several limitations of their study:

1. Inconsistency across models and tasks:
   <quote>Our results show that the same paraphrase changes can potentially improve results for one model but harm another. The same is true for different changes in the same task.</quote>

2. Accuracy of paraphrase generation:
   <quote>Variance across examples and models does play a role here but another possible reason is that models trained to generate paraphrase types only have a certain accuracy, leading to models sometimes confusing one type for another or generating an incorrect type.</quote>

3. Incomplete set of paraphrase types:
   <quote>Our selection of paraphrase types is not a complete set of all flexibility in linguistic expression. There may be other variations, especially extremes, that we have not considered.</quote>

4. Lack of consistent improvement across tasks:
   <quote>We also find that there is no single paraphrase type that improves a model's accuracy across tasks consistently. This is somewhat to be expected, as different tasks may benefit from different adaptations even though the overall domain is the same.</quote>

5. Difficulty in selecting the best paraphrase:
   <quote>Finding the most successful type of change in a given setting is non-trivial, and more research needs to be done on successfully perturbed prompts for new and unseen tasks.</quote>

## 9. Terminology and Definitions

<definition>Paraphrase Types</definition>: Different linguistic changes at particular positions in a text, used to create variations of prompts.

<definition>Prompt Engineering</definition>: The process of designing and optimizing prompts to improve the performance of language models on specific tasks.

<definition>Large Language Models (LLMs)</definition>: Advanced AI models trained on vast amounts of text data, capable of generating human-like text and performing various language tasks.

<definition>Few-shot Learning</definition>: A machine learning paradigm where models are trained to perform tasks with only a few examples.

<definition>ROUGE-L</definition>: A metric used to evaluate the quality of generated text by comparing it to reference text, focusing on the longest common subsequence.

<definition>Lexical Diversity</definition>: A measure of the variety of words used in a text, often quantified using metrics such as RTTR, Maas, MATTR, and MTLD.

<definition>Temperature</definition>: A parameter in language models that controls the randomness of the generated text. Higher values lead to more diverse outputs, while lower values produce more focused and deterministic results.

## 10. References and Further Reading

The paper includes an extensive list of references. Some key works cited include:

1. Liu, P., et al. (2023a). Pre-train, prompt, and predict: A systematic survey of prompting methods in natural language processing. ACM Comput. Surv., 55(9).

2. Ouyang, L., et al. (2022). Training language models to follow instructions with human feedback. Advances in neural information processing systems, 35:27730–27744.

3. Wahle, J. P., Ruas, T., & Gipp, B. (2023). Paraphrase types for generation and detection. In Proc. of EMNLP, Singapore, Singapore. Association for Computational Linguistics.

4. Wang, Y., et al. (2022b). Super-NaturalInstructions: Generalization via declarative instructions on 1600+ NLP tasks. In Proceedings of the 2022 Conference on Empirical Methods in Natural Language Processing, pages 5085–5109.

5. Zhou, Y., et al. (2022). Large language models are human-level prompt engineers. ArXiv preprint, abs/2211.01910.
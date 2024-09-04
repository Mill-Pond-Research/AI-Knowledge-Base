# Automatic Engineering of Long Prompts: A Comprehensive Knowledge Base

## Table of Contents

1. Document Overview
2. Introduction
   2.1 Background
   2.2 Significance of the Study
3. Related Work
4. Proposed Method
   4.1 Search Space
   4.2 Search Algorithm
   4.3 History-guided Search
5. Experimental Results
   5.1 Experimental Settings
   5.2 Main Results
   5.3 Ablation Study
   5.4 Qualitative Results
6. Conclusions, Limitations, and Future Work
7. Glossary of Terms
8. References and Further Reading

## 1. Document Overview

This knowledge base entry is based on the research paper "Automatic Engineering of Long Prompts" by Cho-Jui Hsieh, Si Si, Felix X. Yu, and Inderjit S. Dhillon from Google Inc. The paper explores the challenge of automatically engineering long prompts for large language models (LLMs), a task that has become increasingly important as LLMs demonstrate remarkable capabilities in solving complex open-domain tasks guided by comprehensive instructions and demonstrations provided in prompts.

The document presents a novel approach to automatic long prompt engineering, addressing the limitations of existing methods that focus on short prompts. The authors investigate the performance of greedy algorithms and genetic algorithms for this task and introduce two new techniques that utilize search history to enhance the effectiveness of LLM-based mutation in their search algorithm.

This knowledge base entry will provide a detailed exploration of the methodology, experimental results, and implications of this research, offering valuable insights for AI researchers, developers, and practitioners working with large language models and prompt engineering.

## 2. Introduction

### 2.1 Background

Large language models (LLMs) have demonstrated remarkable capabilities in solving complex open-domain tasks when guided by comprehensive instructions and demonstrations provided in the form of prompts. However, these prompts can be lengthy, often comprising hundreds of lines and thousands of tokens, and their design often requires considerable human effort.

The authors note:

> "Recent research has explored automatic prompt engineering for short prompts, typically consisting of one or a few sentences. However, the automatic design of long prompts remains a challenging problem due to its immense search space."

This research addresses the gap in automatic engineering of long prompts, which is crucial for fully harnessing the capabilities of LLMs.

### 2.2 Significance of the Study

The significance of this study lies in its exploration of automatic long prompt engineering, a previously understudied area. The authors demonstrate that their proposed method can achieve substantial performance improvements on complex tasks:

> "Our results show that the proposed automatic long prompt engineering algorithm achieves an average of 9.2% accuracy gain on eight tasks in Big Bench Hard, highlighting the significance of automating prompt designs to fully harness the capabilities of LLMs."

This improvement indicates the potential for automated methods to enhance the performance of LLMs on challenging tasks, reducing the need for manual prompt engineering and potentially unlocking new capabilities of these models.

## 3. Related Work

The paper builds upon and extends several areas of prior research:

1. Prompt design principles: The authors reference work on incorporating complex instructions, demonstrations, and chain-of-thought reasoning into prompts to boost performance on challenging tasks.

2. Automatic prompt engineering for short prompts: The paper cites several recent studies that have explored optimizing short instructions with one or a few sentences.

3. Sensitivity of LLMs to prompts: The authors note that minor modifications to prompts can significantly impact LLM performance, highlighting the importance of careful prompt design.

4. Soft-prompt tuning: While not the focus of this paper, the authors mention this related area of research, which optimizes prompts within a continuous embedding space.

## 4. Proposed Method

The authors propose a novel method for automatic long prompt engineering, which consists of three main components:

### 4.1 Search Space

The search space is defined as the set of prompts that are semantically similar to the original prompt while potentially achieving enhanced performance. The authors describe their approach:

> "We decompose the long prompt into m individual sentences: p = [s(1), s(2), ..., s(m)]. We then allow each sentence to be rephrased while preserving its semantic meaning."

To generate alternative formulations for each sentence, the authors employ an LLM-Mutator, which uses prompts like "Generate a variation of the following instruction while keeping the semantic meaning."

### 4.2 Search Algorithm

The authors propose a greedy algorithm with beam search for conducting the search using the LLM-Mutator. They explain:

> "At each iteration, we randomly select one of these k prompts and refine the chosen prompt. We then evaluate this new candidate and maintain the top-k prompt pool."

This approach ensures that even with the introduction of detrimental edits, recovery from such errors is still possible as multiple top-performing prompts are retained.

The authors compare their method to genetic algorithms (GA) and note:

> "While GA possesses a high exploration capability, its convergence rate is considerably slower during the initial stages."

### 4.3 History-guided Search

To improve the efficiency of the search, the authors introduce two novel techniques that utilize search history:

1. Guided mutation for a single sentence: This technique uses the search history to guide the mutation towards more positive rewards. The authors explain:

> "We propose to let the LLM-Mutator in-context learn from the history. This can be done by listing history in the prompt: if rt > 0, we include an in-context example sbefore_t ⇒ safter_t, and if rt < 0 we include safter_t ⇒ sbefore_t."

2. Guided sampling for sentence selection: This technique models sentence selection as a contextual bandit problem. The authors describe:

> "We then adopt the Lin-UCB algorithm, a widely recognized algorithm for contextual bandit problems, to guide sentence selection."

These techniques aim to enhance the effectiveness of the search by leveraging information from previous iterations.

## 5. Experimental Results

### 5.1 Experimental Settings

The authors evaluated their method on the Big-Bench Hard (BBH) benchmark, which consists of challenging tasks with long prompts. They used the following settings:

- Model: text-bison model for evaluation, instruction-tuned PaLM 2-L model as the LLM mutator
- Dataset: 250 samples per task, randomly divided into 50% for training and 50% for testing
- Evaluation metric: Accuracy on training data, test data, and the combined dataset
- Computational budget: Limited to 50 evaluations on the training set

### 5.2 Main Results

The proposed method significantly outperformed baseline approaches:

> "Across all 8 tasks, our algorithm achieves an average of 8.2% gain in test accuracy and 9.2% gain in the accuracy of full evaluation set (train + test)."

The authors provide a detailed table of results, showing improvements across various tasks in the BBH benchmark. They note:

> "Among these tasks, we achieve the largest performance gain (18.45%) on the logical deduction task, and the smallest gain (2.45%) on reasoning about colored objects (Color Reasoning)."

### 5.3 Ablation Study

The authors conducted an ablation study to analyze the effectiveness of the two components introduced in their method: history-guided mutation and contextual bandit algorithm for sentence selection. They report:

> "We can observe that both components are contributing to the final performance of the model."

This demonstrates the importance of both the history-guided mutation and the sentence selection algorithm in achieving the overall performance improvements.

### 5.4 Qualitative Results

The paper provides examples of successful prompt modifications found by their search algorithm. For instance, in the logic deduction task:

> "The initial prompt achieves 38.8% accuracy while the revised prompt found at iteration 48 improves the performance to 57.9% train accuracy and 54.0% test accuracy."

The authors observe that most changes involve minor revisions to the original sentence without altering its meaning, yet these seemingly insignificant modifications can lead to substantial improvements in LLM accuracy.

## 6. Conclusions, Limitations, and Future Work

The authors conclude that their method demonstrates significant potential for automatic long prompt engineering, achieving substantial performance improvements with limited computational resources. They state:

> "With only 50 evaluations on the training set, our method achieves an average absolute accuracy improvement of 9.2% across 8 tasks from Big Bench Hard."

However, they also identify several limitations and areas for future research:

1. Improving the correctness of the LLM-Mutator to avoid introducing errors during sentence rewriting.
2. Addressing overfitting issues through additional regularization techniques.
3. Exploring methods to manipulate multiple sentences simultaneously or consolidate multiple sentences.
4. Developing early stopping techniques to reduce the number of queries required.
5. Investigating the relationship between automatic prompt engineering and fine-tuning approaches.

The authors conclude by emphasizing the importance of this emerging area of research and its potential impact on harnessing the full capabilities of large language models.

## 7. Glossary of Terms

- <definition>Large Language Models (LLMs)</definition>: Advanced AI models trained on vast amounts of text data, capable of understanding and generating human-like text.
- <definition>Prompt Engineering</definition>: The process of designing and optimizing input prompts to elicit desired outputs from language models.
- <definition>Automatic Long Prompt Engineering</definition>: The automated process of optimizing lengthy prompts (often thousands of tokens) for improved language model performance.
- <definition>LLM-Mutator</definition>: A component in the proposed method that uses an LLM to generate alternative formulations of sentences while preserving their semantic meaning.
- <definition>Beam Search</definition>: A search algorithm that explores a graph by expanding the most promising node in a limited set.
- <definition>Contextual Bandit Problem</definition>: A type of reinforcement learning problem where an agent must learn to choose actions based on contextual information to maximize rewards.
- <definition>Lin-UCB Algorithm</definition>: A widely recognized algorithm for solving contextual bandit problems.
- <definition>Big Bench Hard (BBH)</definition>: A benchmark consisting of challenging tasks designed to evaluate the capabilities of large language models.

## 8. References and Further Reading

The paper includes an extensive list of references, which can be found at the end of the original document. Some key references include:

1. Brown, T., et al. (2020). Language models are few-shot learners. Advances in neural information processing systems, 33:1877–1901.
2. Wei, J., et al. (2022b). Chain-of-thought prompting elicits reasoning in large language models. Advances in Neural Information Processing Systems, 35:24824–24837.
3. Suzgun, M., et al. (2022). Challenging big-bench tasks and whether chain-of-thought can solve them. arXiv preprint arXiv:2210.09261.
4. Fernando, C., et al. (2023). Promptbreeder: Self-referential self-improvement via prompt evolution. arXiv preprint arXiv:2309.16797.
5. Guo, Q., et al. (2023). Connecting large language models with evolutionary algorithms yields powerful prompt optimizers. arXiv preprint arXiv:2309.08532.
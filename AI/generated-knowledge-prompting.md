# Generated Knowledge Prompting for Commonsense Reasoning: A Comprehensive Knowledge Base

## Table of Contents

1. Document Overview
2. Introduction
   2.1 Background
   2.2 Research Question
   2.3 Key Contributions
3. Generated Knowledge Prompting Method
   3.1 Knowledge Generation
   3.2 Knowledge Integration
4. Experimental Setup
   4.1 Datasets and Task Setup
   4.2 Inference Model Setup
   4.3 Knowledge Generation Baselines
5. Experimental Results
   5.1 Overall Performance
   5.2 Knowledge Generation Methods
   5.3 Analysis
6. Related Work
7. Conclusion
8. Appendix
   8.1 Comparison with Prior Methods
   8.2 Prompts for Knowledge Generation
   8.3 Human Evaluation Guidelines
9. Checklist
   9.1 Limitations and Risks
   9.2 Computation
10. References

## 1. Document Overview

This knowledge base entry is based on the research paper "Generated Knowledge Prompting for Commonsense Reasoning" by Jiacheng Liu, Alisa Liu, Ximing Lu, Sean Welleck, Peter West, Ronan Le Bras, Yejin Choi, and Hannaneh Hajishirzi. The paper presents a novel approach to improving commonsense reasoning in AI systems by leveraging generated knowledge from language models. This document summarizes the key findings, methodologies, and implications of the research, providing a comprehensive resource for understanding the concept of generated knowledge prompting and its applications in commonsense reasoning tasks.

## 2. Introduction

### 2.1 Background

Commonsense reasoning remains a challenging task for AI systems, and there is ongoing debate about the necessity of external knowledge for effective reasoning. The authors introduce this context in the opening of their paper:

<quote>It remains an open question whether incorporating external knowledge benefits commonsense reasoning while maintaining the flexibility of pretrained sequence models.</quote>

### 2.2 Research Question

The primary research question addressed in this study is whether external knowledge can be helpful for commonsense reasoning, even when using state-of-the-art pretrained models. The authors specifically focus on four recent commonsense benchmarks to investigate this question.

### 2.3 Key Contributions

The paper introduces a novel method called "Generated Knowledge Prompting" (GKP), which consists of two main steps:

1. Generating knowledge from a language model
2. Providing the generated knowledge as additional input when answering a question

Key features of this approach include:

- No requirement for task-specific supervision for knowledge integration
- No need for access to a structured knowledge base
- Improvement in performance of large-scale, state-of-the-art models on four commonsense reasoning tasks
- Achievement of state-of-the-art results on numerical commonsense (NumerSense), general commonsense (CommonsenseQA 2.0), and scientific commonsense (QASC) benchmarks

## 3. Generated Knowledge Prompting Method

### 3.1 Knowledge Generation

The knowledge generation process involves using a language model to generate question-related knowledge statements. The authors describe this process as follows:

<quote>We generate question-related knowledge statements by prompting a language model. The prompt consists of an instruction, a few demonstrations that are fixed for each task, and a new-question placeholder.</quote>

Key aspects of the knowledge generation process include:

- Use of human-written demonstrations
- Task-specific prompts
- Generation of multiple knowledge statements for each question

### 3.2 Knowledge Integration

The knowledge integration step involves using the generated knowledge to guide the inference process. The authors explain:

<quote>In the knowledge integration step, we use a language model – called the inference model – to make predictions with each generated knowledge statement, then select the highest-confidence prediction.</quote>

The integration process includes:

- Forming knowledge-augmented questions
- Computing aggregated scores for each answer choice
- Selecting the answer with the highest support from the knowledge statements

## 4. Experimental Setup

### 4.1 Datasets and Task Setup

The authors evaluate their method on four commonsense reasoning datasets:

1. NumerSense
2. CommonsenseQA (CSQA)
3. CommonsenseQA 2.0 (CSQA2)
4. QASC

Each dataset presents unique challenges and problem formats, allowing for a comprehensive evaluation of the GKP method.

### 4.2 Inference Model Setup

The authors use various inference models, including:

- Off-the-shelf T5 and GPT-3
- Finetuned models such as UnifiedQA (UQA) and Unicorn

The setup for each model is tailored to the specific task and dataset requirements.

### 4.3 Knowledge Generation Baselines

To evaluate the effectiveness of their knowledge generation method, the authors compare it with several baselines:

1. No knowledge (∅)
2. Random sentences (R)
3. Context sentences (C)
4. Template-generated knowledge (T)
5. Retrieval-based knowledge (IR)
6. Answers (A)

These baselines provide a comprehensive comparison to assess the performance of the GKP method.

## 5. Experimental Results

### 5.1 Overall Performance

The authors report significant improvements in performance across multiple datasets and inference models. Key findings include:

<quote>We apply our method on top of the same inference model used in the previous state-of-the-art. On NumerSense, we achieve a 6% (66.18 → 72.47) improvement over the previous best method based on the zero-shot T5 model. The previous state-of-the-art among non-retrieval methods on CSQA2 is based on the finetuned Unicorn model, upon which we improve by 2% (70.2 → 73.03). For QASC, the previous best is based on the finetuned UnifiedQA model, upon which we improve by 3% (76.74 → 80.33).</quote>

### 5.2 Knowledge Generation Methods

The authors compare their GKP method with various baselines and find that:

- Random sentences and context sentences provide limited or no improvement
- GKP consistently leads to substantial performance improvements
- GKP outperforms template-based knowledge generation methods
- GKP is comparable to retrieval-based knowledge in terms of downstream performance

### 5.3 Analysis

The authors conduct several analyses to understand the factors contributing to the success of their method:

1. Impact of the number of generated knowledge statements
2. Effectiveness of different knowledge integration methods
3. Performance with lightweight inference models
4. Effect of knowledge generation model size

They also perform a human evaluation to assess the quality of generated knowledge and its impact on task performance.

## 6. Related Work

The authors situate their work within the context of existing research on:

- Eliciting knowledge from pretrained language models
- Leveraging external knowledge for commonsense reasoning
- Adding generated text during inference

They highlight the unique aspects of their approach, such as the flexibility of knowledge generation and the ability to work with both zero-shot and finetuned models without additional training.

## 7. Conclusion

The paper concludes by emphasizing the effectiveness of generated knowledge prompting in improving commonsense reasoning performance:

<quote>We introduce generated knowledge prompting, a simple method to elicit and integrate knowledge from language models so as to improve performance on commonsense reasoning tasks. ... Our method shows effectiveness across multiple datasets, sets the new state-of-the-art on three commonsense reasoning tasks, and works under a variety of settings. The method's success highlights language models as sources of flexible, high-quality knowledge for commonsense reasoning.</quote>

## 8. Appendix

### 8.1 Comparison with Prior Methods

The authors provide a detailed comparison of their method with prior approaches, highlighting the unique aspects of GKP:

- Use of demonstrations-prompted knowledge generation
- Ability to work with both zero-shot and task-finetuned inference models
- No requirement for joint finetuning with knowledge

### 8.2 Prompts for Knowledge Generation

The paper includes full prompts used for knowledge generation on each of the evaluated tasks (NumerSense, CSQA, CSQA2, and QASC). These prompts demonstrate the task-specific nature of the knowledge generation process and provide valuable examples for replication and extension of the work.

### 8.3 Human Evaluation Guidelines

Detailed guidelines for human evaluation of generated knowledge are provided, covering aspects such as:

- Grammaticality
- Relevance
- Factuality
- Helpfulness

These guidelines offer insights into the criteria used to assess the quality and utility of the generated knowledge.

## 9. Checklist

### 9.1 Limitations and Risks

The authors acknowledge potential limitations and risks associated with their method:

<quote>Our method is tested on a representative selection of commonsense reasoning tasks and datasets. Applying this method to other tasks may require people with moderate expertise to craft a task-specific prompt to feed into the method.</quote>

They also note the potential risk of lowered performance if the method is not implemented properly or if badly-designed prompts are used.

### 9.2 Computation

The authors provide details on the computational resources used for their experiments:

<quote>Inference is conducted on Quadro RTX 8000 GPUs and costs about 200 GPU hours in total. Knowledge generation is done with the OpenAI GPT-3 API, with an approximate cost of $500.</quote>

This information is valuable for researchers looking to replicate or build upon this work.

In conclusion, this knowledge base entry provides a detailed overview of the Generated Knowledge Prompting method for commonsense reasoning, its implementation, experimental results, and implications for future research in AI and natural language processing. The method's success in improving performance across multiple benchmarks highlights the potential of leveraging language models as flexible sources of knowledge for enhancing AI systems' commonsense reasoning capabilities.
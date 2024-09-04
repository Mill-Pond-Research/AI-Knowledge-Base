# Finetuned Language Models are Zero-Shot Learners: A Comprehensive Knowledge Base

## Table of Contents

1. Introduction
2. Background and Motivation
3. FLAN: Instruction Tuning for Zero-Shot Learning
   3.1 Tasks and Templates
   3.2 Evaluation Splits
   3.3 Classification with Options
   3.4 Training Details
4. Results
   4.1 Natural Language Inference
   4.2 Reading Comprehension
   4.3 Closed-book QA
   4.4 Translation
   4.5 Additional Tasks
5. Ablation Studies and Further Analysis
   5.1 Number of Instruction Tuning Clusters
   5.2 Scaling Laws
   5.3 Role of Instructions
   5.4 Instructions with Few-Shot Exemplars
   5.5 Instruction Tuning Facilitates Prompt Tuning
6. Related Work
7. Discussion
8. Conclusions
9. Ethical Considerations
10. Environmental Considerations
11. Author Contributions
12. Acknowledgements
13. References

## 1. Introduction

<introduction>
This knowledge base document is based on the research paper "Finetuned Language Models are Zero-Shot Learners" by Jason Wei, Maarten Bosma, Vincent Y. Zhao, Kelvin Guu, Adams Wei Yu, Brian Lester, Nan Du, Andrew M. Dai, and Quoc V. Le from Google Research. The paper explores a simple method for improving the zero-shot learning abilities of language models through instruction tuning.

The authors introduce FLAN (Finetuned LANguage models), a 137B parameter pretrained language model that is finetuned on over 60 NLP datasets described via natural language instructions. FLAN demonstrates substantial improvements in zero-shot performance on unseen tasks, outperforming zero-shot 175B GPT-3 on 20 of 25 evaluated datasets and even surpassing few-shot GPT-3 on several benchmarks.

This document serves as a comprehensive resource for understanding the methodology, results, and implications of the FLAN approach to instruction tuning for zero-shot learning in large language models.
</introduction>

## 2. Background and Motivation

<background>
The research is motivated by the observation that while large language models like GPT-3 perform well in few-shot learning scenarios, their zero-shot performance is often significantly worse. This limitation is particularly evident when models are presented with prompts that differ from the format of their pretraining data.

The authors hypothesize that NLP tasks can be effectively described using natural language instructions, such as "Is the sentiment of this movie review positive or negative?" or "Translate 'how are you' into Chinese." By leveraging this intuition, they aim to improve the zero-shot capabilities of large language models.

Key points:

1. Zero-shot learning challenges: Large language models struggle with zero-shot tasks when prompts differ from pretraining data formats.
2. Instruction-based approach: The authors propose using natural language instructions to describe NLP tasks for finetuning.
3. Expanding model capabilities: The goal is to improve zero-shot performance across a wide range of unseen tasks.

Quote from the paper:
"We leverage the intuition that NLP tasks can be described via natural language instructions, such as 'Is the sentiment of this movie review positive or negative?' or 'Translate 'how are you' into Chinese.'"
</background>

## 3. FLAN: Instruction Tuning for Zero-Shot Learning

<flan_overview>
FLAN (Finetuned LANguage models) is the result of instruction tuning a 137B parameter pretrained language model on a mixture of more than 60 NLP datasets expressed via natural language instructions. The key aspects of FLAN's development and evaluation process are outlined below.
</flan_overview>

### 3.1 Tasks and Templates

<tasks_and_templates>
The authors aggregate 62 text datasets that are publicly available on Tensorflow Datasets, covering both language understanding and language generation tasks. These datasets are categorized into twelve task clusters based on their task types.

Key points:

1. Dataset diversity: The instruction tuning dataset includes a wide range of NLP tasks.
2. Task clusters: Datasets are grouped into clusters such as natural language inference, commonsense reasoning, sentiment analysis, and more.
3. Template creation: For each dataset, ten unique templates using natural language instructions are manually composed.
4. Template diversity: Most templates describe the original task, but some "turn the task around" to increase diversity.

Quote from the paper:
"For each dataset, we manually compose ten unique templates that use natural language instructions to describe the task for that dataset."
</tasks_and_templates>

### 3.2 Evaluation Splits

<evaluation_splits>
To assess FLAN's performance on unseen tasks, the authors employ a conservative definition of what constitutes an unseen task:

1. Task cluster holdout: A dataset D is considered unseen at evaluation time if no datasets from any task clusters that D belongs to were seen during instruction tuning.
2. Multiple models: To evaluate zero-shot FLAN on c task clusters, c models are instruction-tuned, each holding out a different task cluster for evaluation.

Quote from the paper:
"Hence, to evaluate zero-shot FLAN on c task clusters, we instruction tune c models, where each model holds out a different task cluster for evaluation."
</evaluation_splits>

### 3.3 Classification with Options

<classification_with_options>
For classification tasks, the authors introduce an "options" suffix to improve the model's awareness of desired output choices:

1. Options suffix: The token "OPTIONS" is appended to the end of a classification task, along with a list of the output classes for that task.
2. Improved probability distribution: This approach addresses issues with undesired distribution of probability mass among alternative ways of expressing answers.

Quote from the paper:
"Therefore, we include an options suffix, in which we append the token OPTIONS to the end of a classification task along with a list of the output classes for that task."
</classification_with_options>

### 3.4 Training Details

<training_details>
The instruction tuning process for FLAN involves the following key aspects:

1. Base model: LaMDA-PT, a dense left-to-right, decoder-only transformer language model of 137B parameters.
2. Pretraining data: A collection of web documents, dialog data, and Wikipedia, tokenized into 2.49T BPE tokens with a 32k vocabulary.
3. Instruction tuning pipeline: Mixes all datasets and randomly samples from each dataset, limiting the number of training examples per dataset to 30k.
4. Training parameters:
   - 30k gradient steps
   - Batch size of 8,192 tokens
   - Adafactor Optimizer with a learning rate of 3e-5
   - Input and target sequence lengths of 1024 and 256, respectively
5. Training time: Approximately 60 hours on a TPUv3 with 128 cores

Quote from the paper:
"We finetune all models for 30k gradient steps with a batch size of 8,192 tokens using the Adafactor Optimizer (Shazeer & Stern, 2018) with a learning rate of 3e-5."
</training_details>

## 4. Results

<results_overview>
The authors evaluate FLAN on a wide range of NLP tasks, including natural language inference, reading comprehension, closed-book QA, translation, commonsense reasoning, coreference resolution, and struct-to-text. The results demonstrate significant improvements over baseline models and competitive performance against state-of-the-art models like GPT-3.
</results_overview>

### 4.1 Natural Language Inference

<nli_results>
FLAN shows substantial improvements on natural language inference (NLI) tasks:

1. Outperforms baselines: FLAN surpasses all baselines by a large margin on five NLI datasets.
2. Natural phrasing advantage: The authors attribute FLAN's success to phrasing NLI tasks as more natural questions, such as "Does <premise> mean that <hypothesis>?"

Quote from the paper:
"On five NLI datasets, where a model must determine whether a hypothesis is true given some premise, FLAN outperforms all baselines by a large margin."
</nli_results>

### 4.2 Reading Comprehension

<reading_comprehension_results>
FLAN demonstrates strong performance on reading comprehension tasks:

1. Outperforms baselines: FLAN shows improvements over baselines for MultiRC and OBQA.
2. Significant improvement on BoolQ: FLAN outperforms GPT-3 by a large margin on the BoolQ dataset.

Quote from the paper:
"On reading comprehension, where models are asked to answer a question about a provided passage, FLAN outperforms baselines for MultiRC (Khashabi et al., 2018) and OBQA (Mihaylov et al., 2018). On BoolQ (Clark et al., 2019a), FLAN outperforms GPT-3 by a large margin, though LaMDA-PT already achieves high performance on BoolQ."
</reading_comprehension_results>

### 4.3 Closed-book QA

<closed_book_qa_results>
FLAN shows strong performance on closed-book question answering tasks:

1. Outperforms GPT-3: FLAN surpasses GPT-3 on all four closed-book QA datasets evaluated.
2. Competitive with GLaM: Compared to GLaM, FLAN shows better performance on ARC-e and ARC-c, with slightly lower performance on NQ and TQA.

Quote from the paper:
"For closed-book QA, which asks models to answer questions about the world without access to specific information containing the answer, FLAN outperforms GPT-3 on all four datasets."
</closed_book_qa_results>

### 4.4 Translation

<translation_results>
FLAN demonstrates competitive performance on machine translation tasks:

1. Outperforms zero-shot GPT-3: FLAN surpasses zero-shot GPT-3 for all six translation evaluations.
2. Strong performance translating into English: FLAN shows particularly good results when translating into English.
3. Weaker performance translating from English: Translating from English into other languages was relatively weaker, likely due to the English-centric nature of the pretraining data and tokenizer.

Quote from the paper:
"Compared with GPT-3, FLAN outperforms zero-shot GPT-3 for all six evaluations, though it underperforms few-shot GPT-3 in most cases. Similar to GPT-3, FLAN shows strong results for translating into English and compares favorably against supervised translation baselines."
</translation_results>

### 4.5 Additional Tasks

<additional_tasks_results>
The authors report mixed results for other task categories:

1. Limited improvement on language modeling tasks: FLAN shows minimal improvement on tasks formulated as sentence completions (e.g., commonsense reasoning, coreference resolution).
2. Positive results on other tasks: FLAN generally outperforms zero-shot LaMDA-PT and is comparable with or better than few-shot LaMDA-PT on tasks such as sentiment analysis, paraphrase detection, and struct-to-text.

Quote from the paper:
"Although we see strong results for the above task clusters, one limitation with instruction tuning is that it does not improve performance for many language modeling tasks (e.g., commonsense reasoning or coreference resolution tasks formulated as sentence completions)."
</additional_tasks_results>

## 5. Ablation Studies and Further Analysis

<ablation_studies_overview>
The authors conduct several ablation studies and analyses to better understand the factors contributing to FLAN's performance and the implications of instruction tuning.
</ablation_studies_overview>

### 5.1 Number of Instruction Tuning Clusters

<instruction_tuning_clusters>
The authors examine how the number of clusters and tasks used in instruction tuning affects performance on unseen tasks:

1. Performance improvement: Average performance across held-out clusters improves as more clusters and tasks are added to instruction tuning.
2. Potential for further improvement: Performance does not appear to saturate with the seven clusters tested, suggesting that adding more clusters could lead to further improvements.

Quote from the paper:
"As expected, we observe that average performance across the three held-out clusters improves as we add additional clusters and tasks to instruction tuning (with the exception of the sentiment analysis cluster), confirming the benefits of our proposed instruction tuning approach on zero-shot performance on novel tasks."
</instruction_tuning_clusters>

### 5.2 Scaling Laws

<scaling_laws>
The authors investigate how the benefits of instruction tuning are affected by model scale:

1. Large-scale advantage: Instruction tuning substantially improves performance on held-out tasks for models on the order of 100B parameters.
2. Small-scale limitation: For 8B and smaller models, instruction tuning actually hurts performance on held-out tasks.
3. Capacity hypothesis: The authors suggest that for small-scale models, learning the instruction tuning tasks fills the entire model capacity, while larger models can both learn to follow instructions and generalize to new tasks.

Quote from the paper:
"We see that for the two models on the order of 100B parameters, instruction tuning substantially improves performance on held-out tasks, as is expected given the prior results in our paper. The behavior on held-out tasks for the 8B and smaller models, however, is thought-provoking—instruction tuning actually hurts performance on held-out tasks."
</scaling_laws>

### 5.3 Role of Instructions

<role_of_instructions>
The authors explore the importance of instructions during finetuning:

1. Crucial for performance: Training with instructions is shown to be crucial for zero-shot performance on unseen tasks.
2. Comparison of setups: The study compares different finetuning setups, including no template, dataset name only, and natural instructions (FLAN).
3. Significant performance gap: Both ablation configurations performed substantially worse than FLAN, indicating the importance of training with instructions.

Quote from the paper:
"Figure 8 shows the results—both ablation configurations performed substantially worse than FLAN, indicating that training with instructions is crucial for zero-shot performance on unseen tasks."
</role_of_instructions>

### 5.4 Instructions with Few-Shot Exemplars

<few_shot_exemplars>
The authors investigate how instruction tuning can be combined with few-shot exemplars:

1. Performance improvement: Few-shot exemplars improve performance on all task clusters compared to zero-shot FLAN.
2. Effectiveness for complex tasks: Exemplars are especially effective for tasks with large/complex output spaces, such as struct to text, translation, and closed-book QA.
3. Reduced sensitivity to prompts: The standard deviation among templates is lower for few-shot FLAN, indicating reduced sensitivity to prompt engineering.

Quote from the paper:
"As shown in Figure 9, few-shot exemplars improve the performance on all task clusters, compared with zero-shot FLAN. Exemplars are especially effective for tasks with large/complex output spaces, such as struct to text, translation, and closed-book QA, potentially because exemplars help the model better understand the output format."
</few_shot_exemplars>

### 5.5 Instruction Tuning Facilitates Prompt Tuning

<prompt_tuning_analysis>
The authors explore how instruction tuning affects the model's response to prompt tuning:

1. Improved performance: FLAN responds better to continuous inputs from prompt tuning compared to the untuned LaMDA-PT model.
2. Low-resource advantage: In many cases, especially for the low-resource setting, prompt tuning on FLAN achieves more than 10% improvement over prompt tuning on LaMDA-PT.
3. Complementary methods: This result demonstrates that instruction tuning can be combined with other prompting methods to further improve performance.

Quote from the paper:
"We see that in all scenarios, prompt tuning works better with FLAN than LaMDA-PT. In many cases, especially for the low-resource setting, prompt tuning on FLAN even achieves more than 10% improvement over prompt tuning on the LaMDA-PT."
</prompt_tuning_analysis>

## 6. Related Work

<related_work>
The authors discuss several areas of related work, including:

1. Language models and multi-task learning
2. Zero-shot learning and meta-learning
3. Prompting
4. Finetuning large language models
5. Multi-task question answering
6. Instructions-based NLP

Key points:

- Instruction tuning combines aspects of both the pretrain-finetune and prompting paradigms.
- The approach builds on previous work in multi-task learning and zero-shot generalization.
- Recent work on instruction-based NLP and few-shot learning with instructions shows promising results, albeit at smaller model scales.

Quote from the paper:
"Our work differs from these two papers in that we focus on zero-shot learning, for which we observe the crucial importance of model scale (FLAN is 1,000x larger than BART-base)."
</related_work>

## 7. Discussion

<discussion>
The authors reflect on the implications and potential of instruction tuning:

1. Generalist vs. specialist models: Instruction tuning demonstrates how labeled data can be used to help large language models perform many unseen tasks, supporting the development of generalist models.
2. Complementary to general language modeling: The positive effect of instruction tuning on cross-task generalization shows that task-specific training is complementary to general language modeling.
3. Limitations: The authors acknowledge limitations such as subjectivity in assigning tasks to clusters and the use of relatively short instructions.
4. Future work: Suggested areas for future research include gathering more task clusters, cross-lingual experiments, and using FLAN to generate data for training downstream classifiers.

Quote from the paper:
"Although one might expect labeled data to have the most natural role in improving specialist models, instruction tuning demonstrates how labeled data can be used to help large language models perform many, unseen tasks."
</discussion>

## 8. Conclusions

<conclusions>
The paper concludes with the following key points:

1. Effectiveness of instruction tuning: The simple method of instruction tuning significantly improves the zero-shot performance of large language models on unseen tasks.
2. FLAN's performance: FLAN outperforms zero-shot GPT-3 on the majority of evaluated tasks and even surpasses few-shot GPT-3 on several benchmarks.
3. Scalability: Performance improvements from instruction tuning emerge only with sufficient model scale.
4. Complementary methods: Instruction tuning can be combined with other prompting methods such as few-shot prompting and prompt tuning.
5. Future research: The authors hope their work will spur further research on instructions-based NLP, zero-shot learning, and using labeled data to improve large language models.

Quote from the paper:
"We hope that our paper will spur further research on instructions-based NLP, zero-shot learning, and using labeled data to improve large language models."
</conclusions>

## 9. Ethical Considerations

<ethical_considerations>
The authors acknowledge potential ethical considerations related to their work:

1. Bias propagation: Labeled datasets used for finetuning can contain undesirable biases, which may be propagated into zero-shot applications of the model on downstream tasks.
2. Accessibility and risks: Instruction-tuned models may require less data and expertise to use, potentially lowering barriers to access. This could increase both the benefits and associated risks of such models.

Quote from the paper:
"First, labeled datasets such as those we use for finetuning can contain undesirable biases, and these biases can be propagated into zero-shot applications of the model on downstream tasks. And second, instruction-tuned models can potentially require less data and expertise to use; such lower barriers to access could increase both the benefits and associated risks of such models."
</ethical_considerations>

## 10. Environmental Considerations

<environmental_considerations>
The authors address the environmental impact of their research:

1. Energy cost: The pretraining of the language models used in the study had an energy cost of 451 MWh.
2. Carbon footprint: The pretraining process had a carbon footprint of 26 tCO2e.
3. Instruction tuning impact: The additional instruction tuning gradient-steps for finetuning FLAN is less than 2% of the number of pretraining steps, resulting in a comparatively smaller estimated additional energy cost.

Quote from the paper:
"The energy cost and carbon footprint for the pretrained models were 451 MWh and 26 tCO2e, respectively. The additional instruction tuning gradient-steps for finetuning FLAN is less than 2% of the number of pretraining steps, and so the estimated additional energy cost is comparatively smaller."
</environmental_considerations>

## 11. Author Contributions

<author_contributions>
The paper provides a detailed breakdown of the contributions made by each author, including:

- Conception of the original idea
- Implementation of FLAN
- Development of training and evaluation pipelines
- Task implementation
- Experiment conduction and management
- Ablation studies
- Paper writing
- Baseline comparisons
- Data contamination analysis
- Prompt tuning experiments
- High-level guidance and paper editing

Quote from the paper:
"Maarten Bosma conceived the original idea and implemented the first version of FLAN. Vincent Zhao prototyped the training and evaluation pipelines, as well as rank classification."
</author_contributions>

## 12. Acknowledgements

<acknowledgements>
The authors express gratitude to various individuals who contributed to the research:

- Feedback providers on the manuscript
- Debugging assistance
- Study design feedback
- Computational resource access
- Pretraining team for LaMDA-PT

Quote from the paper:
"We thank Ed Chi, Slav Petrov, Dan Garrette, Ruibo Liu, and Clara Meister for providing feedback on our manuscript. We thank Adam Roberts, Liam Fedus, Hyung Won Chung, and Noam Shazeer for helping debug some of our models."
</acknowledgements>

## 13. References

<references>
The paper includes an extensive list of references, covering various aspects of natural language processing, machine learning, and artificial intelligence. Some key references include:

1. Brown, T., et al. (2020). Language models are few-shot learners.
2. Raffel, C., et al. (2020). Exploring the limits of transfer learning with a unified text-to-text transformer.
3. Devlin, J., et al. (2019). BERT: Pre-training of deep bidirectional transformers for language understanding.
4. Radford, A., et al. (2019). Language models are unsupervised multitask learners.
5. Li, X., & Liang, P. (2021). Prefix-tuning: Optimizing continuous prompts for generation.

These references provide context for the research and situate it within the broader field of NLP and language model development.
</references>
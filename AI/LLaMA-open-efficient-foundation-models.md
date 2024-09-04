# LLaMA: Open and Efficient Foundation Language Models

## Table of Contents

1. Introduction
2. Approach
   2.1 Pre-training Data
   2.2 Architecture
   2.3 Optimizer
   2.4 Efficient Implementation
3. Main Results
   3.1 Common Sense Reasoning
   3.2 Closed-book Question Answering
   3.3 Reading Comprehension
   3.4 Mathematical Reasoning
   3.5 Code Generation
   3.6 Massive Multitask Language Understanding
   3.7 Evolution of Performance During Training
4. Instruction Finetuning
5. Bias, Toxicity and Misinformation
   5.1 RealToxicityPrompts
   5.2 CrowS-Pairs
   5.3 WinoGender
   5.4 TruthfulQA
6. Carbon Footprint
7. Related Work
8. Conclusion

## 1. Introduction

<introduction>
LLaMA (Large Language Model Meta AI) is a collection of foundation language models ranging from 7B to 65B parameters. These models were trained on trillions of tokens using publicly available datasets exclusively. The research demonstrates that it is possible to train state-of-the-art models without resorting to proprietary and inaccessible datasets.

Key findings:
- LLaMA-13B outperforms GPT-3 (175B) on most benchmarks
- LLaMA-65B is competitive with the best models, Chinchilla-70B and PaLM-540B

The authors aim to release all models to the research community to accelerate the development of large language models and help efforts to improve their robustness and mitigate known issues such as toxicity and bias.
</introduction>

## 2. Approach

### 2.1 Pre-training Data

<pre-training_data>
The training dataset is a mixture of several sources, covering diverse domains:

1. English CommonCrawl [67%]: Preprocessed using CCNet pipeline
2. C4 [15%]: Publicly available dataset
3. Github [4.5%]: Public GitHub dataset from Google BigQuery
4. Wikipedia [4.5%]: Dumps from June-August 2022, covering 20 languages
5. Gutenberg and Books3 [4.5%]: Public domain books
6. ArXiv [2.5%]: Processed arXiv Latex files
7. Stack Exchange [2%]: Dump from Stack Exchange websites

The entire training dataset contains approximately 1.4T tokens after tokenization. Most tokens are used only once during training, with the exception of Wikipedia and Books domains, which are processed approximately two epochs.

The data is tokenized using the byte-pair encoding (BPE) algorithm from SentencePiece implementation.
</pre-training_data>

### 2.2 Architecture

<architecture>
The network is based on the transformer architecture with several improvements:

1. Pre-normalization: Input of each transformer sub-layer is normalized using RMSNorm
2. SwiGLU activation function: Replaces ReLU non-linearity
3. Rotary Embeddings: Added at each layer of the network, replacing absolute positional embeddings

Model sizes and hyperparameters:

| Params | Dimension | n_heads | n_layers | Learning Rate | Batch Size | n_tokens |
|--------|-----------|---------|----------|---------------|------------|----------|
| 6.7B   | 4096      | 32      | 32       | 3.0e-4        | 4M         | 1.0T     |
| 13.0B  | 5120      | 40      | 40       | 3.0e-4        | 4M         | 1.0T     |
| 32.5B  | 6656      | 52      | 60       | 1.5e-4        | 4M         | 1.4T     |
| 65.2B  | 8192      | 64      | 80       | 1.5e-4        | 4M         | 1.4T     |
</architecture>

### 2.3 Optimizer

<optimizer>
The models are trained using the AdamW optimizer with the following hyperparameters:
- β1 = 0.9
- β2 = 0.95
- Cosine learning rate schedule (final learning rate = 10% of maximal learning rate)
- Weight decay of 0.1
- Gradient clipping of 1.0
- 2,000 warmup steps
</optimizer>

### 2.4 Efficient Implementation

<efficient_implementation>
Several optimizations were made to improve training speed:

1. Efficient implementation of causal multi-head attention using the xformers library
2. Reduced activations recomputed during backward pass with checkpointing
3. Manual implementation of backward function for transformer layers
4. Model and sequence parallelism to reduce memory usage
5. Overlap of computation of activations and communication between GPUs

Training efficiency:
- 65B-parameter model processes around 380 tokens/sec/GPU on 2048 A100 GPU with 80GB of RAM
- Training over 1.4T tokens takes approximately 21 days
</efficient_implementation>

## 3. Main Results

### 3.1 Common Sense Reasoning

<common_sense_reasoning>
LLaMA models were evaluated on eight standard common sense reasoning benchmarks:
1. BoolQ
2. PIQA
3. SIQA
4. HellaSwag
5. WinoGrande
6. ARC easy and challenge
7. OpenBookQA

Results:
- LLaMA-65B outperforms Chinchilla-70B on all reported benchmarks except BoolQ
- LLaMA-65B surpasses PaLM-540B on all benchmarks except BoolQ and WinoGrande
- LLaMA-13B outperforms GPT-3 on most benchmarks despite being 10× smaller

Table 3 in the paper provides detailed zero-shot performance comparisons with other models.
</common_sense_reasoning>

### 3.2 Closed-book Question Answering

<closed_book_qa>
LLaMA models were evaluated on two closed-book question answering benchmarks:
1. Natural Questions (NQ)
2. TriviaQA

Evaluation method:
- Exact match performance in a closed book setting
- Models do not have access to documents containing evidence to answer the question

Results:
- LLaMA-65B achieves state-of-the-art performance in zero-shot and few-shot settings on both benchmarks
- LLaMA-13B is competitive with GPT-3 and Chinchilla on these benchmarks, despite being 5-10× smaller

Tables 4 and 5 in the paper provide detailed performance comparisons for NaturalQuestions and TriviaQA, respectively.
</closed_book_qa>

### 3.3 Reading Comprehension

<reading_comprehension>
LLaMA models were evaluated on the RACE reading comprehension benchmark:
- RACE-middle
- RACE-high

Evaluation setup:
- Zero-shot accuracy following Brown et al. (2020)

Results:
- LLaMA-65B is competitive with PaLM-540B
- LLaMA-13B outperforms GPT-3 by a few percent

Table 6 in the paper provides detailed zero-shot accuracy comparisons.
</reading_comprehension>

### 3.4 Mathematical Reasoning

<mathematical_reasoning>
LLaMA models were evaluated on two mathematical reasoning benchmarks:
1. MATH
2. GSM8k

Evaluation method:
- Compared with PaLM and Minerva models
- Evaluated with and without maj1@k (majority voting with k samples)

Results:
- On GSM8k, LLaMA-65B outperforms Minerva-62B, despite not being fine-tuned on mathematical data
- LLaMA-65B shows competitive performance on MATH benchmark

Table 7 in the paper provides detailed performance comparisons on these quantitative reasoning datasets.
</mathematical_reasoning>

### 3.5 Code Generation

<code_generation>
LLaMA models were evaluated on two code generation benchmarks:
1. HumanEval
2. MBPP (Mostly Basic Python Programming)

Evaluation method:
- Pass@k scores (k = 1, 100 for HumanEval; k = 1, 80 for MBPP)
- Temperature settings: 0.1 for pass@1, 0.8 for pass@100 and pass@80

Results:
- LLaMA models outperform other general models not specifically trained or finetuned for code
- LLaMA-13B and larger models outperform LaMDA 137B on both HumanEval and MBPP
- LLaMA-65B outperforms PaLM 62B, even when PaLM is trained longer

Table 8 in the paper provides detailed performance comparisons for code generation tasks.
</code_generation>

### 3.6 Massive Multitask Language Understanding

<mmlu>
LLaMA models were evaluated on the Massive Multitask Language Understanding (MMLU) benchmark:
- Covers various domains of knowledge, including humanities, STEM, and social sciences
- Evaluated in the 5-shot setting

Results:
- LLaMA-65B is behind Chinchilla-70B and PaLM-540B by a few percent on average and across most domains
- Potential explanation: Limited amount of books and academic papers in pre-training data compared to other models

Table 9 in the paper provides detailed 5-shot accuracy comparisons across different domains of MMLU.
</mmlu>

### 3.7 Evolution of Performance During Training

<performance_evolution>
The authors tracked the performance of LLaMA models on various question answering and common sense benchmarks during training:

- Performance improves steadily on most benchmarks
- Performance correlates with the training perplexity of the model
- Exceptions: SIQA and WinoGrande show more variance in performance

Figure 2 in the paper illustrates the evolution of performance on different benchmarks during training for various model sizes.
</performance_evolution>

## 4. Instruction Finetuning

<instruction_finetuning>
The authors conducted a brief experiment on instruction finetuning:

- Followed the same protocol as Chung et al. (2022) to train an instruct model, LLaMA-I
- A small amount of finetuning improves performance on MMLU and enhances the model's ability to follow instructions

Results:
- LLaMA-I (65B) reaches 68.9% on MMLU
- Outperforms existing instruction finetuned models of moderate sizes
- Still far from the state-of-the-art (77.4% for GPT code-davinci-002 on MMLU)

Table 10 in the paper compares the performance of LLaMA-I with other instruction-tuned models on MMLU.
</instruction_finetuning>

## 5. Bias, Toxicity and Misinformation

<bias_toxicity_misinformation>
The authors evaluated LLaMA-65B on different benchmarks to measure toxic content production and stereotypes detection:

### 5.1 RealToxicityPrompts
- Measures the toxicity of generated content
- LLaMA-65B shows increased toxicity with model size, especially for Respectful prompts

### 5.2 CrowS-Pairs
- Measures biases in 9 categories (e.g., gender, religion, race/color)
- LLaMA-65B compares slightly favorably to GPT-3 and OPT-175B on average
- Shows particular bias in the religion category

### 5.3 WinoGender
- Evaluates gender bias in co-reference resolution
- LLaMA-65B performs better on "their/them/someone" pronouns than on "her/her/she" and "his/him/he"
- Shows evidence of societal biases related to gender and occupation

### 5.4 TruthfulQA
- Measures the truthfulness of a model
- LLaMA-65B scores higher than GPT-3 in both truthful and truthful*informative categories
- Still shows a low rate of correct answers, indicating a likelihood of hallucinating incorrect answers

The authors emphasize that these evaluations are not sufficient to fully understand the risks associated with these models.
</bias_toxicity_misinformation>

## 6. Carbon Footprint

<carbon_footprint>
The authors provide a breakdown of energy consumption and carbon footprint for training LLaMA models:

- Followed the formula from Wu et al. (2022) to estimate Watt-hours (Wh) and tons of carbon emissions (tCO2eq)
- Used a Power Usage Effectiveness (PUE) of 1.1
- Applied the US national average carbon intensity factor of 0.385 kg CO2eq/KWh for fair comparison

Estimated carbon footprint:
- Developing LLaMA models cost around 2,638 MWh
- Total emission of 1,015 tCO2eq

The authors hope that releasing these models will help reduce future carbon emissions since the training is already done, and some of the models are relatively small and can be run on a single GPU.
</carbon_footprint>

## 7. Related Work

<related_work>
The paper discusses the history and development of language models:

1. Traditional n-gram count statistics models
2. Neural network-based models (feed-forward, recurrent, LSTM)
3. Transformer-based models

Key developments in scaling language models:
- Increasing model and dataset sizes
- Improvements in architecture and training techniques
- Emergence of few-shot learning capabilities

Notable large language models mentioned:
- GPT-3
- Jurassic-1
- Megatron-Turing NLG
- Gopher
- Chinchilla
- PaLM
- OPT
- GLM

The authors also discuss the impact of scaling on model performance and the existence of power laws between model size, dataset size, and performance.
</related_work>

## 8. Conclusion

<conclusion>
The paper presents LLaMA, a series of language models that are competitive with state-of-the-art foundation models while being more efficient and open:

Key achievements:
1. LLaMA-13B outperforms GPT-3 while being more than 10× smaller
2. LLaMA-65B is competitive with Chinchilla-70B and PaLM-540B

Unique aspects:
- Trained exclusively on publicly available data
- Models are released to the research community

Future directions:
1. Accelerate the development of large language models
2. Improve robustness and mitigate known issues (toxicity, bias)
3. Investigate instruction finetuning for improved performance
4. Release larger models trained on larger pretraining corpora

The authors observed constant improvement in performance as they scaled up the models, indicating potential for further advancements in the field.
</conclusion>
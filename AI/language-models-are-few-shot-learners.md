# Language Models are Few-Shot Learners

## Table of Contents

1. Introduction
2. Approach
   2.1 Model and Architectures  
   2.2 Training Dataset
   2.3 Training Process
   2.4 Evaluation
3. Results
   3.1 Language Modeling, Cloze, and Completion Tasks
   3.2 Closed Book Question Answering
   3.3 Translation  
   3.4 Winograd-Style Tasks
   3.5 Common Sense Reasoning
   3.6 Reading Comprehension
   3.7 SuperGLUE
   3.8 NLI
   3.9 Synthetic and Qualitative Tasks
4. Measuring and Preventing Memorization Of Benchmarks
5. Limitations
6. Broader Impacts
   6.1 Misuse of Language Models
   6.2 Fairness, Bias, and Representation
   6.3 Energy Usage
7. Related Work
8. Conclusion

## 1. Introduction

This document summarizes a paper presenting GPT-3, a 175 billion parameter autoregressive language model that demonstrates strong performance on many NLP tasks and benchmarks in zero-shot, one-shot, and few-shot settings. The paper explores the capabilities of large language models to perform few-shot learning, where the model is given a few examples of a task at inference time without any gradient updates or fine-tuning.

Key points:

- GPT-3 is applied without any gradient updates or fine-tuning, with tasks specified purely via text interaction with the model.
- The model shows strong performance across many NLP tasks, including translation, question-answering, and cloze tasks.
- GPT-3 can generate samples of news articles which human evaluators have difficulty distinguishing from human-written articles.
- The paper discusses broader societal impacts and limitations of the model.

Quote: "Here we show that scaling up language models greatly improves task-agnostic, few-shot performance, sometimes even reaching competitiveness with prior state-of-the-art fine-tuning approaches."

## 2. Approach

### 2.1 Model and Architectures

GPT-3 uses the same model and architecture as GPT-2, with some modifications:

- Alternating dense and locally banded sparse attention patterns in the layers of the transformer
- Model sizes range from 125 million to 175 billion parameters
- All models use a context window of 2048 tokens

Quote: "To study the dependence of ML performance on model size, we train 8 different sizes of model, ranging over three orders of magnitude from 125 million parameters to 175 billion parameters, with the last being the model we call GPT-3."

### 2.2 Training Dataset

The training dataset includes:

- A filtered version of Common Crawl
- WebText2
- Books1 and Books2
- Wikipedia

Quote: "We used the following datasets in training: (1) A filtered version of Common Crawl (filtered using a custom-built classifier) (2) An expanded version of WebText called WebText2, (3) Two internet-based books corpora (Books1 and Books2), and (4) English-language Wikipedia."

### 2.3 Training Process

Key aspects of the training process:

- Use of Adam optimizer with β1 = 0.9, β2 = 0.95, and ε = 10^-8
- Cosine decay for learning rate
- Gradient clipping
- Alternating dense and locally banded sparse attention patterns

Quote: "We use the same model and architecture as GPT-2, including the modified initialization, pre-normalization, and reversible tokenization described therein, with the exception that we use alternating dense and locally banded sparse attention patterns in the layers of the transformer, similar to the Sparse Transformer."

### 2.4 Evaluation

Evaluation methods include:

- Zero-shot: Only a natural language instruction is given
- One-shot: One demonstration is provided
- Few-shot: As many demonstrations as will fit in the model's context window (typically 10 to 100)

Quote: "For each task, we evaluate GPT-3 under 3 conditions: (a) 'few-shot learning', or in-context learning where we allow as many demonstrations as will fit into the model's context window (typically 10 to 100), (b) 'one-shot learning', where we allow only one demonstration, and (c) 'zero-shot' learning, where no demonstrations are allowed and only an instruction in natural language is given to the model."

## 3. Results

### 3.1 Language Modeling, Cloze, and Completion Tasks

GPT-3 shows strong performance on various language modeling and completion tasks:

- Penn Tree Bank (PTB): 20.5 perplexity (zero-shot)
- LAMBADA: 86.4% accuracy (few-shot)
- HellaSwag: 79.3% accuracy (few-shot)
- StoryCloze: 87.7% accuracy (few-shot)

Quote: "On LAMBADA, we achieve 86.4% accuracy in the few-shot setting, an increase of over 18% from the previous state-of-the-art."

### 3.2 Closed Book Question Answering

GPT-3 performs well on closed-book question answering tasks:

- TriviaQA: 71.2% accuracy (few-shot)
- WebQuestions: 41.5% accuracy (few-shot)
- Natural Questions: 29.9% accuracy (few-shot)

Quote: "On TriviaQA, we achieve 64.3% in the zero-shot setting, 68.0% in the one-shot setting, and 71.2% in the few-shot setting."

### 3.3 Translation

GPT-3 shows competitive performance on translation tasks:

- WMT'14 French → English: 39.2 BLEU (few-shot)
- WMT'16 German → English: 40.6 BLEU (few-shot)
- WMT'16 Romanian → English: 39.5 BLEU (few-shot)

Quote: "GPT-3 significantly outperforms previous unsupervised NMT work by 5 BLEU when translating into English reflecting its strength as an English LM."

### 3.4 Winograd-Style Tasks

GPT-3 performs well on Winograd Schema tasks:

- Winograd Schema Challenge: 88.3% accuracy (zero-shot)
- Winogrande: 77.7% accuracy (few-shot)

Quote: "On Winograd we test GPT-3 on the original set of 273 Winograd schemas, using the same 'partial evaluation' method described in [RWC+19]."

### 3.5 Common Sense Reasoning

GPT-3 shows strong performance on common sense reasoning tasks:

- PhysicalQA (PIQA): 82.8% accuracy (few-shot)
- ARC Easy: 70.1% accuracy (few-shot)
- ARC Challenge: 51.5% accuracy (few-shot)
- OpenBookQA: 65.4% accuracy (few-shot)

Quote: "GPT-3 achieves 81.0% accuracy zero-shot, 80.5% accuracy one-shot, and 82.8% accuracy few-shot (the last measured on PIQA's test server). This compares favorably to the 79.4% accuracy prior state-of-the-art of a fine-tuned RoBERTa."

### 3.6 Reading Comprehension

GPT-3 performs well on various reading comprehension tasks:

- CoQA: 85.0 F1 (few-shot)
- DROP: 36.5 F1 (few-shot)
- QuAC: 44.3 F1 (few-shot)
- SQuADv2: 69.8 F1 (few-shot)
- RACE-h: 46.8% accuracy (few-shot)
- RACE-m: 58.1% accuracy (few-shot)

Quote: "GPT-3 performs best (within 3 points of the human baseline) on CoQA [RCM19] a free-form conversational dataset and performs worst (13 F1 below an ELMo baseline) on QuAC [CHI+18] a dataset which requires modeling structured dialog acts and answer span selections of teacher-student interactions."

### 3.7 SuperGLUE

GPT-3 shows competitive performance on the SuperGLUE benchmark:

- Overall SuperGLUE score: 71.8 (few-shot)
- Outperforms BERT-large on 4 out of 8 tasks
- Close to SOTA on some tasks (e.g., COPA, ReCoRD)

Quote: "GPT-3 still outperforms a fine-tuned BERT-large on four of eight tasks and on two tasks GPT-3 is close to the state-of-the-art held by a fine-tuned 11 billion parameter model."

### 3.8 NLI

GPT-3 shows some progress on Natural Language Inference tasks:

- RTE: 72.9% accuracy (few-shot)
- ANLI Round 3: 40.2% accuracy (few-shot)

Quote: "These results on both RTE and ANLI suggest that NLI is still a very difficult task for language models and they are only just beginning to show signs of progress."

### 3.9 Synthetic and Qualitative Tasks

GPT-3 demonstrates capabilities in various synthetic and qualitative tasks:

- Arithmetic: Strong performance on 2-3 digit operations, some capability on 4-5 digit operations
- Word scrambling and manipulation: Ability to unscramble words and perform character manipulations
- SAT analogies: 65.2% accuracy (few-shot)
- News article generation: Human evaluators have difficulty distinguishing GPT-3 generated articles from human-written ones

Quote: "On addition and subtraction, GPT-3 displays strong proficiency when the number of digits is small, achieving 100% accuracy on 2 digit addition, 98.9% at 2 digit subtraction, 80.2% at 3 digit addition, and 94.2% at 3-digit subtraction."

## 4. Measuring and Preventing Memorization Of Benchmarks

The paper addresses the issue of potential contamination of test sets in the training data:

- Attempts were made to remove overlaps between training data and test sets
- A bug resulted in only partial removal of detected overlaps
- Detailed analysis was conducted to measure the impact of remaining overlaps

Quote: "To address this, we investigate in detail how the remaining detected overlap impacts results. For each benchmark, we produce a 'clean' version which removes all potentially leaked examples, defined roughly as examples that have a 13-gram overlap with anything in the pretraining set."

## 5. Limitations

The paper acknowledges several limitations of GPT-3:

- Struggles with tasks requiring comparing two sentences or snippets
- Potential for outputting biased or prejudiced content
- Lack of bidirectional architectures or other training objectives
- Sample inefficiency during pre-training compared to humans

Quote: "GPT-3 has several structural and algorithmic limitations, which could account for some of the issues above. We focused on exploring in-context learning behavior in autoregressive language models because it is straightforward to both sample and compute likelihoods with this model class."

## 6. Broader Impacts

### 6.1 Misuse of Language Models

The paper discusses potential misuse of language models:

- Generating misleading news articles
- Social engineering pretexting
- Spam and phishing

Quote: "Any socially harmful activity that relies on generating text could be augmented by powerful language models. Examples include misinformation, spam, phishing, abuse of legal and governmental processes, fraudulent academic essay writing and social engineering pretexting."

### 6.2 Fairness, Bias, and Representation

The paper addresses issues of bias in language models:

- Gender bias in occupation associations
- Racial bias in sentiment analysis
- Religious bias in word associations

Quote: "We have conducted an analysis of biases in the model in order to better understand GPT-3's limitations when it comes to fairness, bias, and representation."

### 6.3 Energy Usage

The paper acknowledges the significant computational resources required for training large language models:

- GPT-3 175B consumed several thousand petaflop/s-days of compute during pre-training
- Discusses the need for considering both training and inference efficiency

Quote: "Practical large-scale pre-training requires large amounts of computation, which is energy-intensive: training the GPT-3 175B consumed several thousand petaflop/s-days of compute during pre-training, compared to tens of petaflop/s-days for a 1.5B parameter GPT-2 model."

## 7. Related Work

The paper discusses related work in several areas:

- Scaling of language models
- Few-shot learning and meta-learning
- Multi-task learning
- Algorithmic innovations in language models

Quote: "Several lines of work have focused on increasing parameter count and/or computation in language models as a means to improve generative or task performance."

## 8. Conclusion

The paper concludes by highlighting the potential of large language models for adaptable, general language systems:

- GPT-3 demonstrates strong performance across a wide range of NLP tasks
- Few-shot learning capabilities show promise for task-agnostic language understanding
- Acknowledges limitations and areas for future research

Quote: "Despite many limitations and weaknesses, these results suggest that very large language models may be an important ingredient in the development of adaptable, general language systems."
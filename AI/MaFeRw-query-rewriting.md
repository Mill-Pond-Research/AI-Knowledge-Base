# MaFeRw: Query Rewriting with Multi-Aspect Feedbacks for Retrieval-Augmented Large Language Models

Authors: Yujing Wang, Hainan Zhang, Liang Pang, Binghui Guo, Hongwei Zheng, Zhiming Zheng

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
4. Problem Definition
5. Approach
   5.1 Framework Overview
   5.2 Rewriter Initialization
   5.3 Multi-aspect Feedbacks
   5.4 Reward Model
   5.5 RL Training
6. Experiments
   6.1 Experimental Settings
   6.2 Main Results
   6.3 Ablation Study
   6.4 Analysis
   6.5 Case Study
   6.6 Transferability
7. Conclusion
8. References

## 1. Document Overview

This knowledge base entry is based on the research paper "MaFeRw: Query Rewriting with Multi-Aspect Feedbacks for Retrieval-Augmented Large Language Models" by Yujing Wang et al. The paper introduces a novel query rewriting method called MaFeRw, which aims to improve the performance of Retrieval-Augmented Generation (RAG) systems by incorporating multi-aspect feedbacks from both the retrieval process and generated results.

The document is significant in the field of natural language processing, particularly in the areas of conversational AI and information retrieval. It addresses the challenge of accurately understanding user intent in multi-turn dialogues and proposes a solution that enhances the effectiveness of RAG systems.

## 2. Introduction

The introduction section of the paper provides context for the research and outlines the main contributions. Key points include:

1. Retrieval-augmented generation (RAG) addresses factual inaccuracy in large language models by integrating relevant retrieved information.

2. In real-world RAG systems, users often use spoken language and multi-turn dialogues, leading to challenges in understanding user intent due to spoken ellipses and ambiguous references.

3. Traditional context-based query rewriting has minimal enhancement on downstream generation tasks due to the lengthy process from query rewriting to response generation.

4. The authors propose MaFeRw, which improves RAG performance by integrating multi-aspect feedback from both the retrieval process and generated results.

Quote: "We find that user's needs are also reflected in the gold document, retrieved documents and ground truth. Therefore, by feeding back these multi-aspect dense rewards to query rewriting, more stable and satisfactory responses can be achieved."

## 3. Related Work

The related work section discusses previous research in query rewriting for various tasks:

1. Conversational search tasks:
   - Extracting user intents from dialogue context
   - Introducing retrieval feedback to improve rewriting

2. Conversational QA tasks:
   - Feeding generated results back into the rewriting model
   - Using generated answers as rewards for reinforcement learning

3. Conversational RAG tasks:
   - Creating pseudo-datasets for supervised warm-up training
   - Optimizing rewriters using policy gradient RL frameworks

Quote: "Currently, RAG mainly performs context-based query rewriting to improve the quality of response generation, but the resulting enhancement is minimal due to the lengthy process from query rewriting to response generation."

## 4. Problem Definition

The problem definition section formalizes the task of query rewriting in the context of RAG systems:

- Given a dialogue history hk = (q1, a1, ..., qk-1, ak-1) and a current query qk
- A query rewriting model Rθ with parameters θ rewrites qk to qkR
- The rewritten query qkR is used by the RAG system's retriever to search for relevant documents Dk
- The rewritten query qkR, retrieved documents Dk, and the previous turn (qk-1, ak-1) are used to prompt the LLM for generation

The goal is to train the query rewriting model Rθ to better describe user needs and ensure accurate retrieval and generation in RAG.

## 5. Approach

### 5.1 Framework Overview

The MaFeRw approach consists of several key components:

1. Rewriter initialization using manual rewriting data
2. Design of three metrics for RL feedback:
   - Similarity between rewritten query and gold document
   - Ranking metrics of similarity between retrieved documents and ground truth
   - ROUGE between generation and ground truth
3. Training of reward models for efficient RL training
4. Combination of reward model scores and rewritten ROUGE for PPO training

### 5.2 Rewriter Initialization

The rewriter is initialized using a T5-base model trained on manual rewriting data:

- Input: Concatenation of current query qk and dialogue history hk
- Objective: Minimize cross-entropy loss between model prediction qR and manual rewrite q+

Quote: "When q+ is a manual-rewritten query, the objection of initialization is to optimize parameters θ of the rewriter Rθ by minimizing the cross-entropy loss between the model's prediction qR and q+."

### 5.3 Multi-aspect Feedbacks

The paper introduces three metrics for RL feedback:

1. Similarity between qR and d+:
   - Cosine similarity between dense vectors of rewritten query and gold document
   - Metric: md+ = CS(vqR, vd+)

2. Ranking metric of similarity between D and G:
   - Combines rank scores and cosine similarity between ground truth and retrieved documents
   - Metric: mD = Σli=1 1/i · CS(vG, vdi)

3. ROUGE between g and G:
   - ROUGE score between generated output and ground truth
   - Metric: mG

4. ROUGE between qR and q+:
   - ROUGE score between model rewrite and manual rewrite
   - Metric: mq

### 5.4 Reward Model

To improve efficiency in RL training, reward models are trained for each metric:

- Based on T5-base model with a value head
- Trained on paired datasets of (chosen, rejected) rewrites
- Preference distribution formulated using Bradley-Terry model
- Loss function: Negative log-likelihood

Quote: "By following the Bradley-Terry model (Bradley and Terry 1952), we formulate a preference distribution by employing the reward model rψ as outlined below:
Pψ(qc ≻ qr | h+q) = σ(rψ(h+q, qc) - rψ(h+q, qr)),"

### 5.5 RL Training

The RL training process uses the PPO algorithm:

- State: Dialogue history h, current query q, and already generated rewrite qR,[<t]
- Action: Generation of the next token
- Reward: Combination of reward model scores and metric mq
- Objective: Maximize reward while minimizing KL divergence from initial policy

Quote: "The reward objective we need to maximize in policy optimization is:
rtotal = rRL(qR) - η KL(RRLθ || R0θ),"

## 6. Experiments

### 6.1 Experimental Settings

The experiments were conducted on two multi-turn dialogue RAG datasets:

1. QReCC: 14k conversations with 81k question-answer pairs
2. TopiOCQA: 3,920 conversations with topic switches based on Wikipedia

Evaluation metrics:
- Generation: ROUGE-1, ROUGE-L, BLEU, METEOR
- Retrieval: MRR

Baselines:
- Raw RAG
- T5-base rewriter
- RL-base rewriter
- ConvGQR

### 6.2 Main Results

The main results show that MaFeRw outperforms baselines on both datasets:

Quote: "MaFeRw achieves 5.07 and 3.19 ROUGE-1 higher than raw RAG on QReCC and TopiOCQA, respectively. Moreover, in both datasets, the improvement in MRR score is accompanied by an improvement in generation metrics."

Key findings:
- Significant improvement in retrieval performance, especially for TopiOCQA with topic shifts
- Consistent enhancement in generation metrics across datasets

### 6.3 Ablation Study

The ablation study examines the impact of individual metrics on rewriter training:

1. Impact of md+: Improves retrieval but may not consistently enhance generation
2. Impact of mD: Enhances retrieval effectiveness but may not translate to better generation
3. Impact of mG: Improves both ROUGE and MRR scores, highlighting its importance
4. Impact of mq: Shows improvement over T5-base rewriter, especially for diverse conversational data

Quote: "These results indicate that individual metrics can improve certain aspects of RAG performance, but their performance varies across different datasets, which is insufficient to stably support RL training. Therefore, combining multiple metrics is necessary to achieve better overall results."

### 6.4 Analysis

The analysis section investigates the stability of training results using different feedback mechanisms:

- Single metric or reward model feedback shows variability in performance
- Combining all feedback sources leads to more stable improvements in both ROUGE-1 and MRR

Quote: "Based on the above results, it can be analyzed that, by training on paired datasets, reward models can capture a more essential correspondence between rewriting based on dialogue history and each metric. Therefore, RL training with the feedback given by reward models can obtain more stable and effective results than directly training with the whole process of RAG."

### 6.5 Case Study

The case study presents examples comparing MaFeRw with other baselines:

Case 1:
- Context: Questions about elements in the earth's crust
- Current Query: "What's the atomic number?"
- MaFeRw correctly identifies the reference to aluminum, while baselines incorrectly focus on silicon

Case 2:
- Context: Questions about Tour de France winners
- Current Query: "Which year?"
- MaFeRw avoids adding incorrect information, leading to a more accurate response

Quote: "These results verify that MaFeRw can accurately capture the anaphora relationship between the current query and the dialogue history, especially when other interfering words are mentioned in the dialogue history."

### 6.6 Transferability

The transferability of MaFeRw was tested on the WSDM@24 Multi-Doc QA dataset:

- Rewriting model trained on QReCC was used to rewrite queries
- Results show improved generation performance compared to T5-base rewriter

Quote: "This validates that the rewriter trained using our method possesses generalization capability across different conversational tasks."

## 7. Conclusion

The conclusion summarizes the main contributions and findings of the paper:

1. Introduction of MaFeRw, a novel query rewriting method for enhancing RAG performance
2. Design of multi-aspect dense rewards for more stable and satisfactory generation results
3. Experimental validation of MaFeRw's superiority in generation metrics and stability
4. Demonstration of transferability across different conversational tasks

Future work suggestions:
- Document re-ranking to better match retrieved documents with contextual constraints
- Prompt reconstruction to capture users' complex intents in multi-turn dialogues

## 8. References

The paper includes an extensive list of references, which can be found at the end of the original document. Some key references include:

1. Adlakha, V.; et al. 2022. TopiOCQA: Open-domain Conversational Question Answering with Topic Switching.
2. Anantha, R.; et al. 2020. Open-Domain Question Answering Goes Conversational via Question Rewriting.
3. Lewis, P.; et al. 2021. Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks.
4. Ma, X.; et al. 2023. Query Rewriting in Retrieval-Augmented Large Language Models.
5. Raffel, C.; et al. 2020. Exploring the limits of transfer learning with a unified text-to-text transformer.
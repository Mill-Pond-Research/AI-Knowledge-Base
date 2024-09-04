# AdaComp: Adaptive Context Compression for Retrieval-Augmented Large Language Models

## Table of Contents

1. Introduction
2. Background and Related Work
3. AdaComp: Adaptive Context Compression Method
4. Experimental Setup
5. Results and Analysis
6. Case Study
7. Conclusion and Future Work
8. References

## 1. Introduction

This knowledge base document is based on a research paper that introduces AdaComp, a novel approach to context compression for retrieval-augmented large language models. The paper addresses the critical challenge of balancing information relevance and computational efficiency in retrieval-augmented generation (RAG) systems.

### 1.1 Problem Statement

The authors identify a key issue in current RAG systems:

> "Retrieved documents containing noise will hinder RAG from detecting answer clues and make the inference process slow and expensive. Therefore, context compression is necessary to enhance its accuracy and efficiency."

### 1.2 Proposed Solution

AdaComp is presented as a solution to this problem:

> "We introduce AdaComp, a low-cost extractive context compression method that adaptively determines the compression rate based on both query complexity and retrieval quality."

### 1.3 Key Contributions

The paper makes several important contributions to the field:

1. An automated and low-cost compression rate annotation method
2. An effective extractive context compression method
3. Experimental validation across multiple datasets

## 2. Background and Related Work

### 2.1 Retrieval-Augmented Generation (RAG)

The paper provides context on the importance of RAG in various NLP tasks:

> "Retrieval-Augmented Generation (RAG) has demonstrated impressive performance across various knowledge-intensive NLP tasks, such as open-domain question answering, fact verification, and knowledge-grounded dialogue generation."

### 2.2 Existing Compression Methods

The authors discuss several existing approaches to context compression:

1. Summarization compressors using large language models
2. Extractive compressors that select query-relevant sentences
3. Selective Context methods based on self-information metrics
4. Information bottleneck approaches

However, these methods have limitations:

> "Current context compression methods mainly use extractive or generative models to compress the retrieved documents, but they may face issues of over-compression and high computational costs."

## 3. AdaComp: Adaptive Context Compression Method

### 3.1 Model Architecture

AdaComp consists of three main components:

> "The Adaptive Context Compression Architecture is composed of three main components: a retrieval module R, a compression module Cθ, and a generation model G."

<architecture>
- Retrieval module (R)
- Compression module (Cθ)
- Generation model (G)
</architecture>

### 3.2 Compression-Rate Predictor

The core of AdaComp is its compression-rate predictor:

> "The main component of compression module Cθ is a compression-rate predictor f(D, q) which determines the size of D' based on the query q and the retrieved documents D."

### 3.3 Training Data Generation

The authors describe a novel method for generating training data:

> "We employ a data annotation method based on real RAG system feedback. Given a query q and a set of retrieved documents D = {d1, d2, ..., dn}, the objective is to identify the smallest subset D' such that the RAG system M can generate the correct response y based on q and D'."

### 3.4 Predictor Training

The compression-rate predictor is trained using the following approach:

> "We utilize the Llama2-7b model as the base model of the compression-rate predictor. The compression-rate predictor f(D, q) is trained to output a discrete number n, where n can take any value from the set {0, 1, ···, N}."

## 4. Experimental Setup

### 4.1 Datasets

The experiments were conducted on four datasets:

1. Natural Questions (NQ)
2. TriviaQA
3. HotpotQA
4. Conversational Multi-doc QA

### 4.2 Evaluation Metrics

Different metrics were used for different datasets:

> "For the three open-domain QA datasets, we assess end-task performance by reporting Exact Match (EM) and F1 Score for the answer strings. ... For the conversational Multi-Doc QA dataset, we use Rouge-1, Rouge-2, and Rouge-L to evaluate the quality of the generated responses."

### 4.3 Baselines

The authors compare AdaComp to several baseline methods:

1. No Retrieval
2. Retrieval without Compression (Top-1, Top-5)
3. Retrieval with Compression (RECOMP, FILCO)
4. Oracle (theoretical upper bound)

## 5. Results and Analysis

### 5.1 Main Results

The paper presents comprehensive results across all datasets. For example, on the NQ dataset:

> "Our AdaComp method performs better across all three datasets compared to the RECOMP and FILCO methods. It also significantly reduces the number of tokens, indicating that the adaptive compression strategy strikes a good balance between token count and performance."

### 5.2 Impact of Document Number

The authors analyze how the number of documents affects RAG performance:

> "Initially, performance improves with an increasing number of documents, as the inclusion of additional relevant information enhances the model's accuracy and the breadth of its responses. ... Beyond a certain threshold, further increases in the number of documents lead to a decline in performance."

### 5.3 Predictor Performance

The paper provides a detailed analysis of the compression-rate predictor's performance:

> "The overall accuracy of our predictions is approximately 65%, indicating that AdaComp demonstrates a reasonably good predictive capability. Additionally, an analysis of the confusion matrix reveals that the absolute difference between the predicted labels and the true labels typically falls within a margin of 2."

## 6. Case Study

The authors present a case study to illustrate AdaComp's effectiveness:

> "AdaComp demonstrates the ability to retain a greater amount of relevant information when the quality of the retrieved text is suboptimal. This enhanced retention capability allows AdaComp to generate accurate answers despite the lower quality of the input text."

## 7. Conclusion and Future Work

The paper concludes by summarizing the key contributions of AdaComp and outlining future research directions:

> "This paper introduces a low-cost but effective context compression method, AdaComp, which adaptively determines the compression rate based on both query complexity and retrieval quality."

Future work will focus on:

1. Investigating the impact of document length on LLMs' question-answering ability
2. Exploring new methods to improve the accuracy of the final predictor

## 8. References

The paper includes a comprehensive list of references, which can be found at the end of the document. Some key references include:

1. Chen, J.; Zhang, R.; Guo, J.; Fan, Y.; and Cheng, X. 2022. GERE: Generative evidence retrieval for fact verification.
2. Karpukhin, V.; O˘ guz, B.; Min, S.; Lewis, P.; Wu, L.; Edunov, S.; Chen, D.; and Yih, W.-t. 2020. Dense passage retrieval for open-domain question answering.
3. Touvron, H.; Lavril, T.; Izacard, G.; Martinet, X.; Lachaux, M.-A.; Lacroix, T.; Rozi` ere, B.; Goyal, N.; Hambro, E.; Azhar, F.; et al. 2023. Llama: Open and efficient foundation language models.
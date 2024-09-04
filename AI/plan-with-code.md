# Plan with Code: Comparing Approaches for Robust NL to DSL Generation

## Table of Contents

1. [Document Overview](#document-overview)
2. [Introduction](#introduction)
3. [Related Work](#related-work)
   3.1 [Code Generation or Program Synthesis](#code-generation-or-program-synthesis)
   3.2 [Reasoning and Tool Integration](#reasoning-and-tool-integration)
   3.3 [Contributions](#contributions)
4. [Methodology](#methodology)
   4.1 [Fine-Tuned NL2DSL Generation Model](#fine-tuned-nl2dsl-generation-model)
   4.2 [Grounding with Dynamically Selected Few-shots](#grounding-with-dynamically-selected-few-shots)
   4.3 [Grounding with API Metadata](#grounding-with-api-metadata)
5. [Experiment Design and Metrics Definition](#experiment-design-and-metrics-definition)
   5.1 [Dataset Generation](#dataset-generation)
   5.2 [DSL Generation Quality Metrics](#dsl-generation-quality-metrics)
6. [Results](#results)
   6.1 [Impact of Number of Few-shots](#impact-of-number-of-few-shots)
   6.2 [TST vs Pre-trained Model](#tst-vs-pre-trained-model)
   6.3 [Regular Function Definition vs Semantic Function Definitions](#regular-function-definition-vs-semantic-function-definitions)
   6.4 [Out of Domain APIs](#out-of-domain-apis)
7. [Conclusion](#conclusion)
8. [Ethical Considerations](#ethical-considerations)
9. [References](#references)
10. [Appendix](#appendix)

## 1. Document Overview

This knowledge base document is based on a research paper titled "Plan with Code: Comparing approaches for robust NL to DSL generation" by Nastaran Bassamzadeh and Chhaya Methani from Microsoft Corporation, Redmond, USA. The paper focuses on improving the generation of Domain Specific Languages (DSLs) from Natural Language (NL) inputs, particularly in the context of Robotic Process Automation (RPA) and workflow automation.

The document explores various approaches to enhance the quality and reliability of NL to DSL generation, comparing fine-tuned models with Retrieval Augmented Generation (RAG) techniques. It presents an end-to-end system architecture for DSL generation and provides insights into the effectiveness of different grounding strategies.

## 2. Introduction

The paper begins by highlighting the importance of planning in code for orchestration tasks. The authors state:

<quote>Planning in code is considered a more reliable approach for many orchestration tasks. This is because code is more tractable than steps generated via Natural Language and make it easy to support more complex sequences by abstracting deterministic logic into functions. It also allows spotting issues with incorrect function names with the help of parsing checks that can be run on code.</quote>

However, the authors note that progress in Code Generation methodologies has been limited to general-purpose languages like C, C++, and Python. They identify challenges faced by Large Language Models (LLMs) when dealing with Domain Specific Languages (DSLs):

<quote>LLMs continue to face challenges with custom function names in Domain Specific Languages or DSLs, leading to higher hallucination rates and syntax errors. This is more common for custom function names, that are typically part of the plan. Moreover, keeping LLMs up-to-date with newer function names is an issue.</quote>

The paper focuses on workflow automation in the Robotic Process Automation (RPA) domain as a special case of task planning. The authors present their research objectives:

<quote>In this paper, we focus on workflow automation in RPA (Robotic Process Automation) domain as a special case of task planning. We present optimizations for using Retrieval Augmented Generation (or RAG) with LLMs for DSL generation along with an ablation study comparing these strategies with a fine-tuned model.</quote>

## 3. Related Work

The authors provide an overview of related work in three main areas:

### 3.1 Code Generation or Program Synthesis

The paper acknowledges recent advancements in code generation for general-purpose languages:

<quote>Program Synthesis is a hard research problem (Jain et al., 2021, Li et al., 2022, Xu et al., 2021). It has gained significant interest with many open-source models (Code Llama, Li et al., 2023, Codestral, Abdin et al., 2024, Chen et al., 2021) focusing on general programming languages.</quote>

The authors note that for domain adaptation, instruction fine-tuning remains a popular approach:

<quote>However, for domain adaptation, instruction fine-tuning on top of a base model remains a popular approach (Chen et al., 2021, Gao et al., 2023, Lewkowycz et al., 2022, Patil et al., 2023).</quote>

### 3.2 Reasoning and Tool Integration

The paper discusses the importance of reasoning and tool integration in the context of API sequence generation:

<quote>For modeling the problem of selecting a sequence of API calls, we need to consider formulating it as a planning or reasoning task. LLMs show remarkable reasoning capability, however, they also have limitations when it comes to staying up-to-date with recent knowledge, performing mathematical calculations etc.</quote>

The authors highlight the growing focus on incorporating LLM's code generation capabilities into reasoning and task orchestration:

<quote>There is an increase in focus on incorporating LLM's code generation capabilities to reasoning and task orchestration making this an area of active research (Gao et al., 2023, Liang et al., 2023, Patil et al., 2023).</quote>

### 3.3 Contributions

The authors outline their main contributions:

<quote>NL2DSL generation suffers from the hallucination and quality issues we discussed in Section 1. Few studies address the challenges of end-to-end DSL generation, specifically over a large set of custom APIs. In this paper, we present an end-to-end system architecture with improved strategies to add grounding context with known RAG techniques.</quote>

They emphasize the novelty of their approach:

<quote>DSL samples in our test set consider API or tool selection sequences of 5-6 API calls, also referred to as chain of tools, which is a first to the best of our knowledge. We also consider the real-world scenarios of adding conditional logic with API calls as shown with an example in Figure 1.</quote>

## 4. Methodology

The paper presents three main methodological approaches:

### 4.1 Fine-Tuned NL2DSL Generation Model

The authors describe their fine-tuning approach:

<quote>We took the Codex base model from OpenAI due to it's pre-training with code samples and used LoRA-based fine-tuning approach. The training set consists of NL-DSL pairs, NL refers to the user query and the DSL represents the workflow that the user is looking to automate.</quote>

They note the challenges faced during fine-tuning:

<quote>We found that predicting the parameter keys was very challenging with the fine-tuned model due to limitation of high-quality data generation.</quote>

### 4.2 Grounding with Dynamically Selected Few-shots

The paper explores two types of grounding information for RAG-based DSL generation:

1. Pre-trained Model:
<quote>The first approach is using a vanilla Pre-trained model for determining the semantic similarity of NL-DSL samples based on the NL query. We computed the embeddings of NL queries using a Distil-RoBERTa Pre-trained model. We created a Faiss Index (Douze et al., 2024) for these embeddings to help with search over the dense embedding space.</quote>

2. TST based BERT Fine-tuning:
<quote>In this approach, we fine-tuned the Pre-trained model to improve retrieval accuracy of few-shots similar to the work done by Poesia et al., 2022. To get positive and negative samples for fine-tuning, we generated embeddings for all NL queries in our dataset using a Pre-trained Transformer model.</quote>

### 4.3 Grounding with API Metadata

The authors describe two approaches for selecting API metadata:

1. API Function Definitions for Few-Shots:
<quote>For few-shot samples selected using the methods described above, we extracted the metadata for each of the functions present in those samples. This means that for the n few-shot samples dynamically added to the metaprompt, we iterated over all the API function names in each of these flows and added their function definitions to the metaprompt.</quote>

2. Semantic Function Definitions:
<quote>Another approach for selecting function definitions is to retrieve semantically similar functions from a vector database created with API metadata. This approach is similar to the one followed by (LlamaIndex). We created an index of all API definitions and used the input NL query for search.</quote>

## 5. Experiment Design and Metrics Definition

### 5.1 Dataset Generation

The authors describe their dataset:

<quote>Our train and test set consists of a total of 67k and 1k samples, respectively. These samples are (prompt, flow) pairs with the workflows being created by users across a large set of APIs. We scrubbed PII from these automations and sampled workflows containing 700 publicly available APIs. We synthetically generated the corresponding Natural Language prompts using GPT-4.</quote>

### 5.2 DSL Generation Quality Metrics

The paper defines three key metrics for evaluating code generation quality:

1. Average Similarity:
<quote>Average Similarity measures the similarity between predicted flow and the ground truth flow and is defined using the Longest Common Subsequence match (LCSS) metric. Each flow is reduced to a list of API sequences and then the LCSS is computed. The final metric is reported as an average over all test samples.</quote>

2. Unparsed rate:
<quote>This metric captures the rate of syntactic errors. A flow that cannot be parsed by the parser is considered not usable for the purpose of similarity metric computation.</quote>

3. Hallucination rate:
<quote>This metric captures the rate of made-up APIs and made-up parameter keys in the generated code. Predicting a flow with a hallucinated API name is counted as a failure and leads to the code being considered invalid. However, hallucinated parameter keys would only lead to run-time errors which can be fixed down the line.</quote>

## 6. Results

The paper presents results in four main areas:

### 6.1 Impact of Number of Few-shots

The authors compare the impact of using 5 vs 20 few-shot samples:

<quote>Looking at rows 2 and 4 having 20 few-shot samples, we can see that adding more few-shots improves the performance of both the Pre-trained as well as the TST model on all metrics. The gain is particularly pronounced for reducing the number of made-up API names as well as reducing the number of made-up API parameter keys.</quote>

### 6.2 TST vs Pre-trained Model

The paper compares the performance of TST and Pre-trained models:

<quote>TST with FD setting performs overall better than all other options with values close to the best in every metric. This leads us to conclude that the presence of few-shot examples is supported by adding their API functions definitions (as described in Section 3).</quote>

### 6.3 Regular Function Definition vs Semantic Function Definitions

The authors compare different approaches to including API metadata:

<quote>Based on the insights from the previous step, we used 20 few-shots for TST along with including FDs. Looking at metrics in columns for % made-up API names and % made-up parameter keys, we see that the hallucination rate is, in general, increasing for RAG based approach.</quote>

They note:

<quote>Within the RAG approaches, comparing rows 1 and 2 ("TST + FD" vs "TST + SFD"), SFD results in a slight drop in average similarity and an increase in the unparsed rate and hallucination rate for parameters. This indicates that the approach to simply add semantically similar API metadata for a query is not useful for DSL generation.</quote>

### 6.4 Out of Domain APIs

The paper examines the performance of RAG on unseen APIs:

<quote>The RAG-based approach notably enhances average similarity (by 7 pts) and reduces API hallucinations (by 1.5 pts) for out of domain APIs. This indicates that when samples are not present in the train set, grounding with RAG context can provide the LLM support for improving code quality.</quote>

However, they also note:

<quote>However, fine-tuned model outperforms RAG model in terms of syntactic errors and parameter key hallucinations. The role of few-shots in informing the syntax of the output code cannot be substituted with just adding function definitions.</quote>

## 7. Conclusion

The authors summarize their findings:

<quote>Based on the presented results, we see that the role of dynamically selected few-shot samples is very important in making RAG useful for syntactically correct generation of DSL as well as improving code similarity (Table 4). This could be due to the fact that few-shot examples have been successfully teaching the correct syntax to the LLM model.</quote>

They highlight the advantages of their approach:

<quote>Overall, we were able to significantly improve the performance of RAG for DSL generation, with hallucination rate for API names dropping by 6.29 pts. and by 20 pts for parameter keys (Table 2). The performance of RAG is now comparable to that of fine-tuned model (see Avg. Similarity in Table 4), with better performance for unseen APIs. This reduces the need to fine-tune the model frequently for new APIs saving compute and resources.</quote>

## 8. Ethical Considerations

The authors briefly mention their approach to ethical considerations:

<quote>We used instructions in meta prompt to not respond to harmful queries. This is supplemented with a harms classifier on the input prompt. The Fine-tuned model was shown examples where it should not generate an output and consequently learnt not to respond to queries considered harmful.</quote>

## 9. References

The paper includes a comprehensive list of references, which can be found at the end of the document.

## 10. Appendix

The appendix provides additional examples and details, including:

- A sample showing how flow similarity is computed for two flows
- An example of API metadata
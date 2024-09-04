# Human-like Episodic Memory for Infinite Context LLMs: A Comprehensive Knowledge Base

## Table of Contents

1. Introduction
2. Background and Related Work
   2.1 Long-context in LLMs
   2.2 Neural Models of Episodic Memory and Event Cognition
3. EM-LLM: LLM with Episodic Memory
   3.1 Architecture
   3.2 Memory Formation via Surprise
   3.3 Boundary Refinement
   3.4 Memory Retrieval
4. Experiments
   4.1 Performance of EM-LLM on Long-context Tasks
   4.2 Humans and LLM Surprise Cluster Similar Tokens Together
   4.3 Comparing Segmentation Methods
   4.4 Similarity, Contiguity, Recency, and Temporal Order
5. Discussion
6. Conclusion
7. Appendix / Supplemental Material

## Document Overview

This knowledge base entry is based on a research paper titled "Human-like Episodic Memory for Infinite Context LLMs" by Zafeirios Fountas et al. The document presents a novel approach to extending the context window of Large Language Models (LLMs) by integrating key aspects of human episodic memory and event cognition. The proposed model, EM-LLM, enables LLMs to effectively handle practically infinite context lengths while maintaining computational efficiency.

The paper is significant in the field of natural language processing and artificial intelligence, as it addresses a critical limitation of current LLMs: their struggle with processing extensive contexts. By bridging insights from cognitive science with machine learning, EM-LLM not only enhances the performance of LLMs on long-context tasks but also provides a scalable computational framework for testing hypotheses about human memory.

## 1. Introduction

The introduction sets the stage for the research by highlighting the current limitations of LLMs in processing extensive contexts and the need for improved methods to handle long-range dependencies. 

Key points from the introduction:

1. LLMs struggle with processing extensive contexts, limiting their ability to maintain coherence and accuracy over long sequences.
2. The human brain excels at organizing and retrieving episodic experiences across vast temporal scales.
3. EM-LLM integrates key aspects of human episodic memory and event cognition into LLMs.
4. The proposed approach enables LLMs to handle practically infinite context lengths while maintaining computational efficiency.

Quote: "Large language models (LLMs) have shown remarkable capabilities, but still struggle with processing extensive contexts, limiting their ability to maintain coherence and accuracy over long sequences. In contrast, the human brain excels at organising and retrieving episodic experiences across vast temporal scales, spanning a lifetime."

## 2. Background and Related Work

This section provides context for the research by discussing previous work in two main areas: long-context in LLMs and neural models of episodic memory and event cognition.

### 2.1 Long-context in LLMs

The authors review various approaches to extending the context window of Transformer-based models, including:

1. Methods addressing limited representational capacity of softmax attention
2. Approaches targeting poor extrapolation of positional encodings
3. Computational efficiency improvements
4. Retrieval-based methods

Quote: "Recently, several approaches have been proposed to extend the context window of Transformer-based models. Those include methods that address the limited representational capacity of softmax attention, and its quadratic computational and memory cost (Katharopoulos et al., 2020; Munkhdalai et al., 2024)."

### 2.2 Neural Models of Episodic Memory and Event Cognition

This subsection explores the concept of episodic memory in both theoretical neuroscience and machine learning. Key points include:

1. Neural models of episodic memory capture human behavior and neuroimaging data.
2. Episodic memory-inspired approaches have improved performance in various machine learning domains.
3. Surprise plays a critical role in event segmentation and memory formation.
4. Human free recall studies have shown distinctive patterns in memory retrieval.

Quote: "Surprise plays a critical role in this process, triggering event boundaries and memory formation (Fountas et al., 2022; Kumar et al., 2023). This event-based structure is deeply intertwined with our perception of time (Roseboom et al., 2019; Sherman et al., 2022), highlighting the interdependence of memory and temporal cognition."

## 3. EM-LLM: LLM with Episodic Memory

This section presents the core contribution of the paper: the EM-LLM architecture and its components.

### 3.1 Architecture

The EM-LLM architecture divides the context into three distinct groups:

1. Initial tokens
2. Evicted tokens
3. Local context

Quote: "EM-LLM is designed to be applied directly to pre-trained LLMs, enabling them to handle context lengths significantly larger than their original training length. Our architecture divides the context into three distinct groups: initial tokens, evicted tokens, and local context."

### 3.2 Memory Formation via Surprise

The authors describe how EM-LLM forms episodic memories using a surprise-based segmentation approach:

1. Surprise is quantified by the negative log-likelihood of observing the current token given the previous tokens.
2. A thresholding mechanism is used to identify potential event boundaries.
3. The threshold adapts to contextual shifts using a moving window approach.

Quote: "Following work on cognitive modelling (Roseboom et al., 2019; Fountas et al., 2022), we employ a thresholding mechanism to perform an initial identification of event boundaries (used for the first time in LLMs)."

### 3.3 Boundary Refinement

After initial segmentation, EM-LLM employs a boundary refinement process to optimize intra-event coherence and inter-event distinctiveness:

1. The similarity matrix between keys is treated as an adjacency matrix.
2. Two graph-clustering metrics are used: modularity and conductance.
3. An iterative algorithm adjusts the initial surprise-based boundaries to optimize these metric functions.

Quote: "Our boundary refinement algorithm iteratively adjusts the initial surprise-based boundaries to optimise these metric functions. While our best results were achieved using modularity, we also include comparisons with conductance-based boundary refinement to provide a comprehensive analysis."

### 3.4 Memory Retrieval

EM-LLM uses a two-stage mechanism for memory retrieval:

1. k-NN search based on dot product similarity to retrieve events for the similarity buffer.
2. A contiguity buffer to maintain temporal context, implemented as a queue.

Quote: "When inferring a new token, a number of episodic events are selected and become a part of the (extended) context window of the underlying LLM. Our memory retrieval process employs a two-stage mechanism to select relevant episodic events for the LLM's context window."

## 4. Experiments

The authors conducted several experiments to evaluate the performance and characteristics of EM-LLM:

### 4.1 Performance of EM-LLM on Long-context Tasks

EM-LLM was compared to the state-of-the-art InfLLM model on the LongBench dataset:

1. EM-LLM improved on InfLLM in all but one task.
2. The best method achieved an overall increase in performance of 1.8 percentage points (a relative improvement of 4.3%).
3. A substantial improvement (up to 33%) was observed on the PassageRetrieval task.

Quote: "Results on the LongBench dataset (Table 1) show that our method is able to improve on InfLLM in all but one task, with the best method achieving an overall increase in performance of 1.8 percentage points (a relative improvement of 4.3%)."

### 4.2 Humans and LLM Surprise Cluster Similar Tokens Together

The authors compared various event segmentation methods, including human event segmentation data:

1. Human-perceived events achieved significantly higher scores in similarity metrics compared to fixed or random events.
2. Surprise-only segmentation achieved very similar results to humans.
3. The addition of the refinement algorithm significantly improved performance.

Quote: "As shown in Fig. 3A, human-perceived events achieve significantly higher scores in similarity metrics compared to fixed or random events, suggesting that surprise is indeed an important factor for humans in their own perception of events."

### 4.3 Comparing Segmentation Methods

The authors compared different segmentation methods using various metrics:

1. Surprise-based segmentation with refinement provided the best results in terms of event similarity metrics.
2. The initial segmentation with a surprise threshold was crucial to achieving the best possible balance in intra-/inter-similarity.

Quote: "Looking at Table 2, it is clear that surprise-based segmentation with refinement (SM, SC) provides the best results in terms of event similarity metrics, regardless of the base LLM used."

### 4.4 Similarity, Contiguity, Recency, and Temporal Order

The authors analyzed the effects of different components of EM-LLM:

1. Refinement had a strong positive impact on improving similarity metrics.
2. The addition of the contiguity buffer achieved the best performance on some tasks.
3. The methods were generally complementary, achieving the best overall performance when combined.

Quote: "As demonstrated in Tables 1 and 2, along with Fig. 3, each of our ablations show various positive improvements on InfLLM (also see Appendix A.1). As mentioned in Section 4.3, refinement has a strong positive impact in improving our similarity metrics."

## 5. Discussion

The discussion section explores the implications of the research findings and potential future directions:

1. The surprise-based segmentation and boundary refinement processes in EM-LLM mirror key aspects of human event perception and memory formation.
2. The architecture of EM-LLM invites comparisons to cognitive models of human memory beyond episodic memory.
3. Future work could explore more sophisticated segmentation or clustering algorithms to improve EM-LLM's performance.

Quote: "Our results add to this growing body of evidence, demonstrating that LLM-based surprise can serve as a proxy for human event segmentation, in multiple levels of hierarchical abstraction, and that the resulting event structure in EM-LLM's attention heads correlates strongly with human-perceived events."

## 6. Conclusion

The conclusion summarizes the main contributions of the paper and highlights the potential impact of EM-LLM:

1. EM-LLM integrates key aspects of human episodic memory and event cognition into transformer-based language models.
2. The approach enables LLMs to process and utilize information from vastly extended contexts.
3. EM-LLM demonstrates superior performance on long-context tasks compared to state-of-the-art models.
4. The method requires no pre-training and can be readily applied to existing LLMs.

Quote: "By bridging insights from cognitive science with machine learning, our approach not only enhances the performance of LLMs on long-context tasks but also provides a scalable computational framework for testing hypotheses about human memory. We hope this study will inspire the community to expand research on the intersection between LLMs and human memory mechanisms."

## 7. Appendix / Supplemental Material

The appendix provides additional details on the experiments and analyses:

1. Supplementary figures showing ablation studies and performance comparisons
2. Complexity analysis of the EM-LLM algorithm
3. Analysis of human data used in the experiments
4. Proof of the approximate equivalence of k-Nearest Neighbors and softmax attention

Quote: "Here we will attempt to show that using a k-NN retrieval in a key-value cache as part of the attention mechanism in transformers is an approximation of applying softmax attention over the entire sequence of tokens."
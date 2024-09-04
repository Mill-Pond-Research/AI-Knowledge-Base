HybridRAG: Integrating Knowledge Graphs and Vector Retrieval Augmented Generation for Efficient Information Extraction

Authors: Bhaskarjit Sarmah, Benika Hall, Rohan Rao, Sunil Patel, Stefano Pasquali, Dhagash Mehta

Table of Contents:
1. Document Overview
2. Introduction
3. Prior Work and Contribution
4. Methodology
   4.1 VectorRAG
   4.2 Knowledge Graph Construction
   4.3 GraphRAG
   4.4 HybridRAG
5. Data Description
6. Implementation Details
   6.1 Knowledge Graph Construction
   6.2 VectorRAG
   6.3 GraphRAG
   6.4 HybridRAG
7. Results
8. Conclusion and Future Directions
9. Acknowledgement
10. References
11. Terminology and Definitions

1. Document Overview

This knowledge base entry is based on a research paper that introduces a novel approach called HybridRAG for efficient information extraction from financial documents. The paper presents a comparative analysis of different Retrieval Augmented Generation (RAG) techniques, including VectorRAG, GraphRAG, and the proposed HybridRAG. The study focuses on improving the performance of large language models (LLMs) in extracting and interpreting complex information from unstructured financial texts.

The document is significant in the field of natural language processing and financial data analysis, as it addresses the challenges of using pre-trained models to extract information from financial documents outside their training data while reducing hallucination. The proposed HybridRAG approach combines the strengths of both Knowledge Graphs (KGs) and advanced language models, representing a significant advancement in information extraction from financial documents.

2. Introduction

The introduction section provides context for the research and outlines the challenges faced in extracting information from unstructured financial data. 

<quote>Extraction and interpretation of intricate information from unstructured text data arising in financial applications, such as earnings call transcripts, present substantial challenges to large language models (LLMs) even using the current best practices to use Retrieval Augmented Generation (RAG) (referred to as VectorRAG techniques which utilize vector databases for information retrieval) due to challenges such as domain specific terminology and complex formats of the documents.</quote>

The authors introduce their novel approach, HybridRAG, which combines Knowledge Graphs (KGs) based RAG techniques (called GraphRAG) and VectorRAG techniques. They claim that this approach enhances question-answer (Q&A) systems for information extraction from financial documents and is capable of generating accurate and contextually relevant answers.

The introduction also mentions the experimental setup:

<quote>Using experiments on a set of financial earning call transcripts documents which come in the form of Q&A format, and hence provide a natural set of pairs of ground-truth Q&As, we show that HybridRAG which retrieves context from both vector database and KG outperforms both traditional VectorRAG and GraphRAG individually when evaluated at both the retrieval and generation stages in terms of retrieval accuracy and answer generation.</quote>

3. Prior Work and Contribution

This section discusses the existing research in the field and highlights the unique contributions of this study. The authors acknowledge previous work on RAG techniques and their limitations when applied to financial documents.

<quote>To the best of our knowledge the present work is the first work that proposes a RAG approach that is hybrid of both VectorRAG and GraphRAG and demonstrates its potential of more effective analysis and utilization of financial documents by leveraging the combined strengths of VectorRAG and GraphRAG.</quote>

The authors also mention their use of a novel ground-truth Q&A dataset:

<quote>We also utilize a novel ground-truth Q&A dataset extracted from publicly available financial call transcripts of the companies included in the Nifty-50 index which is an Indian stock market index that represents the weighted average of 50 of the largest Indian companies listed on the National Stock Exchange.</quote>

4. Methodology

The methodology section is divided into four main parts: VectorRAG, Knowledge Graph Construction, GraphRAG, and HybridRAG.

4.1 VectorRAG

VectorRAG is described as a traditional RAG technique that uses vector databases for information retrieval. The process involves:

1. Dividing external documents into chunks
2. Converting chunks into embeddings using an embeddings model
3. Storing embeddings in a vector database
4. Performing similarity searches to retrieve relevant chunks
5. Using retrieved chunks as context for the language model to generate responses

4.2 Knowledge Graph Construction

The paper outlines the process of constructing Knowledge Graphs (KGs) from given documents. The main steps involve:

1. Knowledge Extraction: Extracting structured information from unstructured or semi-structured data
2. Knowledge Improvement: Enhancing the quality and completeness of the KG

<quote>We utilized a robust methodology for creating KG triplets from unstructured text data, specifically focusing on corporate documents such as earnings call transcripts, adapted from Ref. [18?]. This process involves several interconnected stages, each designed to extract, refine, and structure information effectively.</quote>

4.3 GraphRAG

GraphRAG is described as a KG-based RAG technique. The process involves:

1. Constructing a KG from knowledge triplets extracted from corporate documents
2. Using the GraphQAChain class from LangChain to combine the KG with an LLM
3. Traversing the KG to find relevant information
4. Using the language model to formulate coherent answers based on the retrieved context

4.4 HybridRAG

The proposed HybridRAG technique combines VectorRAG and GraphRAG:

<quote>For the proposed HybridRAG technique, we propose to integrate the aforementioned two distinct RAG techniques: VectorRAG and GraphRAG. This integration involves a systematic combination of contextual information retrieved from both the traditional vector-based retrieval mechanism and the KG-based retrieval system, the latter of which was constructed specifically for this study.</quote>

5. Data Description

The authors describe their dataset, which consists of earnings call transcripts from Nifty 50 constituents:

<quote>We used transcripts from earnings calls of Nifty 50 constituents for our analysis. The NIFTY 50 is popular index in the Indian stock market that represents the weighted average of 50 of the largest Indian companies listed on the National Stock Exchange (NSE).</quote>

Key statistics of the dataset include:
- Number of companies/documents: 50
- Average number of pages: 27
- Average number of questions: 16
- Average number of tokens: 60,000

6. Implementation Details

This section provides specific details on how each component of the methodology was implemented.

6.1 Knowledge Graph Construction

The authors describe a two-tiered language model chain for content refinement and information extraction:

<quote>We implement a two-tiered LLM chain for content refinement and information extraction. The first tier employs an LLM to generate an abstract representation of each document chunk. This refinement process is crucial as it distills the essential information while preserving the original meaning and key relationships between concepts that serves as a more focused input for subsequent processing, enhancing the overall efficiency and accuracy of our triplet extraction pipeline.</quote>

6.2 VectorRAG

The VectorRAG implementation uses:
- Pinecone vector database
- OpenAI's text-embedding-ada-002 model for vectorization
- LangChain framework for the Q&A pipeline
- GPT-3.5-turbo model for language processing

6.3 GraphRAG

The GraphRAG implementation uses:
- NetworkxEntityGraph class from LangChain to create and manage the graph structure
- GraphQAChain class from LangChain for Q&A functionality
- GPT-3.5-turbo as the language model

6.4 HybridRAG

The HybridRAG implementation combines contexts from VectorRAG and GraphRAG:

<quote>For the proposed HybridRAG technique, upon obtaining all the contextual information from VectorRAG and GraphRAG, we concatenate these contexts to form a unified context utilizing both techniques. This combined context is then fed into the answer generator model to produce a response.</quote>

7. Results

The results section presents a comparative analysis of VectorRAG, GraphRAG, and HybridRAG. The evaluation metrics used include:
- Faithfulness
- Answer relevancy
- Context precision
- Context recall

Key findings:
<quote>Overall, these results suggest that GraphRAG offers improvements over VectorRAG, particularly in faithfulness and context precision. Furthermore, HybridRAG emerges as the most balanced and effective approach, outperforming both VectorRAG and GraphRAG in key metrics such as faithfulness and answer relevancy, while maintaining high context recall.</quote>

8. Conclusion and Future Directions

The conclusion summarizes the main findings and contributions of the research:

<quote>In the present work, we have introduced a novel approach that significantly advances the field of information extraction from financial documents through the development of a hybrid RAG system. This system, called HybridRAG, which integrates the strengths of both Knowledge Graphs (KGs) and advanced language models, represents a leap forward in our ability to extract and interpret complex information from unstructured financial texts.</quote>

Future directions suggested include:
- Expanding the system to handle multi-modal inputs
- Incorporating numerical data analysis capabilities
- Developing more sophisticated evaluation metrics
- Exploring integration with real-time financial data streams

9. Acknowledgement

The authors acknowledge Emma Lind for her support in the collaboration.

10. References

The paper includes 35 references to related work in the fields of artificial intelligence, natural language processing, and financial data analysis.

11. Terminology and Definitions

<definition>Retrieval Augmented Generation (RAG)</definition>: A technique that improves the performance of large language models by incorporating relevant retrieval mechanisms.

<definition>VectorRAG</definition>: A traditional RAG technique that uses vector databases for information retrieval.

<definition>GraphRAG</definition>: A RAG technique that leverages Knowledge Graphs (KGs) to enhance the performance of NLP tasks.

<definition>HybridRAG</definition>: The proposed approach that combines VectorRAG and GraphRAG techniques.

<definition>Knowledge Graph (KG)</definition>: A structured representation of knowledge through entities and relationships.

<definition>Large Language Model (LLM)</definition>: Advanced AI models trained on vast amounts of text data, capable of generating human-like text and performing various language tasks.

<definition>Faithfulness</definition>: A metric that measures the extent to which the generated answer can be inferred from the provided context.

<definition>Answer Relevancy</definition>: A metric that assesses how well the generated answer addresses the original question.

<definition>Context Precision</definition>: A metric used to evaluate the relevance of retrieved context chunks in relation to a specified ground truth for a given question.

<definition>Context Recall</definition>: A metric used to evaluate how well the retrieved context aligns with the ground truth answer.
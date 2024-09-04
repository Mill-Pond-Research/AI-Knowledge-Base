# APEER: Automatic Prompt Engineering Enhances Large Language Model Reranking

## Table of Contents

1. Introduction
2. Related Works
   2.1 Prompt Engineering
   2.2 LLMs for Information Retrieval
3. Method
   3.1 Problem Formulation
   3.2 Build Training Dataset
   3.3 Prompt Initialization
   3.4 Feedback Optimization
   3.5 Preference Optimization
4. Experiments
   4.1 Implementation Details
   4.2 Superior Performance
   4.3 In-depth Dissection of APEER
5. Conclusion
6. Limitations
7. Ethics Statement

## 1. Introduction

<introduction>
This knowledge base document is based on a research paper that introduces APEER (Automatic Prompt Engineering Enhances LLM Reranking), a novel approach to optimize prompts for large language models (LLMs) in the context of information retrieval, specifically for reranking tasks. The document serves as a comprehensive guide for researchers, practitioners, and AI enthusiasts interested in improving the performance of LLMs in relevance ranking tasks.

The integration of LLMs into information retrieval systems represents a significant advancement in the field, offering potential improvements in search accuracy and relevance. This knowledge base aims to bridge the gap between theoretical prompt engineering and its practical application in reranking tasks, providing readers with the foundational concepts, methodologies, and experimental results crucial for understanding and implementing APEER.

Key aspects covered in this document include:
- The challenges of manual prompt engineering for LLMs in reranking tasks
- The novel APEER algorithm for automatic prompt optimization
- Experimental results demonstrating APEER's performance across various datasets and LLM architectures
- Analysis of APEER's transferability and effectiveness in different scenarios
- Ethical considerations and limitations of the approach
</introduction>

## 2. Related Works

### 2.1 Prompt Engineering

<prompt_engineering>
Prompt engineering has emerged as a crucial technique for effectively utilizing large language models (LLMs) across various natural language processing tasks. The document highlights several key aspects of prompt engineering:

1. Manual Prompt Engineering:
   - Requires substantial human effort and expertise
   - Often relies on subjective and limited guidelines
   - Can achieve impressive results but is time-consuming and potentially suboptimal

2. Automatic Prompt Engineering:
   - Aims to generate and select prompts autonomously
   - Reduces human effort in prompt design
   - Has shown impressive performance in tasks such as language modeling and classification

3. Challenges in IR Domain:
   - The impact of automatic prompt engineering in Information Retrieval (IR), particularly for zero-shot passage relevance ranking, has been less studied
   - Relevance ranking presents unique challenges compared to language modeling and classification tasks

Quote: "Despite impressive performance, current zero-shot relevance ranking with LLMs heavily relies on human prompt engineering. Existing automatic prompt engineering algorithms primarily focus on language modeling and classification tasks, leaving the domain of IR, particularly reranking, underexplored."

The document emphasizes that directly applying current prompt engineering algorithms to relevance ranking is challenging due to:
- The integration of query and long passage pairs in the input
- The ranking complexity surpassing that of classification tasks

These challenges motivate the development of APEER as a specialized approach for automatic prompt engineering in the context of reranking tasks.
</prompt_engineering>

### 2.2 LLMs for Information Retrieval

<llms_for_ir>
The document discusses the significant impact of Large Language Models (LLMs) on the field of Information Retrieval (IR):

1. LLMs in IR:
   - LLMs have demonstrated remarkable efficacy in IR tasks
   - They enhance IR systems in multiple modules, attracting increasing interest from researchers and practitioners

2. Relevance Ranking:
   - Described as the most critical problem in IR
   - Typically consists of an initial, cost-effective retriever followed by a sophisticated reranker

3. Traditional Supervised Reranking:
   - Often relies on fine-tuning transformer-based models
   - Requires extensive training data, such as MS MARCO

4. Zero-shot Relevance Ranking with LLMs:
   - Recent research has explored zero-shot approaches, which don't require task-specific fine-tuning
   - These methods can be categorized into two main approaches:

     a) Synthetic Data Generation:
     - Generating text embeddings using GPT for dense retrieval
     - Generating pseudo-documents for retrieval

     b) Relevance Ranking:
     - Generating relevance proxy tokens for ranking
     - Comparing the relevancies of two documents for a given query
     - Zero-shot permutation generation method to reorder document relevance collectively

Quote: "RankGPT (Sun et al., 2023) employs a zero-shot permutation generation method to reorder document relevance collectively and achieve improvements than RG and PRP using GPT4."

The document highlights that while these zero-shot approaches have shown promising results, they still rely heavily on manual prompt engineering, which motivates the development of automatic prompt optimization techniques like APEER.
</llms_for_ir>

## 3. Method

### 3.1 Problem Formulation

<problem_formulation>
The document formalizes the reranking optimization problem in the context of Information Retrieval (IR) systems. The key components of this formulation are:

1. Two-stage IR Pipeline:
   - First-stage retriever (e.g., BM25)
   - Second-stage reranker

2. Process:
   - For a given query q sampled from a query distribution Q
   - The retriever returns a list of l candidate passages P = {P1, P2, ..., Pl} from the original corpus D
   - The reranker refines the relevance order of P to q

3. Mathematical Formulation:
   The reranking optimization problem is expressed as:

   max E(q,P,r)∈(Q,D,R) M(f([q, P]; p), r)

   Where:
   - R is the standard relevance mapping set
   - r ∈ R indicates the standard relevance order between q and P
   - f is an LLM
   - M is a predefined metric (e.g., normalized Discounted Cumulative Gain, nDCG)
   - p is the text prompt concatenated with q and P during inference

Quote: "In APEER, we focus on improving the second-stage reranking performance with a fixed retriever, formulating the reranking optimization problem as: max E(q,P,r)∈(Q,D,R) M(f([q, P]; p), r)"

This formulation sets the stage for APEER's approach to optimizing the prompt p to enhance the performance of the LLM f in the reranking task.
</problem_formulation>

### 3.2 Build Training Dataset

<build_training_dataset>
The document describes the process of building a training dataset for APEER, addressing the challenge of working with large corpus datasets typically used in passage reranking. The key steps in this process are:

1. Sampling Queries:
   - Randomly sample a subset of queries from the standard training split in current benchmarks (e.g., MS MARCO v1 training split)

2. Identifying Relevant Passages:
   - For each sampled query q:
     a) Use the standard relevance mapping set R to find up to 10 positively relevant passages (relevance score > 0)
     b) Add these passages to the candidate passages set P for query q

3. Finding Negatively Relevant Passages:
   - Use BM25 to retrieve the top 100 candidate passages most relevant to q
   - Select the top passages with a relevance score of zero to q
   - Add these to P

4. Finalizing the Passage Set:
   - The final size of P for each query is 20
   - Randomly shuffle the passage order in P

5. Recording Relevance Mapping:
   - Record the relevance mapping r between q and P

6. Creating the Training Dataset:
   - Add (q, P, r) to the training dataset Dtrain = {(qi, Pi, ri)}n i=1

7. Building the Validation Dataset:
   - Follow the same procedure to create a validation dataset Dval = {(qi, Pi, ri)}m i=1

Quote: "To build the training dataset Dtrain, we first randomly sample a subset of queries from the standard training split in current benchmarks, such as the MS MARCO v1 training split (Bajaj et al., 2016)."

This approach allows APEER to work with a manageable subset of data while still capturing the essential characteristics of the full corpus, enabling efficient training and evaluation of the prompt engineering process.
</build_training_dataset>

### 3.3 Prompt Initialization

<prompt_initialization>
The document outlines the process of initializing prompts for APEER, which is crucial due to the infinitely large search space of possible prompts. The initialization process involves creating two sets of prompts:

1. Positive Prompts Set (Hpos):
   - Utilizes the current state-of-the-art (SoTA) manual prompt as the initial positive prompt ppos
   - Various manual prompts have been proposed for zero-shot passage reranking:
     a) Pointwise (Sachan et al., 2022; Liang et al., 2022)
     b) Pairwise (Qin et al., 2023)
     c) Listwise (Sun et al., 2023; Ma et al., 2023)
   - The document chooses the manual prompt from RankGPT (Sun et al., 2023) due to its superior performance

2. Negative Prompts Set (Hneg):
   - Leverages a pretrained LLM to generate prompt examples
   - Chooses the prompt that performs poorly on the validation dataset Dval as the initial negative prompt pneg

3. Evaluation:
   - Both ppos and pneg are evaluated on all queries in Dval to determine their performance

4. Initialization:
   - The positive prompt is initialized as the current prompt p = pinit = ppos

The initialization process results in:
Hpos = {ppos}
Hneg = {pneg}

Quote: "Due to the infinitely large search space, finding the optimal prompts from scratch can be extremely difficult. In APEER, we construct two initialized prompt sets to guide our optimization procedure: a positive prompts set Hpos and a negative prompts set Hneg."

This initialization strategy provides APEER with a starting point that leverages existing knowledge (through the SoTA manual prompt) while also establishing a baseline for poor performance (through the negative prompt). This approach helps guide the subsequent optimization process towards more effective prompts for reranking tasks.
</prompt_initialization>

### 3.4 Feedback Optimization

<feedback_optimization>
The document describes the Feedback Optimization process in APEER, which is designed to refine the current prompt based on its performance. This process involves several steps:

1. Forward Pass:
   - Infer the current prompt p on a batch of data B = {(qi, Pi, ri)}k i=1 using the LLM f
   - Obtain the responses S = {si}k i=1
   - Expressed mathematically as: si = f([qi, Pi]; p)

2. Backward Pass (Gradient):
   - Utilize the LLM f to generate high-quality feedback on the current prompt
   - Consider queries, passages, responses, and the relevance mapping
   - Expressed as: bi = f([p, qi, Pi, si, ri]; cfb)
   - Where bi is the feedback and cfb is the meta prompt for feedback generation

3. Prompt Refinement:
   - Apply the obtained gradients to the current prompt
   - Generate a refined prompt based on the feedback
   - Expressed as: p′ = f([p, {bi}k i=1]; cg)
   - Where p′ is the refined prompt and cg is the meta prompt for prompt refinement

4. Evaluation:
   - Evaluate the refined prompt p′ on the validation dataset Dval
   - If p′ achieves higher performance than pinit, add it to Hpos
   - Otherwise, add it to Hneg

Quote: "To update the current prompt p and obtain refined prompts, we first infer it on a batch of data B = {(qi, Pi, ri)}k i=1 using the LLM f and obtain the responses S = {si}k i=1, which constitutes the 'forward' pass."

This Feedback Optimization process allows APEER to iteratively improve the prompt based on its performance on actual reranking tasks. By generating and incorporating feedback, the system can identify and address weaknesses in the current prompt, leading to more effective prompts for reranking.
</feedback_optimization>

### 3.5 Preference Optimization

<preference_optimization>
The document introduces Preference Optimization as a novel component of APEER, designed to further refine prompts by learning from both positive and negative examples. This process is inspired by techniques such as Direct Preference Optimization and Reinforcement Learning with Human Feedback (RLHF). The key aspects of Preference Optimization are:

1. Objective:
   - Refine the prompt p′ to bias it towards the optimal prompt contained in Hpos
   - Steer away from negative examples in Hneg

2. Process:
   - Align each refined prompt p′ with a high-quality prompt in Hpos
   - Utilize pairs of positive and negative prompts (ppos, pneg) for demonstration purposes
   - Select the top t positive prompts from Hpos and the bottom t prompts from Hneg as demonstration pairs

3. Generation of New Prompt:
   - Generate a new prompt p′′ that exhibits a preference for positive prompts while avoiding negative ones
   - Expressed mathematically as: p′′ = f([p′, {(ppos, pneg)}]; cpre)
   - Where cpre denotes the meta prompt for optimizing prompt preferences

4. Evaluation and Categorization:
   - Evaluate the performance of p′′ relative to the baseline initialization prompt pinit on the validation dataset Dval
   - Categorize p′′ into either Hpos or Hneg based on its performance

5. Balance:
   - Maintain a balanced ratio of 1:1 between prompts generated through feedback optimization and preference optimization

Quote: "Within the framework of APEER, we have cataloged a collection of potential positive and negative responses within Hpos and Hneg, respectively. Our objective is to refine the prompt p′ such that it is biased towards the optimal prompt contained in Hpos."

The document emphasizes that Preference Optimization serves as a global optimizer, complementing the local optimization achieved through Feedback Optimization. By learning from both positive and negative examples across the dataset, Preference Optimization helps align locally optimized prompts with superior global prompts identified in Hpos.

This dual optimization approach allows APEER to generate prompts that are not only effective for specific instances but also generally perform well across a range of reranking tasks.
</preference_optimization>

## 4. Experiments

### 4.1 Implementation Details

<implementation_details>
The document provides comprehensive information about the experimental setup used to evaluate APEER. Key details include:

1. Models:
   - Closed-source: GPT3.5-Turbo-0301 and GPT4-0613
   - Open-source: LLaMA3-70B and Qwen2-72B

2. Benchmarks:
   a) TREC:
      - Test sets from TREC-DL19 and TREC-DL20 competitions
      - Both use MS MARCO v1 passage corpus
   
   b) BEIR:
      - Eight tasks selected:
        i) Covid: retrieves scientific articles for COVID-19-related questions
        ii) NFCorpus: biomedical information retrieval dataset
        iii) Signal: retrieves relevant tweets for a given news title
        iv) News: retrieves relevant news articles for news headlines
        v) Robust04: evaluates poorly performing topics
        vi) Touche: argument retrieval dataset
        vii) DBPedia: retrieves entities from the DBpedia corpus
        viii) SciFact: retrieves evidence for scientific claim verification

3. Baselines:
   - BM25: fundamental sanity check using first-stage retrieval results
   - Manual Prompt: current state-of-the-art (SoTA) manual prompt from RankGPT
   - CoT: manual prompt concatenated with "Let's think step by step"
   - Paraphrase: LLM-generated paraphrase of the manual prompt

4. Training and Evaluation:
   - Training and validation datasets constructed using queries sampled from MS MARCO v1 training split
   - Default number of queries: 100
   - Positive prompt initialization: SoTA manual prompt from RankGPT
   - Evaluation metric: normalized Discounted Cumulative Gain (nDCG) at rank cutoffs of {1,5,10}
   - Results averaged over three runs

Quote: "We evaluate zero-shot performance using normalized Discounted Cumulative Gain (nDCG) at rank cutoffs of {1,5,10} (nDCG@{1,5,10}) and the results are averaged over three runs."

The document notes some important distinctions in their experimental setup:
- Use of Azure API for GPT4-0613, which differs from GPT4-0314 used in RankGPT
- RankGPT's use of GPT4 to rerank top 30 passages initially reranked by GPT3.5 on BEIR

These implementation details provide a clear and comprehensive overview of the experimental setup, allowing for reproducibility and comparison with other methods in the field of LLM-based reranking.
</implementation_details>

### 4.2 Superior Performance

<superior_performance>
The document presents extensive experimental results demonstrating the superior performance of APEER across various scenarios. The key findings are organized into three categories:

1. In-domain Results:
   - APEER generates superior prompts compared to baselines across diverse architectures (GPT4, LLaMA3, Qwen2)
   - Consistently outperforms Chain-of-Thought (CoT) and direct paraphrasing
   - In some cases, a weaker model with APEER outperforms a stronger model with manual prompts
   - GPT4 with APEER achieves the best performance across all prompting methods, models, and datasets

Quote: "APEER is capable of generating superior prompts compared to baselines across diverse architectures, effectively enhancing the initialized manual prompts. For example, it achieves {5.05, 1.71, 1.12} higher nDCG@{1, 5, 10} on LLaMA3 and DL19 than manual prompts."

2. Transferability Across Datasets:
   - APEER trained on MS MARCO samples shows superior performance on out-of-domain BEIR datasets
   - Consistent improvements across eight BEIR datasets and three model architectures
   - Average nDCG@10 improvements of {1.07, 5.29, 1.84} over manual prompts for GPT4, LLaMA3, and Qwen2, respectively

Quote: "APEER consistently achieves the best performance across eight BEIR datasets and three model architectures. Notably, APEER shows average nDCG@10 improvements of {1.07, 5.29, 1.84} over manual prompts for GPT4, LLaMA3, and Qwen2, respectively."

3. Transferability Across Models:
   - Prompts trained on one model architecture using APEER can be effectively transferred to models with different architectures
   - Prompts from a strong model (e.g., GPT4) can be transferred to a significantly weaker model (e.g., GPT3.5) with consistent performance improvements
   - Prompts trained on comparable models (e.g., Qwen2 to LLaMA3) also show significant performance improvements when transferred

Quote: "APEER prompts can transfer across models with comparable performance. For instance, prompts trained on Qwen2 achieve significant performance improvements over manual prompts when applied to LLaMA3."

These results highlight the effectiveness of APEER in generating high-quality prompts that not only perform well on in-domain tasks but also demonstrate strong transferability across different datasets and model architectures. This transferability enhances the practical utility of APEER in real-world applications, where adaptability to various scenarios is crucial.
</superior_performance>

### 4.3 In-depth Dissection of APEER

<apeer_dissection>
The document provides an in-depth analysis of APEER's components and performance characteristics. This dissection focuses on three key aspects:

1. Preference Optimization:
   - Experiments conducted using LLaMA3 trained on MS MARCO samples
   - Comparison of APEER with and without Preference Optimization
   - Results show that Preference Optimization is effective in improving performance
   - APEER without Preference Optimization still outperforms baselines, indicating the overall effectiveness of the approach

Quote: "APEER with Preference Optimization achieves higher performance than APEER without it. APEER without Preference Optimization still produces better prompts than baselines, further indicating the overall effectiveness of APEER."

2. Impact of Training Dataset Size:
   - Experiments conducted with varying numbers of queries in the training dataset
   - Results show that as the training dataset size increases, APEER achieves better performance
   - Default setting uses a training dataset size of 100 to balance superior prompt generation with moderate training costs
   - Further increasing dataset size may improve performance but also escalates training costs

Quote: "In our default setting, we utilize a training dataset size of 100 to attain superior prompts while maintaining moderate training costs. Further increasing the dataset size may improve performance, but it will also escalate training costs."

3. Qualitative Analysis:
   - Provides examples of APEER's training responses on LLaMA3
   - During Feedback Optimization:
     * LLM provides feedback on the quality of the original prompt (e.g., "lack of specificity", "ambiguity in format")
     * Prompt is refined based on this feedback
   - In Preference Optimization:
     * LLM further refines the prompt based on preference alignment with positive prompts
     * New prompt is generated that mutates the current prompt toward the positive prompt

Quote: "During Feedback Optimization, the LLM provides feedback on the quality of the original prompt, such as noting 'lack of specificity' and 'ambiguity in format', and refines the prompt based on this feedback. In Preference Optimization, the LLM further refines the prompt based on preference alignment with the positive prompt while disfavoring the negative one."

This in-depth dissection provides valuable insights into the inner workings of APEER, demonstrating how each component contributes to its overall effectiveness. The analysis of training dataset size and the qualitative examples offer practical considerations for implementing and fine-tuning APEER in various scenarios.
</apeer_dissection>

## 5. Conclusion

<conclusion>
The document concludes by summarizing the key contributions and findings of the APEER research:

1. Novel Approach:
   - APEER is presented as a new automatic prompt engineering algorithm specifically designed for passage relevance ranking
   - It aims to reduce human effort in designing prompts for zero-shot LLM reranking and unlock the potential of prompt optimization

2. Methodology:
   - APEER iteratively generates refined prompts through two main processes:
     a) Feedback optimization of current prompts
     b) Preference optimization using positive and negative prompt demonstrations

3. Comprehensive Evaluation:
   - Experiments conducted using multiple LLMs:
     * GPT4
     * GPT3.5
     * LLaMA3
     * Qwen2
   - Evaluation on widely acknowledged benchmarks:
     * TREC
     * BEIR

4. Consistent Performance Improvements:
   - APEER demonstrates consistent performance improvements across various scenarios
   - Shows effectiveness in both in-domain and out-of-domain tasks

5. Transferability:
   - Prompts generated by APEER exhibit transferability across:
     * Diverse datasets
     * Different model architectures

6. Effectiveness of Preference Optimization:
   - The novel prompt preference optimization introduced in APEER is shown to be effective through various investigations

Quote: "A comprehensive investigation using GPT4, GPT3.5, LLaMA3, and Qwen2, along with the widely acknowledged TREC and BEIR benchmarks, consistently demonstrates the performance improvements achieved by APEER. We further illustrate the transferability of prompts generated by APEER across diverse datasets and architectures."

The conclusion emphasizes that APEER represents a significant advancement in automatic prompt engineering for reranking tasks, offering a robust and transferable solution that can potentially improve the performance of LLMs in information retrieval applications.
</conclusion>

## 6. Limitations

<limitations>
The document acknowledges several limitations of the current study on APEER:

1. Limited Exploration of Manual Prompts:
   - The study exclusively investigates the listwise manual prompt from RankGPT (Sun et al., 2023) for initialization
   - Other zero-shot relevance ranking methods are less studied, such as:
     * Pointwise prompts in RG (Liang et al., 2022)
     * Pairwise prompts in PRP (Qin et al., 2023)

2. Focus on Specific First-stage Retriever:
   - The study primarily focuses on BM25 as the first-stage retriever
   - The impact of different first-stage retrievers is not explored, such as:
     * SPLADE++ EnsembleDistil (Formal et al., 2022)

Quote: "Potential limitations of this work include the exclusive investigation of the listwise manual prompt in RankGPT (Sun et al., 2023) for initialization, leaving other zero-shot relevance ranking methods less studied, such as pointwise prompts in RG (Liang et al., 2022) and pairwise prompts in PRP (Qin et al., 2023)."

These limitations suggest potential areas for future research and improvement in the field of automatic prompt engineering for reranking tasks. Exploring a wider range of manual prompts and first-stage retrievers could provide additional insights into the generalizability and robustness of the APEER approach.
</limitations>

## 7. Ethics Statement

<ethics_statement>
The document includes an ethics statement addressing potential risks and ethical considerations associated with the use of Large Language Models (LLMs) in the context of APEER:

1. Adherence to Ethical Guidelines:
   - The research adheres to the ACM Code of Ethics

2. Reproducibility:
   - Efforts are made to ensure reproducibility of the presented results
   - Datasets and models used are publicly accessible

3. Acknowledgment of LLM Risks:
   - Potential risks and harms associated with LLMs are recognized, including:
     * Generation of harmful, offensive, or biased content
     * Proneness to generating incorrect information (hallucinations)

4. Limitations of Studied Models:
   - The document acknowledges that the models studied (GPT4, GPT3.5, LLaMA3, Qwen2) are not exempt from these limitations
   - Previous research has shown that these LLMs suffer from bias, hallucination, and other problems

5. Call for Responsible Use:
   - The importance of responsible and ethical use of LLMs is emphasized
   - Need for further research to mitigate challenges before real-world deployment is highlighted

6. Licensing:
   - The models used in the work are licensed under the terms of OpenAI, LLaMA, and Qwen

Quote: "We recognize that the models studied in this paper are not an exception to these limitations. Previous research has shown that the LLMs used in this study suffer from bias, hallucination, and other problems. We emphasize the importance of responsible and ethical use of LLMs and the need for further research to mitigate these challenges before deploying them in real-world applications."

This ethics statement demonstrates awareness of the broader implications and potential risks associated with LLM research and application. It underscores the need for continued vigilance and research in addressing ethical concerns as these technologies advance and find wider application in fields such as information retrieval.
</ethics_statement>

## 8. Glossary of Terms

<glossary>
1. APEER: Automatic Prompt Engineering Enhances LLM Reranking
2. LLM: Large Language Model
3. IR: Information Retrieval
4. Reranking: The process of refining the order of retrieved documents based on their relevance to a query
5. Zero-shot: Ability to perform a task without specific training on that task
6. Prompt Engineering: The process of designing effective prompts to guide LLM behavior
7. BM25: A popular ranking function used in information retrieval
8. nDCG: Normalized Discounted Cumulative Gain, a metric for evaluating ranking quality
9. TREC: Text REtrieval Conference, a series of workshops focusing on information retrieval research
10. BEIR: Benchmark for Evaluation of Information Retrieval, a heterogeneous dataset for zero-shot evaluation of IR models
11. MS MARCO: Microsoft Machine Reading Comprehension, a large-scale dataset for training and evaluating machine reading comprehension and related tasks
12. GPT: Generative Pre-trained Transformer, a type of large language model
13. LLaMA: Large Language Model Meta AI, an open-source LLM
14. Qwen: An LLM developed by Alibaba
15. CoT: Chain-of-Thought, a prompting technique that encourages step-by-step reasoning
16. RLHF: Reinforcement Learning with Human Feedback, a technique for fine-tuning language models
17. Pointwise Ranking: A ranking approach that considers each document independently
18. Pairwise Ranking: A ranking approach that considers pairs of documents
19. Listwise Ranking: A ranking approach that considers the entire list of documents
20. SPLADE: Sparse Lexical and Expansion Model for Information Retrieval
</glossary>

## 9. References

<references>
1. Achiam, J., et al. (2023). GPT-4 Technical Report. arXiv preprint arXiv:2303.08774.

2. AI@Meta. (2024). Llama 3 Model Card.

3. Bajaj, P., et al. (2016). MS MARCO: A Human Generated Machine Reading Comprehension Dataset. arXiv preprint arXiv:1611.09268.

4. Brown, T., et al. (2020). Language Models are Few-Shot Learners. Advances in Neural Information Processing Systems, 33:1877-1901.

5. Craswell, N., et al. (2020). Overview of the TREC 2019 Deep Learning Track. arXiv preprint arXiv:2003.07820.

6. Formal, T., et al. (2022). From Distillation to Hard Negative Sampling: Making Sparse Neural IR Models More Effective. Proceedings of the 45th International ACM SIGIR Conference on Research and Development in Information Retrieval, 2353-2359.

7. Liang, P., et al. (2022). Holistic Evaluation of Language Models. arXiv preprint arXiv:2211.09110.

8. Ma, X., et al. (2023). Zero-shot Listwise Document Reranking with a Large Language Model. arXiv preprint arXiv:2305.02156.

9. Qin, Z., et al. (2023). Large Language Models are Effective Text Rankers with Pairwise Ranking Prompting. arXiv preprint arXiv:2306.17563.

10. Sachan, D., et al. (2022). Improving Passage Retrieval with Zero-Shot Question Generation. Proceedings of the 2022 Conference on Empirical Methods in Natural Language Processing, 3781-3797.

11. Sun, W., et al. (2023). Is ChatGPT Good at Search? Investigating Large Language Models as Re-Ranking Agents. Proceedings of the 2023 Conference on Empirical Methods in Natural Language Processing, 14918-14937.

12. Thakur, N., et al. (2021). BEIR: A Heterogeneous Benchmark for Zero-shot Evaluation of Information Retrieval Models. Thirty-fifth Conference on Neural Information Processing Systems Datasets and Benchmarks Track.

13. Touvron, H., et al. (2023). Llama: Open and Efficient Foundation Language Models. arXiv preprint arXiv:2302.13971.
</references>
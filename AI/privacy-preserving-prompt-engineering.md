# Privacy Preserving Prompt Engineering: A Comprehensive Knowledge Base

## Table of Contents

1. Introduction
2. Background on Large Language Models
3. Privacy Challenges in Prompting
4. Non-Differential Privacy Methods
5. Local Differential Privacy Methods
6. Global Differential Privacy Methods
7. Other Privacy-Preserving Scenarios
8. Resources for Privacy-Preserving Prompting
9. Limitations and Future Prospects
10. Conclusion
11. Glossary
12. References

## 1. Introduction

This knowledge base document provides a comprehensive overview of privacy-preserving prompt engineering for large language models (LLMs). It is based on the survey paper "Privacy Preserving Prompt Engineering: A Survey" by Kennedy Edemacu and Xintao Wu from the University of Arkansas.

### 1.1 Document Overview

The document explores the critical intersection of privacy concerns and the utilization of large language models, particularly focusing on the emerging field of privacy-preserving prompt engineering. As LLMs continue to demonstrate remarkable capabilities across various natural language processing tasks, the need to protect sensitive information during their use has become increasingly important.

### 1.2 Significance and Relevance

The significance of this topic lies in the growing adoption of LLMs in various applications and the concurrent need to safeguard user privacy. As stated in the introduction:

> "Although interesting, privacy concerns have become a major obstacle in its widespread usage. Multiple studies have examined the privacy risks linked to ICL and prompting in general, and have devised techniques to alleviate these risks."

This knowledge base serves as a crucial resource for researchers, practitioners, and policymakers working at the intersection of artificial intelligence, natural language processing, and privacy protection.

### 1.3 Scope

The document covers:
- An overview of large language models and their capabilities
- Privacy challenges associated with prompting and in-context learning
- Various approaches to privacy-preserving prompt engineering, including:
  - Non-differential privacy methods
  - Local differential privacy methods
  - Global differential privacy methods
  - Other privacy-preserving scenarios
- Resources available for developing privacy-preserving frameworks
- Limitations of current approaches and future research directions

## 2. Background on Large Language Models

### 2.1 Evolution of Language Models

The document provides a historical context for the development of large language models:

> "The recent advancements in pre-trained language models (PLMs) have demonstrated significant capabilities across a wide array of natural language processing (NLP) tasks such as text classification, question answering, sentiment analysis, information retrieval, summarization, etc."

Key milestones in the evolution of language models include:

- Pre-Industrial Era (Before 1760s): Limited to simple signage and word-of-mouth
- Industrial Revolution (1760s-1840s): Rise of mass production and communication
- Golden Age of Print (1840s-1920s): Emergence of advertising agencies and copywriting
- Radio Era (1920s-1950s): Introduction of radio advertising
- Television Age (1950s-1990s): TV becomes the dominant advertising medium
- Digital Revolution (1990s-present): Internet and social media advertising
- Data-Driven Era (2010s-present): Big data and AI enable hyper-personalized advertising

### 2.2 Technological Advancements

Several key technological advancements have fueled the growth of AI and large language models:

- Moore's Law: Exponential increase in data processing capabilities
- Miniaturization: Development of 2-nanometer transistor architectures
- GPU Technology: Introduction of CUDA platform by Nvidia in 2006
- Cloud Computing: Services like Amazon AWS and Microsoft Azure providing on-demand access to computational power

### 2.3 Capabilities of Large Language Models

LLMs have become integral to various business applications:

> "AI has become an integral part of the business toolkit, enabling companies to:
> - Unlock insights from vast amounts of data
> - Drive innovation across industries
> - Enhance decision-making processes
> - Automate repetitive tasks
> - Personalize customer experiences at scale"

### 2.4 In-Context Learning (ICL)

The document introduces the concept of in-context learning, a key feature of modern LLMs:

> "In-context learning (ICL) is another form of prompting proposed along with GPT-3 and includes a few demonstration examples in the prompt. ICL serves as an efficient and effective method for leveraging pre-trained or adapted LLMs to address a variety of downstream tasks without the need to modify the model parameters for each task."

## 3. Privacy Challenges in Prompting

### 3.1 Sensitive Information in Prompts

The use of LLMs through prompting and ICL can inadvertently expose sensitive information:

> "For example, consider using ICL to predict if an individual earns at least $50,000 in a year. To help the LLM form a context and make a better prediction, it is prompted with a demonstration example that might contain sensitive information such as age, salary, and SSN."

### 3.2 Potential Privacy Breaches

The document highlights potential vulnerabilities:

> "Sensitive information of this nature could potentially be accessed by either an untrusted LLM server or an adversarial entity capable of bypassing the API provided by the LLM service provider."

A real-world example of privacy breach is mentioned:

> "Due to vulnerabilities in Redis client open-source library, ChatGPT leaked users' chat history."

### 3.3 Distinction from Training Data Privacy

The authors emphasize that privacy challenges in prompting are distinct from those related to training data:

> "While privacy challenges such as training or fine-tuning data memorization, and their subsequent recovery through model inversion and membership inference attacks have been noticed, they are fundamentally distinct from the privacy challenges posed by ICL."

## 4. Non-Differential Privacy Methods

The document discusses several non-differential privacy methods for preserving privacy in prompt engineering:

### 4.1 Sanitization Methods

Sanitization methods aim to protect the privacy of the prompt by identifying and eliminating sensitive attributes:

> "Data sanitization methods aim to protect the privacy of the prompt in Equation 1. In general, data sanitization techniques aim to identify and eliminate sensitive attributes that contain personally identifiable information (PII) from the data."

Key approaches include:

1. Privacy-Preserving via Text Sanitization (PP-TS):
   > "The proposed Privacy-Preserving via Text Sanitization (PP-TS) framework consists of three modules: a pre-processing privacy protection module that conducts de-identification, an LLM invocation module, and a post-processing privacy recovery module that recovers the original sensitive information."

2. Hide and Seek (HaS):
   > "Chen et al. developed a framework called Hide and Seek (HaS) that comprises two models, hiding private entities (Hide-Model) for anonymization, and seeking private entities (Seek-Model) for de-anonymization."

3. Mixed-scale model collaboration:
   > "Zhang et al. introduced another approach, called mixed-scale model collaboration that combines the capabilities of a large model in the cloud with a small model deployed locally."

### 4.2 Ensemble-Only Methods

These methods focus on safeguarding the privacy of demonstration examples during in-context learning:

> "Duan et al. first studied this privacy leakage through the lens of membership inference attacks (MIAs). The adversary assumes to have access to the prediction probabilities of each possible target class of the test example."

The proposed solution involves aggregating predictions from multiple independent prompted models:

> "To mitigate the privacy risk exposed by prompt membership, [25] proposed to aggregate the prediction probability vectors over multiple independent prompted models into an ensemble prediction."

### 4.3 Obfuscation/Lattice Methods

These methods aim to protect both the prompt and the response:

> "Yao et al. introduced the Instance-Obfuscated Inference (IOI) framework to safeguard both the raw input and output in the black-box inference setting."

Another approach is the LatticeGen framework:

> "Zhang et al. developed the LatticeGen framework that enables a collaborative generation of tokens between the user and the LLM server."

### 4.4 Encryption Methods

Encryption-based methods also protect both the prompt and the response:

> "Lin et al. introduced an emoji encryption based framework called EmojiCrypt. Here, a user's sensitive prompt inputs are encrypted into emojis before sending them to the cloud LLM."

Other frameworks include:

- CipherGPT: "Hou et al. developed the CipherGPT framework for secure two-party inference."
- Iron and THE-X: "Other frameworks such as Iron and THE-X also employ cryptographic techniques to securely perform inference in transformer-based models."

## 5. Local Differential Privacy Methods

Local Differential Privacy (LDP) methods allow users to sanitize their sensitive data locally before sending the sanitized prompt to the untrusted LLM server.

### 5.1 Word Level Perturbation

Several approaches focus on privacy protection at the word or token level:

1. Lyu et al.'s framework:
   > "Lyu et al. proposed a local DP based framework that privatizes each word's representation vector and sequentially replaces sensitive words in the text with semantically similar words."

2. Context-aware private embeddings (CAPE):
   > "Plant et al. developed the context-aware private embeddings (CAPE) approach that extracts the representation of each token from the final representation layer of a pre-trained model, normalizes it with sequence, and adds Laplace noise."

3. TextObfuscator:
   > "Zhou et al. further introduced TextObfuscator that obscures word information while maintaining word functionality through random perturbations applied to clustered representations."

4. Metric LDP approaches:
   > "Feyisetan et al. developed a text perturbation approach to achieve the metric LDP. The metric LDP inherits the idea of local DP to ensure that the outputs of any two adjacent inputs are indistinguishable to protect the original input from being inferred."

### 5.2 Sentence Level Perturbation

Some research works focus on sentence-level privacy:

> "Du et al. initiated a study of sanitizing sentence embeddings to achieve the metric LDP. They proposed two instantiations from the Euclidean and angular distances."

Another approach is DP-Forward:

> "Du et al. considered sentence-level privacy for private fine-tuning. The proposed DP-Forward DP-Forward directly perturbs embedding matrices in the forward pass of PLMs and ensures the standard LDP for test sequences."

### 5.3 Document Level Perturbation

Document-level privacy is addressed by approaches like DP-Prompt:

> "To protect the privacy of the entire prompt during the inference process, Utpala et al. devised DP-Prompt to attain document-level DP. DP-Prompt takes a private document and generates a paraphrased version using zero-shot prompting on a local pre-trained language model."

### 5.4 Demonstration Example Level Perturbation

For tabular data analysis, the LDP-TabICL framework has been introduced:

> "Carey et al. investigated the application of DP mechanisms for private tabular ICL via data privatization prior to serialization and prompting. They introduced the LDP-TabICL framework that employs the randomized response (RR) LDP technique to perturb attribute values of each sample at the each end user side."

## 6. Global Differential Privacy Methods

Global Differential Privacy (GDP) methods focus on protecting the privacy of demonstration examples used in in-context learning.

### 6.1 Sample and Aggregate based Approach

This approach involves partitioning private data and using a local LLM to generate differentially private examples:

> "Tang et al. studied how to conduct in-context learning with LLMs on private datasets and focused on the privacy protection of demonstration examples used in the prompt. Their developed algorithm generates synthetic differentially private few-shot demonstrations from the original private dataset, and uses the generated samples as demonstrations in ICL during inference."

Another framework in this category is Differentially-Private Offset Prompt Tuning (DP-OPT):

> "Hong et al. developed a framework called Differentially-Private Offset Prompt Tuning (DP-OPT). Given the private training dataset Dpriv, DP-OPT uses a few samples as demonstrations to guide a local LLM to generate private prompts."

### 6.2 PATE-Based Approach

The PATE (Private Aggregation of Teacher Ensembles) mechanism has been adapted for privacy-preserving in-context learning:

> "Duan et al. proposed PromptPATE, a privacy-preserving in-context learning framework for discrete prompts based on PATE mechanism. It assumes the existence of a labeled private dataset with labeled examples like ("The book was great", "positive"), and an unlabeled public dataset with examples like ("I enjoyed this movie",-)."

Other PATE-based approaches include:

- SeqPATE: "Tian et al. developed the SeqPATE framework for text generation."
- Prom-PATE: "Li et al. proposed Prom-PATE that explores the benefits of visual prompting in generating image samples with DP noisy labels."

### 6.3 DP Synthetic Data Generation

Several approaches focus on generating differentially private synthetic data:

> "Yue et al. and Flemings et al. fine-tuned a pre-trained generative language model with DP using a private dataset, enabling the models to produce synthetic text with robust privacy protections."

Other methods in this category include:

- Parameter-efficient fine-tuning: "Kurakin et al. chose to perform parameter-efficient fine-tuning on the pre-trained LM using prompt tuning and LoRA."
- Augmented Private Evolution (PE) framework: "Xie et al. considered generating DP synthetic data with only API access to LLMs. They proposed an augmented Private Evolution (PE) framework referred to as AUG-PE."

### 6.4 Soft Prompt via DPSGD

This approach focuses on privately learning soft prompts:

> "Duan et al., developed PromptDPSGP that leverages the DP-SGD algorithm to learn soft prompts that are prepended to an LLM's input with a differential privacy guarantee."

## 7. Other Privacy-Preserving Scenarios

### 7.1 Demonstration Examples at LLMs

This approach involves storing sensitive datasets at the LLM site:

> "Wu et al. proposed a differentially private in-context learning (DP-ICL) paradigm where the sensitive dataset used for demonstrations is stored in the LLM site. The server partitions the sensitive dataset into disjoint subsets, each comprising a collection of demonstration examples."

### 7.2 Data Augmentation using External Datastores

This scenario addresses privacy concerns when leveraging external datastores to improve ICL performance:

> "For PLM users with insufficient local data, leveraging external datastores can improve ICL performance. The final generated prompt may contains sensitive information from both the local data and external datastores."

Approaches in this category include:

- Sanitization methods: "Huang et al. proposed a sanitization method for replacing each privacy-sensitive phrase in the datastore with: (i) < | endoftext | >, (ii) dummy text (e.g., replacing a telephone contact with "012-345-6789"), or (iii) public data (e.g., replacing a telephone contact with a publicly known telephone number)."
- Information flow control (IFC): "Wutschitz et al. developed an IFC-based framework that takes into consideration metadata such as access control policies in designing machine learning systems."

### 7.3 Client Data Protection via Federated Learning

This scenario focuses on protecting client data in visual prompting:

> "Guo et al. proposed the PromptFL framework which is built upon the federated learning mechanism. The PromptFL framework operates on the basis that each client possesses a CLIP foundation model."

Other approaches in this category include:

- Federated adaptive prompt tuning algorithm (FedAPT)
- Personalized FL for client-specific prompt generation (pFedPG)

## 8. Resources for Privacy-Preserving Prompting

### 8.1 Datasets

The document provides an extensive list of datasets used for evaluating privacy-preserving prompting frameworks, categorized by data types and tasks:

1. Text Datasets:
   - Classification: AGNews, DBPedia, TREC, SST-2, MPQA, Disaster, CB, QNLI, MNLI, QQP, BBC
   - Information Extraction: Enron Emails, WikiText, MIT Movies trivia10k13, ACE2005, Elsevier, Arxiv
   - Other NLP Tasks: DocVQA, ConcurrentQA, WritingPrompts, SAMSum, Amazon (beauty)

2. Tabular Datasets:
   - Adult, Bank, Blood, Calhousing, Car, Diabetes, Heart, Jungle

3. Image Datasets:
   - Office-Caltech10, DomainNet, Dermoscopic-FL, CIFAR-10, CIFAR-100, Blood-MNIST

### 8.2 Software Tools

The document mentions several software tools designed for privacy protection during interactions with LLMs:

1. Proprietary Software Tools:
   - Anonos Prompt Protector
   - Prompt Security
   - WhyLabs
   - CalypsoAI Moderator
   - Lakera Guard

2. Open Source Software Tools:
   - LLM Guard
   - Guardrail AI

## 9. Limitations and Future Prospects

The document identifies several limitations in current privacy-preserving prompting frameworks and suggests areas for future research:

### 9.1 Limitations

1. Computational Inefficiency:
   > "Many of the frameworks discussed exhibit computational inefficiency."

2. Semantic Inadequacy:
   > "A good number of the frameworks generate semantically inaccurate texts."

3. Privacy Challenges:
   > "While significant efforts have been dedicated to addressing the privacy challenge, imperfections persist in achieving perfect privacy."

4. Trustworthiness Challenges:
   > "Apart from the aforementioned privacy challenges, issues associated with other trustworthiness aspects also exist."

### 9.2 Future Prospects

1. Computationally Efficient Private Prompting:
   > "Further research is needed to address this challenge."

2. Mitigating Semantic Inadequacy:
   > "Several private prompting techniques suffer from semantic inaccuracies. Further investigations are required to address this challenge."

3. Improving Privacy Protection:
   > "The privacy preservation capabilities of a number of the frameworks can be enhanced."

4. Trustworthy Prompt Engineering:
   > "Future studies are greatly needed to investigate the impact of privacy preserving prompting on LLM's performance from other trustworthiness facets including truthfulness, safety, fairness, and robustness, and develop trustworthy prompt engineering."

5. Extension to Other Modalities:
   > "Investigating the extension of such methodologies to transformer-based foundational models for vision, audio, and video could be a promising avenue for future research."

6. Benchmark Datasets and Open Source Software:
   > "Establishing evaluation benchmarks for privacy-preserving prompting in these NLP tasks would facilitate consistent and measurable progress in the field."

## 10. Conclusion

The document concludes by emphasizing the importance of privacy-preserving prompting in the context of increasing LLM adoption:

> "LLMs have garnered substantial attention from both industry and academia recently. Their standout feature lies in their capability to make predictions when provided with instruction and/or demonstration examples. However, numerous studies have illustrated how malicious entities can exploit this ability to breach privacy, encouraging the development of various frameworks aimed at mitigating this challenge."

The authors highlight the comprehensive nature of their survey and its potential impact:

> "We have systematically structured these frameworks according to the privacy mechanisms they employ. Additionally, we have established connections between the different frameworks based on their respective privacy objectives and methodologies."

They express hope for future advancements in the field:

> "We aspire for this to stimulate increased interest and advancement in the field of privacy-preserving prompting."

This conclusion underscores the critical importance of balancing the immense potential of large language models with the imperative to protect user privacy. As LLMs continue to evolve and find applications in increasingly sensitive domains, the development of robust privacy-preserving techniques will be crucial for their responsible and widespread adoption.

## 11. Glossary

To facilitate a clear understanding of the concepts discussed in this knowledge base, here is a glossary of key terms:

1. Large Language Models (LLMs): Advanced AI models trained on vast amounts of text data, capable of understanding and generating human-like text across a wide range of tasks.

2. In-Context Learning (ICL): A technique where LLMs make predictions based on a few demonstration examples provided in the prompt, without modifying the model's parameters.

3. Prompt: The input text given to an LLM to elicit a specific response or perform a particular task.

4. Differential Privacy (DP): A mathematical framework for quantifying and limiting the amount of information that can be inferred about an individual from the output of a data analysis.

5. Local Differential Privacy (LDP): A variant of DP where data is randomized before it leaves the user's device, ensuring privacy even if the data collector is not trusted.

6. Global Differential Privacy (GDP): A variant of DP where a trusted curator has access to the raw data and applies privacy-preserving mechanisms before releasing the results.

7. Sanitization: The process of removing or modifying sensitive information from data to protect privacy.

8. Obfuscation: The act of making something unclear, obscure, or unintelligible to protect sensitive information.

9. Encryption: The process of encoding information in such a way that only authorized parties can access it.

10. Federated Learning: A machine learning technique that trains algorithms across multiple decentralized devices or servers holding local data samples, without exchanging them.

11. PATE (Private Aggregation of Teacher Ensembles): A framework for privacy-preserving machine learning that uses multiple "teacher" models to train a "student" model without directly exposing the training data.

12. Membership Inference Attack (MIA): An attack that aims to determine whether a particular data point was used to train a machine learning model.

13. Soft Prompt: Learnable continuous vectors that are prepended to the input embeddings of an LLM to guide its behavior for specific tasks.

14. DP-SGD (Differentially Private Stochastic Gradient Descent): A privacy-preserving variant of the SGD optimization algorithm used in machine learning.

15. Homomorphic Encryption: A form of encryption that allows computations to be performed on encrypted data without decrypting it first.

16. Lattice-based Cryptography: A class of cryptographic algorithms based on mathematical lattices, known for their potential resistance to quantum computer attacks.

17. Information Flow Control (IFC): A security mechanism that regulates the transfer of information between different parts of a system or between systems.

18. Synthetic Data: Artificially generated data that mimics the statistical properties of real data without containing actual individual records.

19. Prompt Injection: A type of attack where malicious input is crafted to manipulate the behavior of an LLM.

20. Privacy Budget: In differential privacy, a measure of the amount of privacy loss that is acceptable for a given data analysis task.

## 12. References

The following is a comprehensive list of references cited in the original document, formatted in a consistent citation style:

1. Brown, T., Mann, B., Ryder, N., Subbiah, M., Kaplan, J. D., Dhariwal, P., ... & Agarwal, S. (2020). Language models are few-shot learners. Advances in neural information processing systems, 33, 1877-1901.

2. Liang, P., Bommasani, R., Lee, T., Tsipras, D., Soylu, D., Yasunaga, M., ... & Hashimoto, T. B. (2022). Holistic evaluation of language models. arXiv preprint arXiv:2211.09110.

3. Yu, Y., Zhuang, Y., Zhang, J., Meng, Y., Ratner, A., Krishna, R., ... & Zhang, C. (2023). Large language model as attributed training data generator: A tale of diversity and bias. arXiv preprint arXiv:2306.15895.

4. Zhang, S., Roller, S., Goyal, N., Artetxe, M., Chen, M., Chen, S., ... & Zettlemoyer, L. (2022). OPT: Open pre-trained transformer language models. arXiv preprint arXiv:2205.01068.

5. Achiam, J., Adler, S., Agarwal, S., Ahmad, L., Akkaya, I., Aleman, F. L., ... & Zoph, B. (2023). GPT-4 technical report. arXiv preprint arXiv:2303.08774.

6. Duarte, F. (2023). Number of ChatGPT users (Dec 2023). Exploding Topics. Retrieved from https://explodingtopics.com/blog/chatgpt-users

7. Touvron, H., Lavril, T., Izacard, G., Martinet, X., Lachaux, M. A., Lacroix, T., ... & Lample, G. (2023). LLaMA: Open and efficient foundation language models. arXiv preprint arXiv:2302.13971.

8. Zhang, S., Roller, S., Goyal, N., Artetxe, M., Chen, M., Chen, S., ... & Zettlemoyer, L. (2023). OPT: Open pre-trained transformer language models. URL https://arxiv.org/abs/2205.01068, 3, 19-0.

9. Iyer, S., Lin, X. V., Pasunuru, R., Mihaylov, T., Simig, D., Yu, P., ... & Stoyanov, V. (2022). OPT-IML: Scaling language model instruction meta learning through the lens of generalization. arXiv preprint arXiv:2212.12017.

10. Workshop, B., Scao, T. L., Fan, A., Akiki, C., Pavlick, E., Ilić, S., ... & Webster, K. (2022). BLOOM: A 176B-parameter open-access multilingual language model. arXiv preprint arXiv:2211.05100.

11. Muennighoff, N., Wang, T., Sutawika, L., Roberts, A., Biderman, S., Scao, T. L., ... & Launay, J. (2022). Crosslingual generalization through multitask finetuning. arXiv preprint arXiv:2211.01786.

12. Conover, M., Hayes, M., Mathur, A., Meng, X., Xie, J., Wan, J., ... & Zaharia, M. (2023). Free Dolly: Introducing the world's first truly open instruction-tuned LLM. Databricks. Retrieved from https://www.databricks.com/blog/2023/04/12/dolly-first-open-commercially-viable-instruction-tuned-llm

13. Shanahan, M. (2024). Talking about large language models. Communications of the ACM, 67(2), 68-79.

14. Wei, J., Wang, X., Schuurmans, D., Bosma, M., Xia, F., Chi, E., ... & Zhou, D. (2022). Chain-of-thought prompting elicits reasoning in large language models. Advances in neural information processing systems, 35, 24824-24837.

15. Taylor, R., Kardas, M., Cucurull, G., Scialom, T., Hartshorn, A., Saravia, E., ... & Stojnic, R. (2022). Galactica: A large language model for science. arXiv preprint arXiv:2211.09085.

16. Hu, Z., Lan, Y., Wang, L., Xu, W., Lim, E. P., Lee, R. K. W., ... & Poria, S. (2023). LLM-Adapters: An adapter family for parameter-efficient fine-tuning of large language models. arXiv preprint arXiv:2304.01933.

17. Hu, E. J., Shen, Y., Wallis, P., Allen-Zhu, Z., Li, Y., Wang, S., ... & Chen, W. (2021). LoRA: Low-rank adaptation of large language models. arXiv preprint arXiv:2106.09685.

18. Li, X. L., & Liang, P. (2021). Prefix-tuning: Optimizing continuous prompts for generation. arXiv preprint arXiv:2101.00190.

19. Zheng, H., Shen, L., Tang, A., Luo, Y., Hu, H., Du, B., & Tao, D. (2023). Learn from model beyond fine-tuning: A survey. arXiv preprint arXiv:2310.08184.

20. Zhao, W. X., Zhou, K., Li, J., Tang, T., Wang, X., Hou, Y., ... & Wen, J. R. (2023). A survey of large language models. arXiv preprint arXiv:2303.18223.

21. OpenAI. (2023). March 20 ChatGPT outage: Here's what happened. OpenAI Blog. Retrieved from https://openai.com/blog/march-20-chatgpt-outage

22. Zhang, R., Hidano, S., & Koushanfar, F. (2022). Text revealer: Private text reconstruction via model inversion attacks against transformers. arXiv preprint arXiv:2209.10505.

23. Morris, J. X., Zhao, W., Chiu, J. T., Shmatikov, V., & Rush, A. M. (2023). Language model inversion. arXiv preprint arXiv:2311.13647.

24. Wang, B., Chen, W., Pei, H., Xie, C., Kang, M., Zhang, C., ... & Cardie, C. (2023). DecodingTrust: A comprehensive assessment of trustworthiness in GPT models. arXiv preprint arXiv:2306.11698.

25. Duan, H., Dziedzic, A., Yaghini, M., Papernot, N., & Boenisch, F. (2023). On the privacy risk of in-context learning. In The 61st annual meeting of the association for computational linguistics.

26. Tang, X., Shin, R., Inan, H. A., Manoel, A., Mireshghallah, F., Lin, Z., ... & Sim, R. (2023). Privacy-preserving in-context learning with differentially private few-shot generation. arXiv preprint arXiv:2309.11765.

27. Hong, J., Wang, J. T., Zhang, C., Li, Z., Li, B., & Wang, Z. (2023). DP-OPT: Make large language model your privacy-preserving prompt engineer. arXiv preprint arXiv:2312.03724.

28. Duan, H., Dziedzic, A., Papernot, N., & Boenisch, F. (2023). Flocks of stochastic parrots: Differentially private prompt learning for large language models. arXiv preprint arXiv:2305.15594.

29. Wutschitz, L., Köpf, B., Paverd, A., Rajmohan, S., Salem, A., Tople, S., ... & Rühle, V. (2023). Rethinking privacy in machine learning pipelines from an information flow control perspective. arXiv preprint arXiv:2311.15792.

30. Hu, L., Habernal, I., Shen, L., & Wang, D. (2023). Differentially private natural language models: Recent advances and future directions. arXiv preprint arXiv:2301.09112.

31. Yao, Y., Duan, J., Xu, K., Cai, Y., Sun, E., & Zhang, Y. (2023). A survey on large language model (LLM) security and privacy: The good, the bad, and the ugly. arXiv preprint arXiv:2312.02003.

32. Neel, S., & Chang, P. (2023). Privacy issues in large language models: A survey. arXiv preprint arXiv:2312.06717.

33. Sun, L., Huang, Y., Wang, H., Wu, S., Zhang, Q., Gao, C., ... & Li, X. (2024). TrustLLM: Trustworthiness in large language models. arXiv preprint arXiv:2401.05561.

34. Das, B. C., Amini, M. H., & Wu, Y. (2024). Security and privacy challenges of large language models: A survey. arXiv preprint arXiv:2402.00888.

35. Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez, A. N., ... & Polosukhin, I. (2017). Attention is all you need. Advances in neural information processing systems, 30.

36. Liu, X., Zhang, F., Hou, Z., Mian, L., Wang, Z., Zhang, J., & Tang, J. (2021). Self-supervised learning: Generative or contrastive. IEEE transactions on knowledge and data engineering, 35(1), 857-876.

37. Raffel, C., Shazeer, N., Roberts, A., Lee, K., Narang, S., Matena, M., ... & Liu, P. J. (2020). Exploring the limits of transfer learning with a unified text-to-text transformer. The journal of machine learning research, 21(1), 5485-5551.

38. Liu, P., Yuan, W., Fu, J., Jiang, Z., Hayashi, H., & Neubig, G. (2023). Pre-train, prompt, and predict: A systematic survey of prompting methods in natural language processing. ACM computing surveys, 55(9), 1-35.

39. Qiu, X., Sun, T., Xu, Y., Shao, Y., Dai, N., & Huang, X. (2020). Pre-trained models for natural language processing: A survey. Science china technological sciences, 63(10), 1872-1897.

40. Han, X., Zhang, Z., Ding, N., Gu, Y., Liu, X., Huo, Y., ... & Zhu, J. (2021). Pre-trained models: Past, present and future. AI Open, 2, 225-250.

41. Doddapaneni, S., Ramesh, G., Khapra, M. M., Kunchukuttan, A., & Kumar, P. (2021). A primer on pretrained multilingual language models. arXiv preprint arXiv:2107.00676.

42. Shin, T., Razeghi, Y., Logan IV, R. L., Wallace, E., & Singh, S. (2020). AutoPrompt: Eliciting knowledge from language models with automatically generated prompts. arXiv preprint arXiv:2010.15980.

43. Dong, Q., Li, L., Dai, D., Zheng, C., Wu, Z., Chang, B., ... & Sui, Z. (2022). A survey for in-context learning. arXiv preprint arXiv:2301.00234.

44. Zhou, D., Schärli, N., Hou, L., Wei, J., Scales, N., Wang, X., ... & Le, Q. (2022). Least-to-most prompting enables complex reasoning in large language models. arXiv preprint arXiv:2205.10625.

45. Borgeaud, S., Mensch, A., Hoffmann, J., Cai, T., Rutherford, E., Millican, K., ... & Sifre, L. (2022). Improving language models by retrieving from trillions of tokens. In International conference on machine learning (pp. 2206-2240). PMLR.

46. Yasunaga, M., Bosselut, A., Ren, H., Zhang, X., Manning, C. D., Liang, P. S., & Leskovec, J. (2022). Deep bidirectional language-knowledge graph pretraining. Advances in neural information processing systems, 35, 37309-37323.

47. Wang, B., Ping, W., Xu, P., McAfee, L., Liu, Z., Shoeybi, M., ... & Xiao, C. (2023). Shall we pretrain autoregressive language models with retrieval? A comprehensive study. arXiv preprint arXiv:2304.06762.

48. Dwork, C., McSherry, F., Nissim, K., & Smith, A. (2006). Calibrating noise to sensitivity in private data analysis. In Theory of cryptography conference (pp. 265-284). Springer, Berlin, Heidelberg.

49. Kasiviswanathan, S. P., Lee, H. K., Nissim, K., Raskhodnikova, S., & Smith, A. (2011). What can we learn privately? SIAM Journal on Computing, 40(3), 793-826.

50. Wang, T., Zhang, X., Feng, J., & Yang, X. (2020). A comprehensive survey on local differential privacy toward data statistics and analysis. Sensors, 20(24), 7030.

51. Alvim, M., Chatzikokolakis, K., Palamidessi, C., & Pazii, A. (2018). Local differential privacy on metric spaces: optimizing the trade-off with utility. In 2018 IEEE 31st Computer Security Foundations Symposium (CSF) (pp. 262-267). IEEE.

52. Dwork, C., & Roth, A. (2014). The algorithmic foundations of differential privacy. Foundations and Trends® in Theoretical Computer Science, 9(3–4), 211-407.

53. Li, N., Qardaji, W., & Su, D. (2012). On sampling, anonymization, and differential privacy or, k-anonymization meets differential privacy. In Proceedings of the 7th ACM Symposium on Information, Computer and Communications Security (pp. 32-33).

54. Dwork, C., McSherry, F., Nissim, K., & Smith, A. (2006). Calibrating noise to sensitivity in private data analysis. In Theory of cryptography conference (pp. 265-284). Springer, Berlin, Heidelberg.

55. McSherry, F., & Talwar, K. (2007). Mechanism design via differential privacy. In 48th Annual IEEE Symposium on Foundations of Computer Science (FOCS'07) (pp. 94-103). IEEE.

56. Nissim, K., Raskhodnikova, S., & Smith, A. (2007). Smooth sensitivity and sampling in private data analysis. In Proceedings of the thirty-ninth annual ACM symposium on Theory of computing (pp. 75-84).

57. Papernot, N., Song, S., Mironov, I., Raghunathan, A., Talwar, K., & Erlingsson, Ú. (2018). Scalable private learning with PATE. arXiv preprint arXiv:1802.08908.

58. Chaudhuri, K., Monteleoni, C., & Sarwate, A. D. (2011). Differentially private empirical risk minimization. Journal of Machine Learning Research, 12, 1069-1109.

59. Abadi, M., Chu, A., Goodfellow, I., McMahan, H. B., Mironov, I., Talwar, K., & Zhang, L. (2016). Deep learning with differential privacy. In Proceedings of the 2016 ACM SIGSAC conference on computer and communications security (pp. 308-318).

60. Zhang, J., Zhang, Z., Xiao, X., Yang, Y., & Winslett, M. (2012). Functional mechanism: regression analysis under differential privacy. Proceedings of the VLDB Endowment, 5(11), 1364-1375.

61. Kan, Z., Qiao, L., Yu, H., Peng, L., Gao, Y., & Li, D. (2023). Protecting user privacy in remote conversational systems: A privacy-preserving framework based on text sanitization. arXiv preprint arXiv:2306.08223.

62. Chen, Y., Li, T., Liu, H., & Yu, Y. (2023). Hide and seek (HaS): A lightweight framework for prompt privacy protection. arXiv preprint arXiv:2309.03057.

63. Zhang, K., Wang, J., Hua, E., Qi, B., Ding, N., & Zhou, B. (2024). CoGenesis: A framework collaborating large and small language models for secure context-aware instruction following. arXiv preprint arXiv:2403.03129.

64. Yao, Y., Wang, F., Ravi, S., & Chen, M. (2024). Privacy-preserving language model inference with instance obfuscation. arXiv preprint arXiv:2402.08227.

65. Zhang, M., He, T., Wang, T., Mireshghallah, F., Chen, B., Wang, H., & Tsvetkov, Y. (2023). LatticeGen: A cooperative framework which hides generated text in a lattice for privacy-aware generation on cloud. arXiv preprint arXiv:2309.17157.

66. Lin, G., Hua, W., & Zhang, Y. (2024). PromptCrypt: Prompt encryption for secure communication with large language models. arXiv preprint arXiv:2402.05868.

67. Hou, X., Liu, J., Li, J., Li, Y., Lu, W. J., Hong, C., & Ren, K. (2023). CipherGPT: Secure two-party GPT inference. Cryptology ePrint Archive.

68. Hao, M., Li, H., Chen, H., Xing, P., Xu, G., & Zhang, T. (2022). IRON: Private inference on transformers. Advances in Neural Information Processing Systems, 35, 15718-15731.

69. Chen, T., Bao, H., Huang, S., Dong, L., Jiao, B., Jiang, D., ... & Wei, F. (2022). THE-X: Privacy-preserving transformer inference with homomorphic encryption. In Findings of the Association for Computational Linguistics: EMNLP 2022 (pp. 3042-3054).

70. Lyu, L., Li, Y., He, X., & Xiao, T. (2020). Towards differentially private text representations. In Proceedings of the 43rd International ACM SIGIR Conference on Research and Development in Information Retrieval (pp. 1813-1816).

71. Plant, R., Gkatzia, D., & Giuffrida, V. (2021). CAPE: Context-aware private embeddings for private language learning. arXiv preprint arXiv:2108.12318.

72. Chen, S., Mo, F., Wang, Y., Chen, C., Nie, J. Y., Wang, C., & Cui, J. (2023). A customized text sanitization mechanism with differential privacy. In Findings of the Association for Computational Linguistics: ACL 2023 (pp. 5747-5758).

73. Tong, M., Chen, K., Qi, Y., Zhang, J., Zhang, W., & Yu, N. (2023). PrIvInfer: Privacy-preserving inference for black-box large language model. arXiv preprint arXiv:2310.12214.

74. Feyisetan, O., Balle, B., Drake, T., & Diethe, T. (2020). Privacy-and utility-preserving textual analysis via calibrated multivariate perturbations. In Proceedings of the 13th international conference on web search and data mining (pp. 178-186).

75. Xu, Z., Aggarwal, A., Feyisetan, O., & Teissier, N. (2020). A differentially private text perturbation method using a regularized Mahalanobis metric. arXiv preprint arXiv:2010.11947.

76. Carvalho, R. S., Vasiloudis, T., Feyisetan, O., & Wang, K. (2023). TEM: High utility metric differential privacy on text. In Proceedings of the 2023 SIAM International Conference on Data Mining (SDM) (pp. 883-890). SIAM.

77. Yue, X., Du, M., Wang, T., Li, Y., Sun, H., & Chow, S. S. (2021). Differential privacy for text analytics via natural text sanitization. arXiv preprint arXiv:2106.01221.

78. Zhou, X., Lu, Y., Ma, R., Gui, T., Wang, Y., Ding, Y., ... & Huang, X. J. (2023). TextObfuscator: Making pre-trained language model a privacy protector via obfuscating word representations. In Findings of the Association for Computational Linguistics: ACL 2023 (pp. 5459-5473).

79. Du, M., Yue, X., Chow, S. S., & Sun, H. (2023). Sanitizing sentence embeddings (and labels) for local differential privacy. In Proceedings of the ACM Web Conference 2023 (pp. 2349-2359).
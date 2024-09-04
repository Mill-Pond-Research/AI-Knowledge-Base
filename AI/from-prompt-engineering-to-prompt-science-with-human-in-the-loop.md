# From Prompt Engineering to Prompt Science With Human in the Loop: A Comprehensive Knowledge Base

## Table of Contents

1. Introduction
2. Background and Context
3. The Need for Prompt Science
4. Methodology
   4.1 Phase 1: Set up the initial pipeline
   4.2 Phase 2: Identify appropriate criteria to evaluate the responses
   4.3 Phase 3: Iteratively develop the prompt
   4.4 Phase 4: Validate the whole pipeline
5. Experiments
   5.1 Identifying user intents
   5.2 Auditing an LLM
6. Conclusion
7. Acknowledgments
8. References

## Document Title, Authors

Title: From Prompt Engineering to Prompt Science With Human in the Loop
Author: Chirag Shah
Affiliation: University of Washington, Seattle, WA, USA

## 1. Document Overview

This knowledge base document is based on a comprehensive paper that explores the transition from prompt engineering to prompt science in the context of Large Language Models (LLMs). The document serves as a practical guide for researchers and practitioners seeking to develop more rigorous, scientific approaches to using LLMs in research and applications.

The paper addresses the growing concern about the ad-hoc nature of prompt engineering and its potential negative impact on scientific research. It proposes a new methodology inspired by qualitative coding techniques to introduce more systematic, objective, and trustworthy ways of applying LLMs for data analysis.

Key aspects covered in this document include:
- The current state and limitations of prompt engineering
- The need for a more scientific approach in using LLMs for research
- A detailed methodology for developing and validating prompts
- Two experimental applications of the proposed methodology
- Implications and future directions for prompt science

This knowledge base aims to bridge the gap between ad-hoc prompt engineering practices and rigorous scientific methodologies, providing readers with the foundational concepts, strategies, and considerations crucial for responsible and effective use of LLMs in research contexts.

## 2. Background and Context

### 2.1 The Rise of Large Language Models (LLMs)

Large Language Models have become increasingly sophisticated and capable in recent years, finding applications in various tasks beyond information extraction and synthesis. As the paper notes:

<quote>These tasks are not limited to information extraction and synthesis [13], but also expanded to analysis, creation, and reasoning [6].</quote>

### 2.2 LLMs in Scientific Research

The integration of LLMs into scientific research has opened up new avenues for supporting various research tasks. The paper highlights several applications:

<quote>LLMs are being used in identifying relevant papers [17], synthesizing literature reviews [3], writing proposals [9], and analyzing data [30]. They have been found effective and useful in investigative tasks such as drug discovery [24, 34]</quote>

### 2.3 The Challenge of Prompt Engineering

While LLMs have shown great potential, their effectiveness often relies heavily on prompt engineering. The paper defines prompt engineering as:

<quote>an ad-hoc method to revise prompts being fed into an LLM to achieve desired response or analysis [23].</quote>

This approach, however, raises concerns about the scientific validity and reliability of research outcomes based on such methods.

## 3. The Need for Prompt Science

The paper argues that the current practice of prompt engineering in scientific research is problematic for several reasons:

1. Lack of scientific rigor: Ad-hoc prompt engineering may not meet the standards of transparency, verifiability, and repeatability expected in scientific research.

2. Potential for bias and subjectivity: Individual researchers may introduce personal biases when revising prompts to achieve desired outcomes.

3. Limited generalizability: Prompts developed through ad-hoc methods may not be applicable or effective in different contexts or with different LLMs.

The author emphasizes the need for a more scientific approach:

<quote>We need a more scientific approach to using LLMs in our research. While there are several active efforts to support more systematic construction of prompts, they are often focused more on achieving desirable outcomes rather than producing replicable and generalizable knowledge with sufficient transparency, objectivity, or rigor.</quote>

To address these concerns, the paper proposes three key steps:

1. Involving multiple qualified researchers in the process
2. Establishing clear and objective criteria for assessing desirable outcomes
3. Documenting and discussing individual differences and biases to create replicable experiments

## 4. Methodology

The paper presents a new methodology inspired by qualitative coding techniques to develop a more scientific approach to prompt generation and validation. This methodology consists of four main phases:

### 4.1 Phase 1: Set up the initial pipeline

This phase involves creating an initial prompt and selecting a sample dataset for testing. The paper describes this as:

<quote>This can be done using anything that is reasonable. For instance, the initial prompt could be a simple and direct instruction to generate the desired response.</quote>

### 4.2 Phase 2: Identify appropriate criteria to evaluate the responses

In this phase, researchers establish and validate criteria for assessing the LLM's outputs. The paper outlines the process as follows:

<quote>1. Run the existing pipeline to generate a reasonable number of responses. Give each assessors these responses, the existing set of criteria (codebook), and sufficient details of the application. The assessors should review these things before starting their assessment. This can be supervised by the lead researcher or an expert.

2. Each assessor applies the criteria on the given responses independently.

3. Compare the assessors' outcomes and compute the level of agreement. This could be using as simple as measuring the % times when they agree, or using inter-coder reliability (ICR) using an appropriate method such as Cohen's kappa [35] or Krippendorfff's alpha [11].

4. If the amount of agreement is not sufficient (this could vary from application to application), bring the assessors together to discuss their disagreement. This is a very important step as it offers an opportunity to not only remove individual biases and subjectivity, but also influences researchers' collective understanding of the task and the criteria for evaluation. The discussion could result in resolution of conflict, but also changes in the codebook. These changes could be about the number or the description of the criteria for assessment.

5. Once a sufficient level of agreement is achieved, the codebook for assessing the responses is finalized. At this point the assessors may still choose to make minor changes in the codebook to enhance its readability with the idea that anyone who did not participate in this process of developing it can still understand and use it very much how those assessors would.</quote>

### 4.3 Phase 3: Iteratively develop the prompt

This phase focuses on refining the prompt to consistently generate desired responses. The paper describes the process:

<quote>1. Run a reasonable number of data inputs using the current prompt.

2. Give the generated responses to the human assessors, ideally the same ones who were involved in the previous phase. However, this is not a requirement. These assessors should use the codebook produced by the previous phase to assess the responses.

3. Have them assess if the generated responses meet the criteria for the application in question.

4. Compare the assessments by different assessors to find their level of agreement. If that agreement is not sufficient, have the assessors discuss their disagreements, possibly under the supervision of a senior researcher or an expert, and revise the codebook as necessary. Here, the codebook is the prompt fed to the LLM. Repeat the above process.

5. Once there is enough agreement among the assessors that the prompt meets the objective of generating desired responses more than some threshold, this process is done. The assessors or the supervising researcher may still make minor adjustments to the prompt for improved readability, interpretability, and generalization.</quote>

### 4.4 Phase 4: Validate the whole pipeline

The final phase involves a comprehensive validation of the entire process:

<quote>As an optional and final validation phase, run through the whole pipeline using a portion of the test data and evaluate random samples of the responses to ensure the whole process still yields quality results that can be independently and objectively validated. For this, it is ideal to use a different set of assessors and have them independently label that same set of randomly sampled responses. Compute their ICR on this sample to see if (1) there is a good enough agreement among them on labeling; and (2) the generated responses are meeting the desired criteria. If either of these objectives are not met, take appropriate actions for correction, based on phases 2 and 3.</quote>

## 5. Experiments

The paper presents two experiments to demonstrate the application of the proposed methodology:

### 5.1 Identifying user intents

This experiment focused on creating and using a user intent taxonomy. The process involved:

1. Setting up an initial pipeline with a prompt and sample data from Bing Chat.
2. Identifying five criteria for evaluating the quality of a user intent taxonomy: comprehensiveness, consistency, clarity, accuracy, and conciseness.
3. Iteratively developing the prompt through multiple rounds of assessment and revision.
4. Validating the final taxonomy and process with different researchers and LLMs.

The author notes the success of this approach:

<quote>At this point, we have not only a reliable and robust pipeline for generating and using a user intent taxonomy, but it is also validated through a rigorous process with human-in-the-loop, making this trustworthy and generalizable.</quote>

### 5.2 Auditing an LLM

This experiment focused on developing a method for auditing LLMs by generating different versions of the same question. The process involved:

1. Setting up an initial pipeline with the prompt: "Generate five different questions for the following question that represent the same meaning, but are different."
2. Establishing criteria for evaluating generated probes: relevance and diversity.
3. Iteratively refining the prompt to consistently generate relevant and diverse questions.
4. Validating the entire pipeline with random sampling and minor adjustments.

## 6. Conclusion

The paper concludes by emphasizing the importance of scientific rigor in using LLMs for research:

<quote>LLMs could simply be stochastic string generation tools [4] that are effective at predicting next tokens. But for many researchers, they are proving to be useful in many research problems that in general involve labeling or classifying input data based on some analysis or reasoning. However, using LLMs blindly for such research tasks just because their outputs seem reasonable can be dangerous. It can perpetual biases [25], create fabricated or hallucinated responses [22], and provide unverifiable results [31]. All of these are harmful for scientific progress.</quote>

The author argues that the proposed method provides scientific rigor for three main reasons:

1. It offers a systematic and verifiable way of producing prompt templates while removing individual subjectivity and biases.
2. It fosters openness and replicability through the involvement of multiple researchers and documentation of deliberations and decisions.
3. It adds to our knowledge about the problem at hand, how to assess it, and how to consistently and objectively analyze given data.

The paper acknowledges the increased cost associated with this rigorous process but argues that the benefits in terms of quality, consistency, and reliability justify the investment:

<quote>Even if the goal is not to turn into a fully automated pipeline, considering that the proposed method not only leads to a outputs with higher quality, consistency, and reliability, but also an increased understanding of the task and the data, we believe the added cost is justifiable. The broader scientific community could also benefit from exercising and perhaps insisting on such a rigor so we could leverage LLMs ethically and responsibly in our research.</quote>

## 7. Acknowledgments

The paper acknowledges collaborations and contributions from various researchers and institutions:

<quote>The taxonomy generation and usage experiments described in Section 4.1 are results of collaboration with Ryen White and other researchers from Microsoft as listed in [28]. The LLM auditing experiments described in Section 4.2 are results of hard work by Maryam Amirizaniani, Adrian Lavergne, Elizabeth Okada, and Jihan Yao. We are also thankful to Aman Chadha and Tanya Roosta for their valuable comments and guidance during this process.</quote>

## 8. References

The paper includes an extensive list of references, which can be found at the end of the original document. Some key references include:

[4] Emily M Bender, Timnit Gebru, Angelina McMillan-Major, and Shmargaret Shmitchell. 2021. On the dangers of stochastic parrots: Can language models be too big?. In Proceedings of the 2021 ACM conference on fairness, accountability, and transparency. 610–623.

[22] Vipula Rawte, Amit Sheth, and Amitava Das. 2023. A survey of hallucination in large foundation models. arXiv preprint arXiv:2309.05922 (2023).

[23] Laria Reynolds and Kyle McDonell. 2021. Prompt programming for large language models: Beyond the few-shot paradigm. In Extended Abstracts of the 2021 CHI Conference on Human Factors in Computing Systems. 1–7.

[28] Chirag Shah, Ryen W White, Reid Andersen, Georg Buscher, Scott Counts, Sarkar Snigdha Sarathi Das, Ali Montazer, Sathish Manivannan, Jennifer Neville, Xiaochuan Ni, et al. 2023. Using large language models to generate, validate, and apply user intent taxonomies. arXiv preprint arXiv:2309.13063 (2023).

[31] Kaya Stechly, Matthew Marquez, and Subbarao Kambhampati. 2023. GPT-4 Doesn't Know It's Wrong: An Analysis of Iterative Prompting for Reasoning Problems. arXiv preprint arXiv:2310.12397 (2023).
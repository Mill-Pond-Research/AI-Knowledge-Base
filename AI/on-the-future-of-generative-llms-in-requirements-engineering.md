# On the Future of Generative LLMs in Requirements Engineering

## Table of Contents

1. Introduction
2. Preliminaries: Decoder-only (Generative) LLMs
3. Using Generative LLMs for RE tasks
4. Using RE for Effective Prompting
5. Conclusions
6. References

## 1. Introduction

This knowledge base entry is based on the article "From Specifications to Prompts: On the Future of Generative LLMs in Requirements Engineering" by Andreas Vogelsang from the University of Cologne, Germany. The document explores the potential of generative Large Language Models (LLMs) in revolutionizing Requirements Engineering (RE) practices.

### 1.1 Document Overview

The article discusses how generative LLMs, such as GPT, are poised to transform various aspects of Requirements Engineering. It highlights the importance of precise prompts for effective interactions with these models and emphasizes the crucial role of human evaluation in leveraging LLM capabilities.

### 1.2 Key Messages

The author presents two main messages:

1. "Generative LLMs provide novel features to support RE tasks. However, the human in the loop becomes even more important for evaluating generative LLMs."

2. "Prompts are expressions of requirements. RE can help improve prompt engineering and position prompts as artifacts in the software development lifecycle."

## 2. Preliminaries: Decoder-only (Generative) LLMs

This section provides an overview of the architecture and functioning of generative LLMs.

### 2.1 Architecture

Generative LLMs are based on a decoder-only architecture, which is derived from the transformer architecture introduced by Vaswani et al. in 2017.

> "Decoder-only architectures are derived from the well-known transformer architecture [1]. The original transformer architecture addressed translation tasks by combining an encoder, which encodes the input, and a decoder, which generates the output."

### 2.2 Training Objective

Decoder-only LLMs are primarily trained with a next-word prediction (NWP) objective:

> "To support the generative capabilities of decoder-only LLMs, they are primarily pre-trained with a next-word prediction (NWP) objective, where the models predict the next word or words in a given sequence of words."

### 2.3 Prompts

Generative LLMs are triggered by prompts, which are textual inputs instructing the model to generate a desired response. A prompt may contain the following elements:

> "• Instruction: a specific task or instruction you want the model to perform
> • Context: external information or additional context that can steer the model to better responses
> • Input Data: the input or question that we are interested in finding a response for
> • Output Indicator: the type or format of the output."

### 2.4 Prompt Engineering

The creation and exact phrasing of a prompt is crucial for the quality of the LLM output. Prompt engineering is a new field focused on developing and optimizing prompts for LLMs.

> "For most tasks, it is necessary to experiment with different prompts and iteratively refine them to yield the best results. This so-called prompt engineering step is similar to feature engineering in more traditional machine learning (ML) approaches."

## 3. Using Generative LLMs for RE tasks

This section explores how generative LLMs can be applied to Requirements Engineering tasks.

### 3.1 Novel Approach to RE Tasks

Generative LLMs offer a new way to solve RE tasks compared to traditional predictive LLMs:

> "With generative LLMs, a specific RE task is written as a prompt, which serves as input. The prompt usually contains the task and the input data to be processed. The model's output provides the answer to the specific task."

### 3.2 Example: Trace Link Recovery

The author provides an example of how a trace link recovery task can be formulated as a prompt:

> "User Prompt:
> Below are artifacts from the same software system. Is there a traceability link between (1) and (2)?
> (1) The DPU-TMALI shall utilize SCM_DCI_SR, along with ERRNO provided by DPU-DCI to decode errors and place them on an error queue for DPU-CCM.
> (2) Error Collection and Reporting The ccmErrEnq() function tracks the last error reported and its frequency of occurrence. Once an error code has been reported it becomes the previously reported error code maintained by ccmErrEnq(). A repetition count is then incremented for each subsequent, consecutively reported, identical instance of this previously reported error. If this error code is reported more than once in one high-rate housekeeping reporting period, then a special error, S_ccm_ERR_REPEAT is enqueued with the repetition count for the error encoded in the least significant byte. This mechanism effectively reduces the potential for housekeeping telemetry to become flooded with a single repeated error."

### 3.3 Novel Features of Generative LLMs

The author highlights three novel features of generative LLMs that distinguish them from predictive LLMs:

1. Augmented responses with rationales and explanations
2. Ability to enter into a dialog with the LLM
3. Combination of different modalities (text, image, audio, video)

#### 3.3.1 Augmented Responses

> "We can ask generative LLMs to augment the response with rationales and explanations. In contrast to predictive LLMs, which only provide the prediction as output, generative LLMs can be instructed to provide explanations along the result."

#### 3.3.2 Dialog Capability

> "We can enter into a dialog with a generative LLM. The second novel advantage is that generative LLMs can incorporate prior answers as context into new prompts. This gives the user the possibility to ask for additional information or even correct certain details of an answer."

#### 3.3.3 Multimodal Capabilities

> "Although LLMs were originally designed to process and produce text, recent LLMs can also process and generate image, audio, and even video data. Much requirements-related information is in non-text format (e.g., visual models, interview recordings, vision videos). The recent LLM advancements allow the integration of these representations into the automation pipeline."

### 3.4 Evaluation Challenges

The author notes that these new features introduce challenges in evaluating generative LLMs:

> "Augment a response with explanations, entering into a dialog, and combining modalities are features of generative LLMs that distinguish them from predictive LLMs we used in the past to automate RE tasks. These features, however, make the evaluation of LLMs more challenging."

> "When generative LLMs are used like predictive models, the evaluation is straightforward and should adhere to existing best practices (e.g., as suggested by Dell'Anna et al. [8]). However, when using the generative, conversational, and multimodal capabilities, the human-in-the-loop becomes much more important for evaluating generative LLMs."

## 4. Using RE for Effective Prompting

This section explores how Requirements Engineering principles can be applied to improve prompt engineering.

### 4.1 Prompt Engineering as a New Discipline

The author introduces prompt engineering as a new field that lacks scientific foundation:

> "In the rapidly advancing landscape of AI, prompt engineering emerged as a new discipline concerning the development and optimization of prompts for LLMs. Various prompting techniques have been introduced by different sources, ranging from blog articles to peer-reviewed academic publications. However, the vast majority seem to lack a scientific foundation and are more based on trial and error."

### 4.2 Prompting Techniques

The author mentions several prompting techniques and frameworks:

1. Simple rules for phrasing prompts
2. Prompt templates (e.g., CRISPE, RICE)
3. Few-shot prompting
4. Chain-of-thought prompting

### 4.3 Prompts as Expressions of Requirements

The author proposes viewing prompts as expressions of requirements:

> "From an RE perspective, prompts express the user's needs and expectations to an LLM. Therefore, prompts are expressions of requirements. RE research has a long tradition of thinking about and coming up with methods to describe stakeholder needs in a precise manner."

### 4.4 Adapting RE Goals to Prompts

The author suggests adapting traditional RE goals to prompts:

1. Knowing all prompts
2. Achieving a consensus among stakeholders about prompts
3. Documenting prompts appropriately
4. Managing prompts systematically

### 4.5 Prompt Quality Indicators

The author mentions ongoing research into reproducible indicators within prompts that may predict quality issues:

> "Recently, we investigated reproducible indicators within prompts that may predict a loss of quality or flaw. We base these flaw indicators on established requirements smells, which are reliable indicators for requirements quality [9], [10]."

## 5. Conclusions

The author concludes by summarizing the opportunities and challenges presented by generative LLMs in Requirements Engineering:

> "Generative large language models (LLMs) are opening up new opportunities for requirements analysts, providing innovative tools to enhance their work. Unlike traditional predictive models, generative LLMs offer detailed explanations and allow users to engage in a dialogue to refine or correct responses. This brings exciting possibilities but also introduces challenges."

The author also highlights the need for further research:

> "We need to rethink how we evaluate these models' capabilities and develop new ways to assess their effectiveness, especially when humans are involved. Additionally, there is a growing interest in the intersection of RE and prompt engineering. How can we create precise prompts or break down complex goals into actionable steps? Is there a need for systematic prompt documentation and management? This is an intriguing area for RE researchers and enthusiasts to explore."

## 6. References

1. A. Vaswani, N. Shazeer, N. Parmar, J. Uszkoreit, L. Jones, A. N. Gomez, L. u. Kaiser, and I. Polosukhin, "Attention is all you need," in Advances in Neural Information Processing Systems, 2017.

2. J. Devlin, M.-W. Chang, K. Lee, and K. Toutanova, "BERT: Pre-training of deep bidirectional transformers for language understanding," 2018.

3. J. Winkler and A. Vogelsang, "Automatic classification of requirements based on convolutional neural networks," in 2016 IEEE 24th International Requirements Engineering Conference Workshops (REW), 2016.

4. M. Binder, A. Vogt, A. Bajraktari, and A. Vogelsang, "Automatically Classifying Kano Model Factors in App Reviews," in International Working Conference on Requirements Engineering: Foundation for Software Quality, 2023.

5. J. Fischbach, B. Hauptmann, L. Konwitschny, D. Spies, and A. Vogelsang, "Towards causality extraction from requirements," in IEEE 28th International Requirements Engineering Conference (RE), 2020.

6. A. D. Rodriguez, K. R. Dearstyne, and J. Cleland-Huang, "Prompts matter: Insights and strategies for prompt engineering in automated software traceability," in IEEE 31st International Requirements Engineering Conference Workshops (REW), 2023.

7. A. Vogelsang and J. Fischbach, "Using Large Language Models for Natural Language Processing Tasks in Requirements Engineering: A Systematic Guideline," in Handbook of Natural Language Processing for Requirements Engineering, 2024.

8. D. Dell'Anna, F. B. Aydemir, and F. Dalpiaz, "Evaluating classifiers in SE research: the ECSER pipeline and two replication studies," Empirical Software Engineering, 2022.

9. H. Femmer, D. Méndez Fernández, S. Wagner, and S. Eder, "Rapid quality assurance with requirements smells," Journal of Systems and Software, 2017.

10. J. Frattini, L. Montgomery, J. Fischbach, M. Unterkalmsteiner, D. Mendez, and D. Fucci, "A live extensible ontology of quality factors for textual requirements," in IEEE 30th International Requirements Engineering Conference (RE), 2022.
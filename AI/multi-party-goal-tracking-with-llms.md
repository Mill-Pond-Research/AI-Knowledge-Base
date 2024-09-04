# Multi-party Goal Tracking with Large Language Models: A Comparative Study

Authors: Angus Addlesee, Weronika Siei´nska, Nancie Gunson, Daniel Hernandez Garcia, Christian Dondrup, Oliver Lemon

## Table of Contents

1. Document Overview
2. Introduction
3. Dataset and Tasks
4. Experimental Procedure
5. Results
   5.1 MPC Goal Tracking Results
   5.2 MPC Intent-slot Recognition Results
6. Conclusion and Future Work
7. Acknowledgements
8. References
9. Appendix: Full GPT-3.5-turbo Prompts

## 1. Document Overview

This knowledge base entry is based on a research paper that evaluates the performance of Large Language Models (LLMs) in capturing task-oriented multi-party conversations (MPCs). The study focuses on two novel tasks: multi-party goal tracking and intent-slot recognition. The researchers compare three methods - fine-tuning T5, pre-training DialogLM using LED, and prompt engineering with GPT-3.5-turbo - in zero-shot and few-shot settings to determine which approach can best complete these tasks with limited data.

The document is significant in the field of natural language processing and dialogue systems, as it addresses the challenges of understanding and processing multi-party conversations, which are becoming increasingly relevant in social robotics and public-facing AI applications. The study's findings have implications for developing more effective and context-aware dialogue systems capable of handling complex, multi-party interactions.

## 2. Introduction

<definition>Multi-party conversations (MPCs)</definition> present unique challenges for Spoken Dialogue Systems (SDSs) embedded in social robots. Unlike virtual agents or voice assistants that typically engage in dyadic interactions, social robots often encounter groups of individuals in public spaces.

The authors highlight the complexity of MPCs:

> "In multi-party conversations (MPCs), the social robot must determine which user said an utterance, who that utterance was directed to, when to respond, and what it should say depending on whom the robot is addressing."

The paper introduces two tasks that become substantially more complex in multi-party settings:

1. Goal tracking
2. Intent-slot recognition

These tasks are essential for practical systems to understand and address user goals effectively. The authors argue that current "who says what to whom" systems can only mimic what a good MPC looks like, without actually helping users reach their goals.

Key differences in MPCs compared to dyadic interactions include:

- People sharing goals
- Users answering each other's questions
- Individuals providing goals on behalf of others

The authors provide an example from their corpus:

> "Consider the example in Table 1 (from our new corpus, detailed in Section 2). In turn 1, we can identify that User 1 (U1) wants to know their appointment time. Before the social robot had time to answer, User 2 (U2) answered in turn 2. This obviously does not occur in a dyadic interaction, yet this understanding is essential for natural system behaviour."

## 3. Dataset and Tasks

The researchers collected a novel dataset for this study:

- 29 multi-party conversations (774 turns)
- Recorded in a hospital setting
- Participants: patients, companions, and a social robot (ARI)
- Conversations transcribed, translated from French to English, anonymized, and annotated

<example>
Table 2: A corpus example displaying shared goals with both intent-slot and goal tracking annotations.

User | Utterance | Intent-Slot Annotation | Goal Tracking Annotation
-----|-----------|------------------------|---------------------------
U1 | Hello, we'd like a coffee. Where can we go? | greet() ; request(beverage(coffee)) | G(U1+U2, drink(coffee))
ARI | You have to enter the building behind you. | inform(directions(cafe)) | AG(U1+U2, drink(coffee))
U2 | Ok, well thank you very much. | acknowledge(); thank() | CG(U1+U2, drink(coffee))
</example>

The dataset was annotated for two main tasks:

1. <definition>Multi-party goal tracking</definition>: Identifying and tracking user goals throughout the conversation, including shared goals, answered goals, and closed goals.

2. <definition>Multi-party intent-slot recognition</definition>: Identifying the intent of each utterance and any associated slots (parameters).

Annotation process:
- Used the ELAN tool for initial annotations
- Mapped annotations into JSON format for model training

The authors explain the complexity of goal tracking in MPCs:

> "When a goal is detected in a dyadic interaction, no user information is needed as there is only a single user. In multi-party interactions, multiple users can have multiple active goals. These goals may be different, they may be shared (see Table 2), users may answer each other's goals (see Table 1), and one user may provide another user's goal, for example by saying 'My wife would love a coffee'."

## 4. Experimental Procedure

The study evaluated three different models:

1. T5 (Text-to-Text Transfer Transformer)
2. DialogLM using LED (DialogLED)
3. GPT-3.5-turbo

Each model was tested in zero-shot and few-shot settings with various train/test splits:

- Zero-shot: 0/100
- Few-shot: 20/80, 50/50, and 80/20 (for T5 and DialogLED)
- Few-shot: 7/80 (for GPT-3.5-turbo, due to context window limitations)

The authors emphasize the importance of limited data scenarios:

> "It is not possible to collect enormous corpora from patients in a hospital, so models were evaluated in zero-shot and few-shot settings."

Experimental details:
- Randomized window selection for masking annotations in each MPC
- Three randomized runs for each conversation and train/test split
- Consistent windows used across all models for fair comparison
- Experiments run on a machine with a 16Gb NVIDIA GeForce RTX 3080 Ti GPU, 64Gb RAM, and an Intel i9-12900HK processor

For GPT-3.5-turbo, the researchers employed six different prompt styles:

1. Basic
2. Specific
3. Annotation
4. Story
5. Role-play
6. Reasoning

The authors provide an example of the reasoning prompt style:

> "If the conversation included 'U1: I really need the toilet [MASK]', then we would first know that the speaker is called U1. The turn also ends with [MASK], so we know that we need to replace it with a goal. We know that U1 needs the toilet, so their goal is to go to the nearest toilet. Goals always begin with the '@' symbol, and then a 'G' if we have found a person's goal. We would therefore replace [MASK] with @ G(U1, go-to(toilet))."

## 5. Results

The results are presented for both multi-party goal tracking and intent-slot recognition tasks.

### 5.1 MPC Goal Tracking Results

<example>
Table 4: The final multi-party goal tracking results for each model in both the zero- and few-shot settings.

Model | train/test % | Prompt Style | Exact % | Correct % | Partial %
------|--------------|--------------|---------|-----------|----------
T5 | 0/100 | - | 0 | 0 | 0
T5 | 20/80 | - | 0 ± 0 | 0 ± 0 | 0 ± 0
T5 | 50/50 | - | 0 ± 0 | 0 ± 0 | 0 ± 0
T5 | 80/20 | - | 0 ± 0 | 0 ± 0 | 0 ± 0
DialogLED | 0/100 | - | 0 | 0 | 0
DialogLED | 20/80 | - | 0 ± 0 | 0 ± 0 | 5.80 ± 1.45
DialogLED | 50/50 | - | 0 ± 0 | 2.38 ± 2.38 | 1.19 ± 0.63
DialogLED | 80/20 | - | 0 ± 0 | 0 ± 0 | 20 ± 11.55
GPT 3.5-turbo | 0/100 | Basic | 0 | 3.45 | 31.03
GPT 3.5-turbo | 0/100 | Specific | 0 | 3.45 | 24.14
GPT 3.5-turbo | 0/100 | Annotation | 0 | 6.90 | 44.83
GPT 3.5-turbo | 0/100 | Story | 0 | 0 | 0
GPT 3.5-turbo | 0/100 | Role-play | 0 | 0 | 6.90
GPT 3.5-turbo | 0/100 | Reasoning | 3.45 | 34.48 | 79.31
GPT 3.5-turbo | 7/80* | Basic | 11.59 ± 3.83 | 30.43 ± 10.94 | 86.96 ± 6.64
GPT 3.5-turbo | 7/80* | Specific | 20.29 ± 3.83 | 43.48 ± 9.05 | 92.75 ± 2.90
GPT 3.5-turbo | 7/80* | Annotation | 14.49 ± 5.80 | 28.99 ± 3.83 | 82.61 ± 4.35
GPT 3.5-turbo | 7/80* | Story | 17.39 ± 6.64 | 36.23 ± 13.83 | 86.96 ± 4.35
GPT 3.5-turbo | 7/80* | Role-play | 18.84 ± 7.25 | 46.38 ± 12.38 | 92.75 ± 5.22
GPT 3.5-turbo | 7/80* | Reasoning | 27.54 ± 1.45 | 62.32 ± 9.50 | 94.20 ± 5.80
</example>

Key findings:

1. GPT-3.5-turbo significantly outperformed other models in the few-shot setting.
2. The 'reasoning' style prompt was the best performing method for GPT-3.5-turbo.
3. T5 and DialogLED struggled with limited data, showing potential for improvement with larger datasets.
4. The 'story' prompt style increased model hallucination, which could be problematic in safety-critical settings.

The authors note:

> "GPT-3.5-turbo significantly outperformed all the others in a few-shot setting. We would like to highlight again that each run's example prompts provided to the model were exactly the same for each prompt style. Performance differences were only due to the given prompt style."

### 5.2 MPC Intent-slot Recognition Results

<example>
Table 5: The final multi-party intent-slot recognition results for each model in both the zero- and few-shot settings.

Model | train/test % | Prompt Style | Exact % | Correct % | Partial %
------|--------------|--------------|---------|-----------|----------
T5 | 0/100 | - | 0 | 0 | 0
T5 | 20/80 | - | 0 ± 0 | 0 ± 0 | 0 ± 0
T5 | 50/50 | - | 0 ± 0 | 0 ± 0 | 0 ± 0
T5 | 80/20 | - | 0 ± 0 | 0 ± 0 | 0 ± 0
DialogLED | 0/100 | - | 0 | 0 | 0
DialogLED | 20/80 | - | 0 ± 0 | 0 ± 0 | 5.80 ± 2.90
DialogLED | 50/50 | - | 0 ± 0 | 0 ± 0 | 38.10 ± 10.38
DialogLED | 80/20 | - | 0 ± 0 | 13.33 ± 6.67 | 46.67 ± 6.67
GPT 3.5-turbo | 0/100 | Basic | 0 | 3.45 | 51.72
GPT 3.5-turbo | 0/100 | Specific | 0 | 0 | 13.79
GPT 3.5-turbo | 0/100 | Annotation | 0 | 3.45 | 20.69
GPT 3.5-turbo | 0/100 | Story | 0 | 0 | 24.14
GPT 3.5-turbo | 0/100 | Role-play | 0 | 0 | 20.69
GPT 3.5-turbo | 0/100 | Reasoning | 0 | 27.59 | 82.76
GPT 3.5-turbo | 7/80* | Basic | 17.39 ± 6.64 | 36.23 ± 12.88 | 97.10 ± 2.90
GPT 3.5-turbo | 7/80* | Specific | 27.54 ± 1.45 | 60.87 ± 9.05 | 94.20 ± 1.45
GPT 3.5-turbo | 7/80* | Annotation | 18.84 ± 1.45 | 40.58 ± 6.32 | 91.30 ± 4.35
GPT 3.5-turbo | 7/80* | Story | 26.09 ± 4.35 | 47.83 ± 10.04 | 94.20 ± 3.83
GPT 3.5-turbo | 7/80* | Role-play | 20.29 ± 3.83 | 49.27 ± 12.88 | 97.10 ± 1.45
GPT 3.5-turbo | 7/80* | Reasoning | 37.68 ± 1.45 | 69.57 ± 10.94 | 100 ± 0
</example>

Key findings:

1. GPT-3.5-turbo again significantly outperformed other models in the few-shot setting.
2. The 'reasoning' prompt style achieved the best results, correctly annotating 69.57% of the MPCs.
3. T5 and DialogLED showed improvement with more training data but still underperformed compared to GPT-3.5-turbo.
4. Intent-slot recognition proved to be a more manageable task compared to goal tracking, with higher overall scores across models.

The authors note:

> "GPT-3.5-turbo significantly outperformed all the other models. The difference was remarkable. Almost all of the predictions were partially correct, and the 'reasoning' prompts correctly annotated 70% of the MPCs."

## 6. Conclusion and Future Work

The study concludes that multi-party conversations still challenge state-of-the-art LLMs, but GPT-3.5-turbo with appropriate prompt engineering shows promising results. Key findings and future directions include:

1. GPT-3.5-turbo outperformed other models in both goal tracking and intent-slot recognition tasks.
2. The 'reasoning' style prompt was most effective, while 'story' style prompts increased hallucination.
3. Limited data scenarios remain challenging, especially for T5 and DialogLED models.

The authors highlight potential risks and future work:

> "OpenAI claims that GPT-4 generates 40% fewer hallucinations than GPT-3 (Hern and Bhuiyan, 2023), but these models should still not be applied directly in a hospital or other safety-critical setting without further evaluation."

Future research directions include:

1. Evaluating response grounding and hallucination prevention strategies
2. Exploring open and transparent instruction-tuned text generators for data security
3. Integrating knowledge graphs with LLMs for improved accessibility and transparency
4. Conducting experiments with more than two participants to replicate real-world scenarios
5. Investigating automatic prompt optimization techniques

The authors conclude:

> "We plan to design and run subsequent experiments in both the hospital memory clinic, and a newly established mock waiting room in our lab. This space will allow us to collect additional MPCs with more than two people, replicating scenarios in which whole families approach a social robot."

## 7. Acknowledgements

The research was funded by the EU H2020 program under grant agreement no. 871245 (https://spring-h2020.eu/).

## 8. References

[Note: The full reference list is not provided in the PDF extract. The following are references mentioned in the text.]

1. Addlesee, A. (2023). Voice assistant accessibility. In The International Workshop on Spoken Dialogue Systems Technology, IWSDS 2023.
2. Addlesee, A., & Damonte, M. (2023a). Understanding and answering incomplete questions. In Proceedings of the 5th Conference on Conversational User Interfaces.
3. Addlesee, A., & Damonte, M. (2023b). Understanding disrupted sentences using underspecified abstract meaning representation. In Interspeech.
4. Addlesee, A., & Eshghi, A. (2021). Incremental graph-based semantics and reasoning for conversational AI. In Proceedings of the Reasoning and Interaction Conference (ReInAct 2021), pages 1–7.
5. Hern, A., & Bhuiyan, J. (2023). OpenAI says new model GPT-4 is more creative and less likely to invent facts. The Guardian.

## 9. Appendix: Full GPT-3.5-turbo Prompts

The paper includes detailed prompts used for GPT-3.5-turbo in both zero-shot and few-shot settings. These prompts are designed for goal tracking and intent-slot recognition tasks. The prompts follow six styles: Basic, Specific, Annotation, Story, Role-play, and Reasoning.

Example of a Reasoning prompt for goal tracking:

> "I will give you a conversation between two people and a robot called ARI. You need to return the text between [start] and [end] with the [MASK] tags replaced by user goals. Let's step through how to figure out the correct annotation. If the conversation included 'U1: I really need the toilet [MASK]', then we would first know that the speaker is called U1. The turn also ends with [MASK], so we know that we need to replace it with a goal. We know that U1 needs the toilet, so their goal is to go to the nearest toilet. Goals always begin with the '@' symbol, and then a 'G' if we have found a person's goal. We would therefore replace [MASK] with @ G(U1, go-to(toilet))."
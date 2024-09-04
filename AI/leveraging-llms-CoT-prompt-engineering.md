# Leveraging Large Language Models with Chain-of-Thought and Prompt Engineering for Traffic Crash Severity Analysis and Inference

Authors: Hao Zhen, Yucheng Shi, Yongcan Huang, Jidong J. Yang*, Ninghao Liu
Affiliation: College of Engineering, University of Georgia, Athens, GA, USA

## Table of Contents

1. Document Overview
2. Introduction
3. Methods
   3.1 Model Descriptions
   3.2 In-context learning
   3.3 Prompt engineering (PE)
   3.4 Chain-of-Thoughts (CoT)
4. Data
   4.1 Dataset
   4.2 Textual narrative generation
5. Experiments
   5.1 Experiments design
   5.2 Prompts for LLMs
   5.3 Evaluation metrics
6. Findings
   6.1 Exemplar responses of LLMs to crash severity inference queries
   6.2 Severity inference performance of the LLMs with different strategies
   6.3 Effectiveness of prompt engineering (PE) and Chain-of-Thought (CoT)
   6.4 Zero-shot vs. Few-shot learning
7. Discussions
   7.1 Can LLMs with CoT yield logical reasoning for their inference outcomes?
   7.2 Limitations and future works
8. Conclusions
9. Author contributions
10. References

## 1. Document Overview

This knowledge base entry is based on a research paper that explores the application of Large Language Models (LLMs) in traffic crash severity analysis and inference. The study investigates the use of three state-of-the-art LLMs: GPT-3.5-turbo, LLaMA3-8B, and LLaMA3-70B, for crash severity inference, framing it as a classification task. The researchers employ various techniques, including Chain-of-Thought (CoT) reasoning and prompt engineering, to enhance the performance of these models in analyzing crash causes and inferring severity outcomes.

The document is significant in the field of traffic safety research as it demonstrates the potential of LLMs to process complex and unstructured data in this domain, enabling elaborate case-specific analysis. It addresses challenges in traditional statistical and econometric methods used in traffic safety research and explores how LLMs can leverage their extensive pre-training knowledge to overcome limitations in handling unstructured textual data.

The scope of this knowledge base entry covers the entire research paper, including the methodology, experimental setup, findings, discussions, and conclusions. It provides a comprehensive overview of how LLMs can be applied to crash severity analysis and offers insights into the effectiveness of various techniques in improving model performance.

## 2. Introduction

The introduction section of the paper provides context for the research and highlights the importance of traffic safety analysis. Key points from this section include:

1. Traffic safety research plays a crucial role in enhancing road safety by examining root causes of accidents, identifying hazardous behaviors, and proposing effective countermeasures.

2. Traditional statistical and econometric methods in traffic safety research have limitations, including:
   - Constraints imposed by specific functional forms and distributional assumptions
   - Inability to handle unstructured textual data or narratives effectively

3. Recent advancements in AI and the abundance of narrative data in crash reports have led to the application of natural language processing (NLP) methods in text mining of crash narratives.

4. Large Language Models (LLMs) offer advantages over traditional methods:
   - Leverage immense knowledge acquired from extensive pre-training
   - Can process complex and unstructured data in the traffic safety domain

5. Challenges in applying LLMs to crash analysis:
   - Requiring LLMs to fully understand domain knowledge and potential causality behind crash events
   - Alignment gap between the model's original intent and specific requirements of the task

6. Proposed solutions:
   - Leveraging Chain-of-Thought (CoT) technique to enhance reasoning capabilities
   - Using prompt engineering (PE) and few-shot learning to better align LLMs with the specific requirements of crash severity modeling

The authors quote Mannering et al. (2020) to highlight the challenges in traffic accident modeling:

> "The challenge of traffic accident modeling stems from their multifaceted nature, involving intricate interplay among diverse factors, such as human behavior, vehicle dynamics, traffic conditions, environmental factors, and roadway characteristics."

This introduction sets the stage for the research by identifying the gaps in current methods and proposing the use of LLMs as a potential solution for more comprehensive crash severity analysis.

## 3. Methods

### 3.1 Model Descriptions

The study utilizes two state-of-the-art LLMs as base models:

1. GPT-3.5-turbo (OpenAI 2023):
   - Developed by OpenAI
   - Designed for various applications, including advanced text generation and coding assistance
   - Trained on a vast corpus of internet text, including diverse sources such as books and websites
   - Has billions of parameters, allowing for nuanced understanding and generation of text
   - The study uses the `gpt-3.5-turbo-0125` version

2. LLaMA-3 (AI@Meta 2024):
   - Developed by Meta
   - Designed for efficient and scalable language understanding
   - Pre-trained on over 15T tokens covering diverse internet text sources
   - Available in sizes of 8 billion and 70 billion parameters
   - Flexible for various applications

Both models employ techniques to align their outputs with human preferences:

- Supervised fine-tuning (SFT): Fine-tunes a pre-trained model on specific datasets with human instructions
- Reinforcement Learning with Human Feedback (RLHF): Refines the model using feedback from human experts

The authors note:

> "Both models employ techniques like supervised fine-tuning (SFT) and Reinforcement Learning with Human Feedback (RLHF) to align their outputs with human preferences, ensuring the model is helpful and safe (Wu et al. 2023)."

### 3.2 In-context learning

In-context learning is described as an approach where an LLM learns to perform a specified task by observing examples within the input context, without explicit fine-tuning or gradient updates. The paper references Radford et al. (2019) for this concept.

Two types of in-context learning are discussed:

1. Zero-shot learning:
   - The model performs a task without any examples or explicit training
   - Relies solely on pre-existing knowledge to make inferences

2. Few-shot learning:
   - Provides the model with a few examples of the target task before asking it to perform on new instances
   - Allows models to quickly adapt to new tasks or scenarios with minimal training data

The authors state:

> "Few-shot learning allows the models to quickly adapt to new tasks or scenarios with minimal training data for diverse real-world applications (Yin 2020)."

### 3.3 Prompt engineering (PE)

Prompt engineering is described as a technique for crafting and refining input prompts for LLMs to enhance their performance on specific tasks. The authors liken it to "asking the right question (prompt) to get the desired answer (response)."

In the context of crash severity inference, the paper highlights a challenge:

> "Specifically, in the context of crash severity inference, one critical category is 'Fatal accidents'. However, LLMs often exhibit a tendency to avoid assigning this label to relevant cases. This behavior stems from their alignment training, which generally encourages them to avoid discussing unpleasant subject or potentially unsafe topics (Wang et al. 2023, Shen et al. 2023)."

To address this issue, the researchers found it necessary to rephrase the original 'Fatal accidents' label using alternative terms, allowing them to maintain inference accuracy while respecting LLMs' aligned parameters.

### 3.4 Chain-of-Thoughts (CoT)

The Chain-of-Thought technique is presented as a method to enable LLMs to generate step-by-step reasoning before providing a final answer, improving their performance on complex reasoning tasks. The authors highlight the importance of CoT in addressing the opacity issues in LLMs' reasoning processes.

Formally, the CoT method is described as:

> "Let fθ be a language model and X = {(x1, y1), (x2, y2), ..., (xn)} be an input prompt, where (xi, yi) denotes the i-th example question-response pair. In a standard question-answering scenario, the model output is given by: yn = arg max Y pθ(Y | x1, y1, x2, y2, ..., xn), where pθ is the predicted probability of the language model fθ."

The CoT method extends this by including human-crafted explanations ei for each example, resulting in a modified input format and output:

> "(en, yn) = arg max Y pθ(Y | x1, e1, y1, x2, e2, y2, ..., xn)."

The authors note that in practice, it's difficult to obtain sufficient high-quality explanation examples for crash severity classification. Therefore, they follow strategies from Kojima et al. (2022), simply asking LLMs to think step by step to conduct traffic safety analysis and inference.

The paper highlights several key aspects of the CoT approach:

1. Reducing errors in crash risk assessment
2. Providing adjustable intermediate steps for crash analysis
3. Enhancing interpretability and reliability of crash risk assessment

## 4. Data

### 4.1 Dataset

The study uses CrashStats data from Victoria, Australia, spanning from 2006 to 2020. Key details about the dataset include:

- Contains records of vehicles involved in crashes
- Uses a four-point ordinal scale to code severity levels:
  1. Non-injury accident
  2. Other injury (minor injury) accident
  3. Serious injury accident
  4. Fatal accident

After preprocessing:
- Extremely low representation of non-injury accidents (only four instances, <0.001%)
- These four non-injury accidents were merged into the "Minor or non-injury accidents" category

Final dataset composition:
- 197,425 minor or non-injury accidents
- 89,925 serious injury accidents
- 4,760 fatal accidents

The paper provides a detailed table (Table 1) of traffic accident attributes considered in the study, including:
- Crash characteristics (e.g., ACCIDENT_TYPE, EVENT_TYPE, VEHICLE_1_COLL_PT)
- Driver characteristics (e.g., DRIVER_SEX, AGE_GROUP, ROAD_USER_TYPE)
- Vehicle characteristics (e.g., VEHICLE_TYPE, VEHICLE_WEIGHT, NO_OF_WHEELS)
- Roadway attributes (e.g., ROAD_TYPE, ROAD_GEOMETRY, SPEED_ZONE)
- Environmental factors (e.g., LIGHT_CONDITION, SURFACE_COND, ATMOSPH_COND)
- Situational factors (e.g., HELMET_BELT_WORN, NO_OF_VEHICLES, TRAFFIC_CONTROL)

### 4.2 Textual narrative generation

To create input suitable for LLMs, the researchers converted the raw structured tabular data into detailed, human-readable textual narratives. The process is described as follows:

> "To get coherent, informative passages enriched with domain-specific knowledge, we use a simple yet effective template to convert the raw structured tabular data into detailed, human-readable textual narratives, encapsulating vital information about traffic accidents, which can be better consumed by LLMs."

The authors note that this process augments the applicability and relevance of tabular data as input for LLMs, facilitating more context-aware inference for tasks like accident severity assessment. They also mention the possibility of supplementing the narratives with established facts or domain-specific knowledge for further enhancement.

## 5. Experiments

### 5.1 Experiments design

The study approaches crash severity inference as a classification task. Key aspects of the experimental design include:

Inputs:
- Various crash-related attributes (environmental conditions, driver characteristics, crash details, vehicle features)
- Original data in tabular format (categorical and numerical fields)
- Transformed into textual narratives using a simple template

Objective:
- Estimate severity outcomes of crashes using state-of-the-art LLM models (GPT-3.5-turbo, LLaMA3-8B, and LLaMA3-70B)

Dataset:
- Randomly selected 50 samples from each of the three severity outcome categories (total 150 samples)

The paper presents a table (Table 2) outlining the experimental settings:

1. Zero-shot (ZS)
2. Zero-shot with Chain-of-Thought (ZS_CoT)
3. Zero-shot with prompt engineering (ZS_PE)
4. Zero-shot with prompt engineering and Chain-of-Thought (ZS_PE_CoT)
5. Few-shot (FS)
6. Few-shot with prompt engineering (FS_PE)

Model configurations:
- GPT-3.5-turbo and LLaMA3: temperature = 0, top_p = 0.0001
- LLaMA3 models: do_sample = FALSE

The authors state their aims:

> "With these experiments, we aim to determine: 1) the accident severity inference performance of LLMs in a plain zero-shot setting; 2) whether CoT enhances the performance through its reasoning process (ZS_CoT vs ZS; ZS_PE vs ZS_PE_CoT); 3) whether PE improves performance in zero-shot and few-shot settings (ZS_PE vs ZS; FS_PE vs FS); 4) whether few-shot learning boost performance compared to the zero-shot setting (ZS vs. FS)."

### 5.2 Prompts for LLMs

The paper describes various prompts designed for different experimental settings:

1. Zero-shot (ZS):
   - Tasks the LLM as a professional road safety engineer
   - Requires classification into three categories: 'Fatal accident', 'Serious injury accident', or 'Minor or non-injury accident'
   - Restricts response to only the classification result

2. Zero-shot with CoT (ZS_CoT):
   - Encourages methodical reasoning through accident details
   - Requires determination of both cause and severity outcome

3. Zero-shot with prompt engineering (ZS_PE):
   - Uses descriptively modified categories to accommodate alignment constraints
   - Replaces 'Fatal accident' with 'Serious accident with potentially fatal outcomes'

4. Zero-shot with PE & CoT (ZS_PE_CoT):
   - Combines CoT reasoning with the modified category labels

5. Few-shot (FS):
   - Provides three examples, one from each severity category
   - Uses the same prompt structure as ZS

6. Few-shot with Prompt Engineering (FS_PE):
   - Similar to FS but uses the modified category label for fatal accidents

### 5.3 Evaluation metrics

The study employs standard multi-class classification metrics:

1. Macro-Accuracy:
   - Calculated as the average of class-specific accuracies
   - Formula: Accuracy = Correct Predictions / Total Predictions

2. F1-score:
   - Harmonic mean of precision and recall
   - Formula: F1-score = 2 × (Precision × Recall) / (Precision + Recall)
   - Reported at the macro level (averaged F1 of all classes)

3. Class-specific accuracies:
   - Accuracy for each severity category

The paper also defines precision and recall:

Precision:
- Quantifies the accuracy of positive predictions for a specific class
- Formula: Precision = True Positives / (True Positives + False Positives)

Recall:
- Measures the ability to correctly identify instances of a specific class
- Formula: Recall = True Positives / (True Positives + False Negatives)

## 6. Findings

### 6.1 Exemplar responses of LLMs to crash severity inference queries

The paper presents exemplar responses from GPT-3.5, LLaMA3-8B, and LLaMA3-70B for each experimental setting (ZS, FS, ZS_CoT, FS_PE, ZS_PE, and ZS_PE_CoT). Key observations include:

- LLMs effectively respond to the severity inference task, delivering expected results
- In plain Zero-shot and Few-shot settings, models respond directly with one of the three class labels
- In ZS_PE and FS_PE settings, models use the modified labels
- In CoT settings (ZS_CoT and ZS_PE_CoT), models provide longer responses with reasoning before making inferences
- GPT-3.5 model's responses are generally more concise

### 6.2 Severity inference performance of the LLMs with different strategies

The paper presents a detailed table (Table 3) showing performance metrics for each model and setting. Key findings include:

1. LLaMA3-70B consistently exhibited superior performance:
   - Best performance in zero-shot prompt engineering (ZS_PE): macro F1-score (0.4755) and macro-accuracy (49.33%)
   - Second-best in zero-shot with Chain-of-Thought (ZS_CoT): macro F1-score (0.4747) and macro-accuracy (47.33%)

2. Performance varied across severity categories:
   - Fatal accidents: GPT-3.5 with ZS_PE_CoT showed highest accuracy (68%)
   - Serious injury accidents: GPT-3.5 and LLaMA3-8B in plain ZS, and GPT-3.5 in ZS_CoT achieved 100% accuracy
   - Minor or non-injury accidents: LLaMA3-70B with basic zero-shot approach performed best (58% accuracy)

3. Prompt engineering generally enhanced performance, especially for fatal accident classification

The authors note:

> "These results underscore the complexity inherent in crash severity inference task, as no single approach consistently outperformed others across all metrics and severity categories."

### 6.3 Effectiveness of prompt engineering (PE) and Chain-of-Thought (CoT)

The study found that both PE and CoT improved model performance:

1. CoT improvements:
   - Enhanced recognition of "Minor or non-injury" accidents for GPT-3.5 and LLaMA3-8B
   - LLaMA3-70B showed substantial gains in identifying "Serious injury" and "Minor or non-injury" accidents

2. PE improvements:
   - Increased Macro F1-score and Macro-Accuracy across all models
   - Greatly enhanced detection of Fatal accidents
   - GPT-3.5 with PE showed a remarkable increase in Fatal accident detection (0% to 62%)

The authors state:

> "These improvements may stem from the fact that PE directs LLMs to concentrate more specifically on accident severity classification, potentially addressing any initial tendency to be overly cautious or generalized in their responses."

3. Combination of PE and CoT:
   - Particularly beneficial for smaller models like LLaMA3-8B
   - All models showed improved recognition of fatal accidents in the ZS_PE_CoT setting

### 6.4 Zero-shot vs. Few-shot learning

The study compared zero-shot and few-shot learning approaches:

1. Few-shot improvements:
   - Boosted classification accuracy for GPT-3.5 and LLaMA3-8B in "Fatal accident" and "Minor or non-injury accident" categories
   - Came at the expense of accuracy for "Serious injury accident"

2. Model size effects:
   - Smaller models (e.g., LLaMA3-8B) generally benefited more from few-shot learning
   - LLaMA3-70B performed slightly better in zero-shot settings

3. PE effects in few-shot setting:
   - Varied across models
   - GPT-3.5 and LLaMA3-70B showed improvements
   - LLaMA3-8B showed decreased performance

The authors note:

> "It important to note that we did not explore the aspect regarding the choice of the examples in the FS setting, which might have a varying effect on different models."

## 7. Discussions

### 7.1 Can LLMs with CoT yield logical reasoning for their inference outcomes?

The paper examines the responses of LLaMA3-70B in the ZS_CoT setting to assess the reasonableness of its reasoning. Key findings include:

1. Word cloud analysis:
   - Separate word clouds created for each severity category
   - Common terms across all categories: "collision," "intersection," "vehicle," and "driver"

2. Factors considered by LLaMA3-70B:
   - Crash-related factors (e.g., "rear-end collision", "pedestrian")
   - Environmental conditions (e.g., "wet road surface", "rain")
   - Driver behavior (e.g., "failing to yield," "misjudgment")
   - Driver characteristics (e.g., "male" "older driver")
   - Vehicle factors (e.g., "bus", "headlights")
   - Road design elements (e.g., "traffic lights", "intersection")

3. Category-specific observations:
   - Minor or non-injury accidents: Associated with lower impact terms (e.g., "Low speed", "slow")
   - Serious injury accidents: Moderate impact terms, adverse weather conditions, relatively high speeds
   - Fatal accidents: High-energy impact scenarios, higher speeds, pedestrian vulnerability

The authors provide detailed analysis of word clouds for each severity category and present four distinct examples to illustrate the CoT's reasoning process.

### 7.2 Limitations and future works

The study acknowledges several limitations:

1. Small sample size:
   > "One of the primary limitations of this study is the relatively small sample used, including only 150 instances (50 for each severity category). This limited dataset may not fully capture the variability and complexity of diverse real-world crash scenarios, potentially affecting the generalizability of the findings."

2. Future research directions:
   a. Expanding the dataset for more comprehensive evaluation
   b. Fine-tuning LLMs with more extensive and domain-specific data
   c. Investigating explanation methods for more interpretable and trustworthy results

The authors suggest:

> "Fine-tuning LLMs with more extensive and domain-specific data (e.g., crash reports and databases) can significantly enhance their domain knowledge to better understand the nuances and specificities of traffic accidents, leading to more accurate and reliable inference."

## 8. Conclusions

The paper concludes with several key points:

1. Efficacy of LLMs in crash severity inference:
   > "This study demonstrates the efficacy of LLMs in crash severity inference using textual narratives of crash events constructed from structured tabular data."

2. Performance of different models:
   - LLaMA3-70B consistently outperformed other models, especially in zero-shot settings

3. Effectiveness of techniques:
   - CoT and PE techniques led to enhanced performance
   - Improved logical reasoning and addressed alignment issues

4. Insights from CoT:
   > "Notably, the use of CoT provided valuable insights into LLM reasoning processes, revealing their capacity to consider multiple factors such as environmental conditions, driver behavior, and vehicle characteristics in the crash severity inference task."

5. Future potential:
   > "These findings collectively suggest that LLMs hold considerable promise for crash analysis and modeling. Future research may explore other safety applications beyond the severity inference."

## 9. Author contributions

The authors confirm their contributions to the paper as follows:

- Study conception and design: J. Yang, H. Zhen, N, Liu
- Data processing and cleaning: H. Zhen, Y. Shi
- Experiments design, analysis and interpretation of results: H. Zhen, Y. Shi, J. Yang
- Draft manuscript preparation: H. Zhen, Y. Shi, Y. Huang
- Review and editing: J. Yang, N. Liu

All authors reviewed the results and approved the final version of the manuscript.

## 10. References

The paper includes an extensive list of references, which are cited throughout the document. Some key references include:

1. Mannering et al. (2020) on the challenges of traffic accident modeling
2. OpenAI (2023) for information on GPT-3.5-turbo
3. AI@Meta (2024) for details on LLaMA3 models
4. Radford et al. (2019) on in-context learning
5. Yin (2020) on few-shot learning in natural language processing
6. Wang et al. (2023) and Shen et al. (2023) on LLM alignment and safety considerations
7. Kojima et al. (2022) on zero-shot reasoning in large language models
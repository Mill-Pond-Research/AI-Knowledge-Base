# LAMPER: Language Model and Prompt Engineering for Zero-Shot Time Series Classification

## Table of Contents

1. Introduction
2. Method
3. Experiments
4. Discussion and Conclusion
5. Acknowledgements
6. References

## 1. Introduction

<definition>LAMPER (LanguAge Model with Prompt EngineeRing)</definition> is a framework designed to systematically evaluate the adaptability of pre-trained language models (PLMs) in accommodating diverse prompts and their integration in zero-shot time series (TS) classification.

The study explores the potential of applying PLMs and prompt engineering to time series tasks, with a specific focus on zero-shot classification. This research is significant due to the following factors:

1. Time series-based tasks have wide-ranging implications in diverse professional fields, including healthcare, finance, and energy.
2. Pre-trained language models and prompt engineering have shown remarkable capabilities in executing various tasks under few-shot or zero-shot conditions in the field of natural language processing (NLP).
3. Time series tasks often require substantial domain expertise and bespoke model design, which can limit model performance and generalization capabilities.

The authors note that while recent efforts have applied PLMs and prompt engineering to various time series tasks such as forecasting, restoration, and anomaly detection, the effectiveness of combining PLMs and prompt engineering for zero-shot learning in time series classification remains unexplored.

<quote>This study introduces LanguAge Models with Prompt EngineeRing (LAMPER) for exploring the latent potential of PLMs in feature representation for TS data, with a specific focus on achieving zero-shot TS classification through the strategic utilization of diverse prompts and their fusion.</quote>

## 2. Method

The LAMPER framework consists of several key components and processes:

### 2.1 Prompt Design

Three types of prompts are designed:

1. <definition>Simple Description Prompt (SDP)</definition>
2. <definition>Detailed Description Prompt (DDP)</definition>
3. <definition>Feature Prompt (FP)</definition>

These prompts are strategically crafted to harness the strengths of both prompts and PLM to effectively represent features of time series data.

### 2.2 Time Series Slicing

To accommodate the maximum token input limit for the PLM, the time series is sliced into multiple sub-sequences, and corresponding sub-prompts are constructed.

### 2.3 PLM Encoding

The prompts are encoded using the PLM, resulting in multiple embeddings.

### 2.4 Pooling

A pooling method is applied to obtain the final embedding, which serves as the feature representation of the time series.

### 2.5 Pre-trained Language Models

Two PLMs with different length token constraints are deployed:

1. Longformer: 4096 maximum token length
2. BERT: 512 maximum token length

### 2.6 Feature Extraction

For the Feature Prompt (FP), features are obtained from the feature extraction algorithm of the Tsfresh module.

<quote>The process begins with the design of three prompts: the Simple Description Prompt (SDP), Detailed Description Prompt (DDP), and Feature Prompt (FP), whose formats are detailed in Appendix A. These prompts are strategically crafted to harness the strengths of both prompts and PLM to effectively represent features of TS data.</quote>

## 3. Experiments

### 3.1 Dataset and Experimental Setting

The study utilizes the following resources:

- 128 univariate datasets from the UCR archive
- PLMs: 'bert-base-uncased' and 'longformer-base-4096'
- Tsfresh for feature extraction (11 features)
- SVM classifier with RBF kernel for final classification

<quote>Our study leverages a corpus of 128 univariate datasets sourced from the UCR archive (Dau et al., 2019) to achieve the training and evaluation of LAMPER. LAMPER employs the 'bert-base-uncased' and 'longformer-base-4096' PLMs to extract features from prompts.</quote>

### 3.2 Results

The experimental results are presented in Table 1 of the document. Key findings include:

1. The performance of LAMPER in zero-shot classification was not as high as anticipated.
2. PLMs appear to have constraints in grasping the nuances of time series data.
3. Detailed prompts provided a marginal enhancement in performance.
4. The maximum token input constraint imposed by PLMs results in the inadvertent loss of crucial contextual information embedded within the time series data.
5. The Longformer model outperformed BERT, likely due to its higher maximum token length.

<quote>Confronted with the observed inadequacy in the zero-shot classification endeavor, we meticulously scrutinize the performance of LAMPER across various datasets. Our deduction suggests that PLMs possess a constraint in grasping the nuances of TS data, despite a marginal enhancement in performance attributable to detailed prompts.</quote>

## 4. Discussion and Conclusion

The study's key findings and implications include:

1. Zero-shot time series classification through collaborative prompt engineering and PLMs did not yield the anticipated outcomes, despite PLMs' adeptness in diverse zero-shot tasks within NLP.

2. The constraints imposed by the maximum input length of PLMs necessitate the segmentation of time series data, resulting in a loss of contextual information when fed into PLMs.

3. Diverse prompts influence zero-shot classification outcomes, but the integration of multiple prompts does not uniformly confer improvements to the model.

4. The introduction of a well-designed time series encoder may prove instrumental in ameliorating PLMs' performance in zero-shot time series tasks.

Future research directions suggested by the authors include:

1. Construction of varied prompt types, such as sentiment analysis and mask filling derived from PLMs.
2. Development of a multi-prompts fusion model.
3. Focus on augmenting the adaptive capabilities of PLMs in handling time series data.

<quote>This paper delves into an investigation into the impact of various prompts and their integration on enhancing the performance of PLMs in zero-shot TS classification tasks. Despite their adeptness in diverse zero-shot tasks within NLP, our endeavors to implement zero-shot TS classification through collaborative prompt engineering and PLMs did not yield the anticipated outcomes.</quote>

## 5. Acknowledgements

The research is supported by various funding sources, including:

- National Natural Science Foundation of China
- Science, Technology, Innovation Commission of Shenzhen Municipality
- Shenzhen Medical Research Funds
- Department of Chemical Engineering-iBHE special cooperation joint fund project
- Tsinghua Shenzhen International Graduate School Cross-disciplinary Research and Innovation Fund Research Plan
- Bureau of Planning, Land and Resources of Shenzhen Municipality

## 6. References

The document includes references to several related works and resources, including:

1. Dau et al. (2019) - UCR time series archive
2. Beltagy et al. (2020) - Longformer: The long-document transformer
3. Devlin et al. (2019) - BERT: Pre-training of deep bidirectional transformers for language understanding
4. Brown et al. (2020) - Language models are few-shot learners
5. Wei et al. (2022) - Finetuned language models are zero-shot learners
# Batch Calibration: Rethinking Calibration for In-Context Learning and Prompt Engineering

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
4. Systematic Analysis of Calibration
   4.1 Bias in Prompting and In-Context Learning (ICL)
   4.2 Overview of ICL Calibration Methods
   4.3 Design Principles Behind Calibrations
5. Batch Calibration
   5.1 Batch Calibration (BC)
   5.2 Adjustable Batch Calibration Layer (BCL)
   5.3 Calibrating Vision-Language Models
6. Experiments
   6.1 Experimental Setup
   6.2 Main Experiments
   6.3 Robustness and Ablation Studies
7. Conclusion
8. Limitations and Future Work
9. References

## 1. Document Overview

This knowledge base entry is based on the paper "Batch Calibration: Rethinking Calibration for In-Context Learning and Prompt Engineering" by Han Zhou et al., published as a conference paper at ICLR 2024. The document presents a novel approach to calibrating large language models (LLMs) for in-context learning (ICL) and prompt engineering tasks. It introduces Batch Calibration (BC), a simple yet effective method for mitigating biases in LLM predictions, and compares it with existing calibration techniques.

The paper is significant in the field of natural language processing and machine learning, as it addresses critical issues in the performance and reliability of LLMs when used for few-shot learning tasks. The authors provide a comprehensive analysis of existing calibration methods, identify their limitations, and propose a new approach that demonstrates superior performance across a wide range of tasks.

## 2. Introduction

The introduction sets the stage for the paper's contributions by highlighting the importance of prompting and in-context learning in the current landscape of large language models. The authors state:

<quote>Prompting and in-context learning (ICL) have become efficient learning paradigms for large language models (LLMs). However, LLMs suffer from prompt brittleness and various bias factors in the prompt, including but not limited to the formatting, the choice verbalizers, and the ICL examples.</quote>

This observation underscores the need for effective calibration methods to improve the reliability and performance of LLMs in few-shot learning scenarios. The authors then introduce their main contribution:

<quote>In this work, we first conduct a systematic analysis of the existing calibration methods, where we both provide a unified view and reveal the failure cases. Inspired by these analyses, we propose Batch Calibration (BC), a simple yet intuitive method that controls the contextual bias from the batched input, unifies various prior approaches, and effectively addresses the aforementioned issues.</quote>

The introduction also highlights the key advantages of the proposed Batch Calibration method:

<quote>BC is zero-shot, inference-only, and incurs negligible additional costs. In the few-shot setup, we further extend BC to allow it to learn the contextual bias from labeled data.</quote>

These features make BC a practical and efficient solution for improving LLM performance in various applications.

## 3. Related Work

The paper builds upon and extends several areas of research in natural language processing and machine learning. While the document doesn't have a dedicated "Related Work" section, it references relevant prior work throughout. Key areas of related work include:

1. Prompt Learning: The authors mention soft prompting and hard prompting techniques, citing works such as Li & Liang (2021), Lester et al. (2021), and Shin et al. (2020).

2. In-Context Learning: The paper cites several works investigating the properties and limitations of in-context learning, including Lu et al. (2022), Razeghi et al. (2022), and Shin et al. (2022).

3. Calibration Methods: The authors discuss existing calibration techniques, particularly Contextual Calibration (Zhao et al., 2021), Domain-Context Calibration (Fei et al., 2023), and Prototypical Calibration (Han et al., 2023).

4. Test-Time Adaptation: While not directly related to LLMs, the paper mentions test-time adaptation techniques from computer vision, such as TENT (Wang et al., 2021) and other approaches for mitigating domain covariate shift.

These related works provide the foundation for the authors' analysis and the development of their novel Batch Calibration method.

## 4. Systematic Analysis of Calibration

### 4.1 Bias in Prompting and In-Context Learning (ICL)

The authors begin by formally defining the problem of bias in prompting and in-context learning. They explain that LLMs make predictions by computing:

<quote>arg max y ∈Y p(y|x_i, C), where p ∈ R^J is the logits, and Y denotes the verbalizers that define the label set for J classes.</quote>

They identify several sources of bias in ICL:

<quote>In the ICL context C, majority label bias and recency label bias (Zhao et al., 2021) can bias the prediction of LLMs toward the most frequent label and the label towards the end of the demonstration, respectively. Among verbalizer tokens y_j ∈ Y, LLMs are shown to be inherently biased towards predicting the label-tokens that appear more frequently from pretraining term statistics (Shin et al., 2022; Razeghi et al., 2022).</quote>

### 4.2 Overview of ICL Calibration Methods

The paper provides a comprehensive overview of existing calibration methods:

1. Contextual Calibration (CC): 
<quote>Zhao et al. (2021) propose to calibrate the LLM prediction by first measuring the entire test-time distribution ˆp by a content-free input. Using "N/A" as a content-free example, the model score distribution is generated by ˆp_cf := p(y|[N/A], C). CC then generates the calibrated output by transforming the uncalibrated scores p(y|x, C) with W ∈ R^(J×J) via Wp(y|x, C), where W = diag(ˆp_cf)^(-1) offsets the uncalibrated scores with the model score (a contextual prior) triggered by the content-free sample.</quote>

2. Domain-Context Calibration (DC):
<quote>Fei et al. (2023) propose DC that estimates a contextual prior ˆp(y|C) by using a random in-domain sequence. It randomly sampled L tokens at an average sentence length from an unlabeled text set. Then, it estimates the content-free prediction prior by averaging the model score T times, such that: ˆp_random = 1/T ∑^T_t=1 p(y|[RANDOM TEXT]_t, C). The final test-time prediction is then calibrated by dividing the estimated prior prediction, or equivalently in logits space, p(y|x_i, C) - ˆp_random.</quote>

3. Prototypical Calibration (PC):
<quote>PC learns a decision boundary with Gaussian mixture models (GMMs). It estimates J prototypical clusters for the model output p for J classes: P_GMM(p) = ∑^(J-1)_j=0 α_j P_G(p|μ_j, Σ_j), where P_G denotes a multi-variate Gaussian distribution, and the parameters: mixing coefficient α, mean vector μ, covariance matrix Σ are estimated by the Expectation-Maximization (Moon, 1996). Followed by an automatic label assignment strategy, the predicted label is then computed by arg max_j P_G(p_j|μ*, Σ*) in the inference time.</quote>

### 4.3 Design Principles Behind Calibrations

The authors provide a novel perspective on calibration methods by analyzing their decision boundaries. They pose two important research questions:

1. What constitutes a better decision boundary for calibrations?
2. Is content-free prior a good estimator of contextual bias?

Through their analysis, they find that:

<quote>We find that while theoretically more flexible, the non-linear decision boundaries learned by PC tend to be susceptible to overfitting and may suffer from instability in EM-GMM. We hypothesize that the PC boundary is even more vulnerable to instability for more challenging multi-class tasks due to the increased difficulties of learning clusters and assigning classes correctly. Conversely, we find that linear decision boundaries, as evidenced by CC and DC, can be more robust and generalizable across tasks.</quote>

Regarding the use of content-free inputs, they observe:

<quote>We hypothesize that contrary to the proposals made by CC and DC, relying on content-free tokens for calibration is not always optimal and may even introduce additional bias, depending on the task type.</quote>

These insights form the basis for the development of their novel Batch Calibration method.

## 5. Batch Calibration

### 5.1 Batch Calibration (BC)

The authors introduce Batch Calibration (BC) as a novel approach to calibrating LLMs. The key idea behind BC is to estimate the contextual bias from the batch of input samples:

<quote>We propose to estimate the contextual bias for each class p(y = y_j|C) from a batch with M samples, {x_1, ..., x_M}, in a content-based manner by marginalizing the output score over all samples x ~ P(x) within the batch:

p(y|C)_j = E_x~P(x)[p(y = y_j|x, C)] ≈ 1/M ∑^M_i=1 p(y = y_j|x^(i), C) ∀ y_j ∈ Y.</quote>

The calibrated probability is then obtained by:

<quote>ˆy_i = arg max_y∈Y p_BC(y|x_i, C) = arg max_y∈Y [p(y|x_i, C) - ˆp(y|C)].</quote>

The authors highlight several advantages of BC:

1. It is zero-shot and only involves unlabeled test samples.
2. It incurs negligible computation costs.
3. It can be computed once all test samples are seen or in an on-the-fly manner using a running estimate.

### 5.2 Adjustable Batch Calibration Layer (BCL)

To further refine the calibration when labeled data is available, the authors introduce an extension called Adjustable Batch Calibration Layer (BCL):

<quote>Specifically, instead of deducting the bias term ˆp from the test data only, we introduce a single additional hyperparameter strength γ ∈ R:

p_BCL(y|x_i, C) = p(y|x_i, C) - γ ˆp(y|C),

where γ controls the strength of BC. To select the appropriate γ, we simply perform a grid search by uniformly sampling T different γ values in [a, b] (we set [a, b] := [-5, 5], but any reasonable range may be used). The strength γ is then learned by γ* = arg max_γ∈[a,b] R(p_BC, γ), where R(·, ·) is the evaluation function (e.g., accuracy) on the set of labeled data, allowing the amount of calibration to be adjusted from evaluation metrics directly.</quote>

### 5.3 Calibrating Vision-Language Models

The authors extend the application of BC to vision-language models (VLMs), specifically focusing on Zero-Shot CLIP:

<quote>In this work, we propose to apply BC to Zero-Shot (ZS) CLIP (Radford et al., 2021) and mitigate the biases in its zero-shot classifications. We follow the same notation from Sec. 3.1, where the test image is now x, and the prompt template becomes the context, C. Similarly, we append the BC layer at the output of the ZS CLIP and calibrate for each class following Eq. 1 & 2.</quote>

This extension demonstrates the versatility of the BC method across different modalities and model architectures.

## 6. Experiments

### 6.1 Experimental Setup

The authors conduct extensive experiments to evaluate the performance of Batch Calibration across various tasks and model sizes. They use the following datasets and models:

Datasets:
- Natural Language Tasks: GLUE and SuperGLUE benchmarks, including SST-2, MNLI, QNLI, MRPC, QQP, BoolQ, CB, COPA, RTE, WiC, and ANLI-R{1,2,3}.
- Image Classification Tasks: SVHN, EuroSAT, and CLEVR.

Models:
- Language Models: PaLM 2 (S, M, L variants)
- Vision-Language Models: CLIP ViT-B/16

### 6.2 Main Experiments

The main experiments demonstrate the effectiveness of Batch Calibration across various tasks and model sizes. Key findings include:

1. Performance on Natural Language Tasks:
<quote>Notably, BC consistently outperforms ICL, yielding significant performance enhancement of 8% and 6% on PaLM 2-S and PaLM 2-L, respectively. This shows that the BC implementation successfully mitigates the contextual bias from the in-context examples and unleashes the full potential of LLM in efficient learning and quick adaptation to new tasks.</quote>

2. Comparison with Existing Methods:
<quote>BC improves over the state-of-the-art PC baseline by 6% on PaLM 2-S, and surpasses the competitive CC baseline by another 3% on average on PaLM 2-L.</quote>

3. Generalizability:
<quote>BC is a generalizable and cheaper technique across all evaluated tasks, delivering stable performance improvement, whereas previous baselines exhibit varying degrees of instability across tasks: DC baseline is the least competitive; CC displays more failure cases in multi-sentence classification tasks, particularly for paraphrasing and NLI tasks, as we hypothesized in Sec 3.3; PC, while occasionally competitive, exhibits large performance fluctuations, as evidenced by its large standard deviation, resulting in frequent substantial performance degradation.</quote>

4. Performance with Varying ICL Shots:
<quote>We further analyze the performance of BC by varying the ICL shots from 0 to 4 shots as shown in Fig. 6, and BC again outperforms all baseline methods. We also observe an overall trend for improved performance when more shots are available, and the performance disparities between BC and ICL converge on some tasks, which suggests that BC allows LLMs to more effectively take advantage of more in-context demonstrations.</quote>

5. Calibrating Vision-Language Models:
<quote>As shown in Fig. 7, BC significantly improves the zero-shot baseline by 12% on average. This observation further highlights the presence of contextual bias even within vision-language models, and BC can successfully restore the performance of VLM in image classification tasks, suggesting that BC may serve as a versatile and common technique for mitigating contextual biases across multiple modalities.</quote>

### 6.3 Robustness and Ablation Studies

The authors conduct several robustness and ablation studies to further validate the effectiveness of Batch Calibration:

1. Robustness to Prompt Engineering Choices:
<quote>We analyze the robustness of BC with respect to common prompt engineering design choices that were previously shown to significantly affect LLM performance (Lu et al., 2022; Liu et al., 2022a): choices and orders of in-context examples, the prompt template for ICL, and the verbalizers, as shown in Fig. 8 evaluated on RTE.</quote>

The authors' findings demonstrate the robustness of BC across various prompt engineering aspects:

a) ICL Choices:
<quote>First, we find that BC is more robust to ICL choices and can mostly achieve the same performance with different ICL examples.</quote>

b) ICL Order:
<quote>Additionally, given a single set of ICL shots, altering the order between each ICL example has minimal impact on the BC performance.</quote>

c) Prompt Templates:
<quote>Furthermore, we analyze the robustness of BC under 10 designs of prompt templates, where BC shows consistent improvement over the ICL baseline. Therefore, though BC makes further improvements, a well-designed template can further enhance the performance of BC.</quote>

d) Verbalizer Designs:
<quote>Lastly, we examine the robustness of BC to variations in verbalizer designs. Remarkably, even when employing unconventional choices such as emoji pairs as the verbalizers (listed in Tables 7 & 10) leading to dramatic oscillations of ICL performance, BC largely recovers performance.</quote>

These findings highlight the versatility and stability of BC across various prompt engineering scenarios, making it a valuable tool for practitioners working with LLMs.

2. Batch Size Analysis:
The authors investigate the impact of batch size on BC performance:

<quote>We study the impact of batch size on the performance of BC as shown in Fig. 9. In contrast to PC, which also leverages an unlabeled estimate set, BC is remarkably more sample efficient, achieving a strong performance with only around 10 unlabeled samples, whereas PC requires more than 500 unlabeled samples before its performance stabilizes.</quote>

This observation underscores the efficiency of BC in terms of sample requirements, making it practical for scenarios with limited data availability.

3. Adjustable Batch Calibration Layer (BCL) Performance:
The authors evaluate the performance of BCL, which incorporates labeled data:

<quote>In Table 3, we show that further slight gains, 1% on average, can be achieved by involving an adjustable strength parameter that refines the calibration and mitigates estimation errors. This alternative design not only makes BC applicable to both zero-shot and few-shot setups but also shows its capability to improve further from limited labeled data.</quote>

The results demonstrate that BCL can provide additional performance improvements when labeled data is available, offering flexibility in both zero-shot and few-shot scenarios.

4. Visualization of Decision Boundaries:
The authors provide visualizations of decision boundaries for different calibration methods:

<quote>In Fig. 2, we observe that uncalibrated ICL is biased towards predicting negative in the SST-2 task. This biased prediction is then mitigated by each calibration method, where we observe a rotated decision boundary from CC, a shifted boundary from DC, and a non-linear boundary between the GMMs by PC.</quote>

These visualizations offer insights into how different calibration methods adjust the decision boundaries, helping to explain their performance characteristics.

5. Analysis of Content-Free Inputs:
The authors investigate the effectiveness of content-free inputs used in existing calibration methods:

<quote>We hypothesize that contrary to the proposals made by CC and DC, relying on content-free tokens for calibration is not always optimal and may even introduce additional bias, depending on the task type. For example, in a textual entailment task involving question-sentence pairs, we empirically observe that an ICL template employed with a content-free token 'N/A' such as 'Question: N/A, Sentence: N/A, Answer:' will result in a biased prediction towards 'entailment', because although 'N/A' is intended to be content-free, the LLM may nevertheless construe 'N/A' in the sentence to be substantively entailed to the 'N/A' in the question due to surface text equivalency.</quote>

This analysis highlights the potential limitations of using content-free inputs for calibration, particularly in complex tasks involving multiple text inputs.

6. Performance Across Model Sizes:
The authors evaluate BC's performance across different model sizes:

<quote>We present the results across a diverse set of NLP tasks in Table 2. Notably, BC consistently outperforms ICL, yielding significant performance enhancement of 8% and 6% on PaLM 2-S and PaLM 2-L, respectively.</quote>

These results demonstrate that BC's effectiveness is consistent across different model sizes, indicating its scalability and broad applicability.

7. Zero-Shot Performance:
The authors also evaluate BC in zero-shot settings:

<quote>In Table 5, we report accuracy (%) on natural language classification tasks with 0-shot PaLM 2-S and 1-shot PaLM 2-M models in a single seed. The results show that BC outperforms other calibration methods and uncalibrated ICL in many tasks, even in zero-shot scenarios.</quote>

This analysis highlights BC's effectiveness in scenarios where no in-context examples are provided, further demonstrating its versatility.

8. Vision-Language Model Calibration:
The authors extend their analysis to vision-language models:

<quote>In Table 6, we report accuracy (%) on image classification tasks with the zero-shot CLIP ViT-16/B. We additionally report on UCF101, FGVC Aircraft, and DTD. The results show that BC improves performance across various image classification tasks, with an average improvement of 4.8% over the zero-shot baseline.</quote>

These results demonstrate BC's applicability beyond text-based tasks, showing its potential for improving performance in multimodal scenarios.

In conclusion, the robustness and ablation studies provide strong evidence for the effectiveness, efficiency, and versatility of Batch Calibration across various scenarios, model sizes, and modalities. The method's ability to improve performance while remaining robust to prompt engineering choices makes it a valuable tool for practitioners working with large language models and vision-language models.

## 7. Conclusion

The authors conclude their paper by summarizing the main contributions and findings:

<quote>We first revisit previous calibration methods while addressing two critical research questions from an interpretation of decision boundaries, revealing their failure cases and deficiencies. We then propose Batch Calibration, a zero-shot and inference-only calibration technique. We also introduce an adjustable extension, BCL, which offers more refined calibrations when labeled data is accessible.</quote>

They highlight the key advantages of their proposed method:

<quote>While methodologically simple and easy to implement with negligible computation cost, we show that BC scales from a language-only setup to the vision-language context, achieving state-of-the-art performance in both modalities. BC significantly improves the robustness of LLMs with respect to prompt designs, and we expect easy prompt engineering with BC while exploring the potential of BC to generative tasks in the future.</quote>

The conclusion emphasizes the practical implications of their work, suggesting that BC can make prompt engineering easier and more effective for users working with LLMs.

## 8. Limitations and Future Work

The authors acknowledge some limitations of their work and propose directions for future research:

1. Batch Requirement:
<quote>Though BC has shown remarkable sample efficiency in terms of batch sizes, it still requires a batch of inputs to estimate the contextual bias.</quote>

To address this, they introduce a running estimation approach:
<quote>We introduce a running estimation for BC from mini-batches, which subsequently stabilizes the prediction of LLMs when more mini-batches arrive.</quote>

2. Extension to Generative Tasks:
The authors recognize the potential for extending BC to generative tasks:
<quote>In future work, we will endeavor to explore calibration for generative tasks while extending BC to more models across modalities. We suspect that the contextual bias may also exist in short-form generation tasks.</quote>

They propose a potential approach for generative tasks:
<quote>Motivated by Zhao et al. (2021), one possible solution for generative tasks is to calibrate over the logits of the first output token since the following tokens are likely deterministic based on the first token.</quote>

3. Further Exploration of Prompt Engineering:
The authors express their expectation for future work in prompt engineering:
<quote>We expect easy prompt engineering with BC while exploring the potential of BC to generative tasks in the future.</quote>

This suggests that future research could focus on developing more sophisticated prompt engineering techniques that leverage BC's capabilities.

4. Broader Application Across Modalities:
While the paper demonstrates BC's effectiveness in both language and vision-language models, future work could explore its application to other modalities or multimodal setups.

5. Theoretical Analysis:
The paper primarily focuses on empirical results. Future work could delve deeper into the theoretical foundations of BC, potentially providing formal guarantees or a more comprehensive understanding of its properties.

6. Long-term Effects and Adaptability:
Future research could investigate the long-term effects of using BC in production systems and its adaptability to changing data distributions or task requirements over time.

By addressing these limitations and exploring these future directions, researchers can further enhance the capabilities and understanding of Batch Calibration, potentially leading to even more robust and effective calibration techniques for large language models and beyond.

## 9. References

The paper includes an extensive list of references, which are crucial for understanding the context and background of the research. Some key references include:

1. Anil, R., et al. (2023). Palm 2 technical report. arXiv preprint arXiv:2305.10403.

2. Brown, T. B., et al. (2020). Language models are few-shot learners. Advances in Neural Information Processing Systems 33: Annual Conference on Neural Information Processing Systems 2020, NeurIPS 2020.

3. Fei, Y., et al. (2023). Mitigating label biases for in-context learning. Proceedings of the 61st Annual Meeting of the Association for Computational Linguistics.

4. Han, Z., et al. (2023). Prototypical calibration for few-shot learning of language models. The Eleventh International Conference on Learning Representations.

5. Li, X. L., & Liang, P. (2021). Prefix-tuning: Optimizing continuous prompts for generation. Proceedings of the 59th Annual Meeting of the Association for Computational Linguistics.

6. Liu, P., et al. (2023). Pre-train, prompt, and predict: A systematic survey of prompting methods in natural language processing. ACM Computing Surveys, 55(9):1-35.

7. Lu, Y., et al. (2022). Fantastically ordered prompts and where to find them: Overcoming few-shot prompt order sensitivity. Proceedings of the 60th Annual Meeting of the Association for Computational Linguistics.

8. Radford, A., et al. (2021). Learning transferable visual models from natural language supervision. Proceedings of the 38th International Conference on Machine Learning, ICML 2021.

9. Wang, A., et al. (2018). GLUE: A multi-task benchmark and analysis platform for natural language understanding. Proceedings of the 2018 EMNLP Workshop BlackboxNLP: Analyzing and Interpreting Neural Networks for NLP.

10. Zhao, Z., et al. (2021). Calibrate before use: Improving few-shot performance of language models. Proceedings of the 38th International Conference on Machine Learning, ICML 2021.
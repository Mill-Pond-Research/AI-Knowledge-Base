From LLMs to LLM-based Agents for Software Engineering: A Survey of Current, Challenges and Future

Authors: Haolin Jin, Linghan Huang, Haipeng Cai, Jun Yan, Bo Li, Huaming Chen

Table of Contents:
1. Introduction
2. Existing Works and Survey Structure
3. Preliminaries
4. Requirement Engineering and Documentation
5. Code Generation and Software Development
6. Autonomous Learning and Decision Making
7. Software Design and Evaluation
8. Software Test Generation
9. Software Security and Maintenance
10. Discussion
11. Conclusion

1. Introduction

This knowledge base document is based on a comprehensive survey that explores the transformative power of Large Language Models (LLMs) and LLM-based agents in the field of software engineering. The document serves as a practical guide for researchers, practitioners, and decision-makers seeking to understand and harness the potential of these technologies to drive innovation, efficiency, and growth in software development processes.

<key_points>
- The survey covers six key topics in software engineering: requirement engineering, code generation, autonomous decision-making, software design, test generation, and software maintenance.
- It reviews and differentiates the work of LLMs and LLM-based agents across these topics, examining their differences and similarities in tasks, benchmarks, and evaluation metrics.
- The document discusses the models and benchmarks used, providing a comprehensive analysis of their applications and effectiveness in software engineering.
</key_points>

The authors state the significance of this work:

<quote>
We anticipate this work will shed some lights on pushing the boundaries of LLM-based agents in software engineering for future research.
</quote>

2. Existing Works and Survey Structure

This section provides an overview of existing works in the field and outlines the structure of the survey. The authors have collected a total of 117 papers directly relevant to this topic, covering the six software engineering domains mentioned earlier.

<methodology>
The paper collection process primarily involved searching DBLP and arXiv databases, focusing on recent studies from the latter half of 2023 to May 2024. This approach ensured the inclusion of the latest research. The authors filtered out non-LLM-related papers and those with fewer than seven pages. They then manually screened the remaining papers to remove any with formatting errors or student projects. Additionally, they employed a snowballing search technique to capture significant works that might have been missed initially.
</methodology>

The authors provide a breakdown of the collected papers:

<quote>
Figure. 2 presents the distribution of these papers across the six SE domains and the proportion of LLM-based agents studies. However, some papers can be counted as multi-class fields so the literature review in the figure is more than 117 in total.
</quote>

3. Preliminaries

This section introduces the foundational concepts of large language models, including the evolution of their frameworks and an overview of their architectures. It also covers the background of LLM-based agents and their applications and distinctions in the field of software engineering.

<definition>
Large Language Models (LLMs): Advanced AI models trained on vast amounts of text data, capable of understanding and generating human-like text across a wide range of tasks and domains.
</definition>

<definition>
LLM-based Agents: Intelligent systems that integrate LLMs with embodied agents, capable of not only processing natural language but also completing tasks through perception and actions in physical or virtual environments.
</definition>

The authors describe the evolution of LLMs:

<quote>
The development of Long Short-Term Memory (LSTM) and Recurrent Neural Networks (RNN) during this period enabled more effective handling of the sequential nature of language data [24] [25]. These models addressed challenges associated with the lack of dependency in context, thereby enhancing the application of NLP in various domains.
</quote>

They also highlight the significance of the Transformer model:

<quote>
In 2017 the new framework called "Transformer" introduced by Google's research team [26]. The transformer model based on the self-attention mechanism which significantly improved the effectiveness of language models. The inclusion of positional encoding not only solved the long-sequence dependency issue but also enabled parallel computation, which was a considerable improvement over previous models.
</quote>

4. Requirement Engineering and Documentation

This section explores the application of LLMs and LLM-based agents in requirement engineering and documentation tasks.

<key_points>
- LLMs have demonstrated significant potential in automating and enhancing tasks such as requirement elicitation, classification, generation, specification generation, and quality assessment.
- LLM-based agents bring both efficiency and accuracy for tasks like requirement elicitation, classification, generation, and verification.
- Compared to traditional LLMs, LLM-based agent systems exhibit higher levels of automation and precision through task division and collaboration.
</key_points>

The authors provide an example of LLM application in requirement classification:

<quote>
The PRCBERT framework, utilizing the BERT pre-trained language model, transforms classification problems into a series of binary classification tasks through flexible prompt templates, significantly improving classification performance [48]. Studies have shown that the PRCBERT achieved an F1 score of 96.13% on the PROMISE dataset which outperform the previous state-of-arts NoRBERT [49] and BERT-MLM models [31].
</quote>

For LLM-based agents, they highlight:

<quote>
[61] proposes the AISD framework, which continuously improves and optimizes generated use cases and code through ongoing user feedback and interaction. In the process of the experiment, humans need to first give a fuzzy requirement definition, and then LLM-based agent will improve the requirement case according to this information, and then design the model and generate the system according to the case, and then the generated results will let humans judge whether the requirements are met or not.
</quote>

5. Code Generation and Software Development

This section discusses the application of LLMs and LLM-based agents in code generation and software development tasks.

<key_points>
- LLMs have optimized various tasks in code generation and software development through automation and reasoning, covering areas such as code generation, debugging, code comprehension, code completion, code transformation, and multi-turn interactive code generation.
- LLM-based agents have shown significant potential and advantages by substantially improving task efficiency and effectiveness through multi-agent collaboration.
</key_points>

The authors describe an example of LLM application in code generation:

<quote>
In [68], researchers comprehensively evaluated the performance of multiple LLMs on L2C(language to code) tasks. The results showed that GPT-4 demonstrates strong capability in tasks such as semantic parsing, mathematical reasoning, and Python programming. With instruction tuning and support from large-scale training data, the model can understand and generate code that aligns with user intent, achieving high-precision code generation.
</quote>

For LLM-based agents, they highlight:

<quote>
[76] proposes a self-collaboration framework where multiple ChatGPT (GPT-3.5-turbo) agents act as different roles to collaboratively handle complex code generation tasks. Specifically, the introduction of Software Development Methodology (SDM) divides the development process into three stages: analysis, coding, and testing. Each stage is managed by specific roles, and after completing their tasks, each role provides feedback and collaborates with others to improve the quality of the generated code.
</quote>

6. Autonomous Learning and Decision Making

This section explores the application of LLMs and LLM-based agents in autonomous learning and decision-making tasks.

<key_points>
- LLMs have demonstrated powerful reasoning and decision-making abilities in tasks such as automated debugging and self-correction.
- LLM-based agents can perform complex reasoning and decision-making tasks with the help from the LLM, and also improve their adaptability in dynamic environments through continuous learning and optimization.
</key_points>

The authors provide an example of LLM application in autonomous learning:

<quote>
In [91], the SELF-DEBUGGING method was proposed, enabling LLMs to debug code by analyzing execution results and natural language explanations. This method significantly improved the accuracy and sample efficiency of code generation tasks especially for complex problems. Experimental results on the Spider and TransCoder benchmarks showed that the SELF-DEBUGGING method increase the model's accuracy by 2-12% which demonstrates the potential of LLMs in autonomous learning to debug and correct any erros.
</quote>

For LLM-based agents, they highlight:

<quote>
[98] proposes the Reflexion framework, a novel approach that strengthens learning through language feedback rather than traditional weight updates to avoid expensive re-train costs. The framework uses self-reflection and language feedback to help language agents learn from mistakes, significantly improving performance in decision-making, reasoning, and programming tasks.
</quote>

7. Software Design and Evaluation

This section discusses the application of LLMs and LLM-based agents in software design and evaluation tasks.

<key_points>
- LLMs have been extensively applied to tasks such as automation, optimization, and code understanding in software design and evaluation.
- LLM-based agents enhance the development efficiency and code quality, as well as showcase the broad applicability and immense potential of LLM-based agents in practical software engineering tasks.
</key_points>

The authors describe an example of LLM application in software design:

<quote>
ChatGPT has been widely utilized for various software engineering tasks and demonstrated excellent performance in tasks like log summarization, pronoun resolution, and code summarization, achieving a 100% success rate in both log summarization and pronoun resolution tasks [113].
</quote>

For LLM-based agents, they highlight:

<quote>
[121] introduces ChatDev, the first virtual chat-driven software development company, a concept of using LLMs not just for specific tasks but as central coordinators in a chat-based, multi-agent framework. this approach allows for more structured, efficient, and collaborative software development processes, exploring how chat-driven multi-agent systems can achieve efficient software design and evaluation, reduce code vulnerabilities, and enhance development efficiency and quality.
</quote>

8. Software Test Generation

This section explores the application of LLMs and LLM-based agents in software test generation tasks.

<key_points>
- LLMs have been applied to various aspects of software test generation, including security test generation, bug reproduction, general bug reproduction, fuzz testing, and coverage-driven test generation.
- LLM-based agents can enhance test reliability and quality by distributing tasks such as test generation, execution, and optimization through a multi-agent collaborative system.
</key_points>

The authors provide an example of LLM application in test generation:

<quote>
[132] aims to evaluate the effectiveness of using GPT-4 to generate security tests, demonstrating how to conduct supply chain attacks by exploiting dependency vulnerabilities. The study experimented with different prompt styles and templates to explore the effectiveness of varying information inputs on test generation quality, the results showed that tests generated by ChatGPT successfully discovered 24 proof-of-concept vulnerabilities in 55 applications, outperforming existing tools TRANSFER [133] and SIEGE.
</quote>

For LLM-based agents, they highlight:

<quote>
[140] evaluates the effectiveness of LLMs in generating high-quality test cases and identifies their limitations. It proposes a novel multi-agent framework called TestChain. The paper evaluates StarChat, CodeLlama, GPT-3.5, and GPT-4 on the HumanEval and LeetCode-hard datasets. Experimental results show that the TestChain framework, using GPT-4, achieved 71.79% accuracy on the LeetCode-hard dataset, an improvement of 13.84% over baseline methods. On the HumanEval dataset, TestChain with GPT-4 achieved 90.24% accuracy.
</quote>

9. Software Security and Maintenance

This section discusses the application of LLMs and LLM-based agents in software security and maintenance tasks.

<key_points>
- LLMs have been applied to tasks such as vulnerability detection, automatic repair, penetration testing, and system robustness evaluation.
- LLM-based agents bring more autonomy and flexibility in the field of software security and maintenance, demonstrating their strong potential in proactive defense, complex task handling, and meeting high reliability requirements.
</key_points>

The authors describe an example of LLM application in vulnerability detection:

<quote>
[146] aims to investigate the potential of applying LLMs to the task of vulnerability detection in source code and to determine if the performance limits of CodeBERT-like models are due to their limited capacity and code understanding ability. The study fine-tuned the WizardCoder model (an improved version of StarCoder) and compared its performance with the ContraBERT model on balanced and unbalanced datasets. The experimental results showed that WizardCoder outperformed ContraBERT in both ROC AUC and F1 scores, significantly improving Java function vulnerability detection performance, which achieved the state-of-art performance at that time by improving ROC AUC from 0.66 in CodeBERT to 0.69.
</quote>

For LLM-based agents, they highlight:

<quote>
[160] addresses the challenge of automatically and appropriately repairing access control (AC) vulnerabilities in smart contracts. The innovation of this paper lies in combining mined RBAC practices with LLMs to create a context-aware repair framework for AC vulnerabilities. The model primarily uses GPT-4, enhanced by a new method called ACFIX, which mines common RBAC practices from existing smart contracts and employs a Multi-Agent Debate (MAD) mechanism to verify the generated patches through debates between generator and verifier agents to ensure correctness. Experimental results show that ACFIX successfully repaired 94.92% of access control vulnerabilities, significantly outperforming the baseline GPT-4's 52.54%.
</quote>

10. Discussion

This section provides a comprehensive analysis of the findings from the survey, including:

- Experiment Models: The authors analyze the frequency of use of different LLMs in software engineering tasks based on the 117 papers reviewed.
- Topics Overlapping: They discuss the distribution of literature across the six themes and the overlap between different topics.
- Benchmarks and Metrics: The authors analyze the common benchmarks and evaluation metrics used across the six topics for both LLMs and LLM-based agents.

<key_findings>
- GPT-3.5, GPT-4, LLaMA2, and Codex are frequently used models in software engineering tasks.
- There is significant overlap between topics, particularly between autonomous learning and decision making and software security and maintenance.
- Common benchmarks include MBPP, HumanEval, and Defects4J, while evaluation metrics often include accuracy, success rate, and F1 score.
</key_findings>

11. Conclusion

The authors summarize the key findings of their comprehensive literature review on the application of LLMs and LLM-based agents in software engineering. They highlight the differences and impacts brought by LLM-based agents compared to traditional LLMs in terms of tasks, benchmarks, and evaluation metrics across the six identified topics.

<conclusion>
The emergence of LLM-based agents has led to extensive research and applications across various software engineering topics, demonstrating different emphases compared to traditional LLMs in terms of tasks, benchmarks, and evaluation metrics. This survey provides a foundation for future research in the field of LLM-based agents in software engineering.
</conclusion>

Glossary:

<glossary>
- LLM: Large Language Model
- NLP: Natural Language Processing
- LSTM: Long Short-Term Memory
- RNN: Recurrent Neural Network
- BERT: Bidirectional Encoder Representations from Transformers
- GPT: Generative Pre-trained Transformer
- RBAC: Role-Based Access Control
- APR: Automated Program Repair
- RAG: Retrieval-Augmented Generation
- SOTA: State-of-the-Art
</glossary>

References:

<references>
[1] S. Wang, D. Chollak, D. Movshovitz-Attias, and L. Tan, "Bugram: bug detection with n-gram language models," in Proceedings of the 31st IEEE/ACM International Conference on Automated Software Engineering, pp. 724–735, 2016.
[2] A. Vogelsang and M. Borg, "Requirements engineering for machine learning: Perspectives from data scientists," in 2019 IEEE 27th International Requirements Engineering Conference Workshops (REW), (Jeju, Korea (South)), pp. 245–251, 2019.
[3] "Chatgpt: Optimizing language models for dialogue," 11 2022. [Online; accessed 17-July-2024].
...
[168] A. Cheshkov, P. Zadorozhny, and R. Levichev, "Evaluation of chatgpt model for vulnerability detection," 2023.
</references>

This comprehensive knowledge base document provides an in-depth overview of the current state, challenges, and future directions of LLMs and LLM-based agents in software engineering. It serves as a valuable resource for researchers, practitioners, and decision-makers looking to understand and leverage these technologies in various aspects of software development.
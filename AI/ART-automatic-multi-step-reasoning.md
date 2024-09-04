# ART: Automatic Multi-Step Reasoning and Tool-Use for Large Language Models

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
4. ART Framework
   4.1 Overview
   4.2 Task Library
   4.3 Tool Library
   4.4 Human Feedback
5. Experimental Setup
6. Results
   6.1 Results on the Task Library
   6.2 Test Tasks (Cross-Task Transfer)
   6.3 Improving ART
7. Conclusion
8. Appendix
   8.1 Task Library
   8.2 Task Selection
   8.3 Tool Use
   8.4 Baselines
   8.5 Human Feedback
9. Terminology and Definitions
10. References and Further Reading

## 1. Document Overview

This knowledge base entry is based on the research paper "ART: Automatic Multi-Step Reasoning and Tool-Use for Large Language Models" by Bhargavi Paranjape, Scott Lundberg, Sameer Singh, Hannaneh Hajishirzi, Luke Zettlemoyer, and Marco Tulio Ribeiro. The paper introduces a novel framework called ART (Automatic Reasoning and Tool-use) that enables large language models (LLMs) to perform complex reasoning tasks and use external tools without the need for task-specific demonstrations or careful scripting.

The document is significant in the field of natural language processing and artificial intelligence, as it addresses key limitations of current LLMs in multi-step reasoning and tool use. The ART framework provides a gradient-free approach that allows for automatic generation of reasoning steps and seamless integration of external tools, potentially improving the performance and capabilities of LLMs across a wide range of tasks.

## 2. Introduction

<definition>Large language models (LLMs)</definition> have demonstrated remarkable capabilities in few-shot and zero-shot learning, allowing them to adapt to new tasks with minimal task-specific training. However, these models face limitations in areas such as multi-step reasoning, mathematics, and accessing up-to-date information.

The authors introduce the ART framework to address these limitations. ART uses frozen LLMs to automatically generate intermediate reasoning steps as a program. When presented with a new task, ART selects demonstrations of multi-step reasoning and tool use from a task library. During execution, ART seamlessly pauses generation when external tools are called and integrates their output before resuming generation.

Key features of ART include:

1. Automatic generation of multi-step reasoning
2. Seamless integration of external tools
3. Cross-task generalization
4. Extensibility through human feedback

The authors demonstrate that ART achieves substantial improvements over few-shot prompting and automatic Chain of Thought (CoT) on unseen tasks in the BigBench and MMLU benchmarks. ART also matches the performance of hand-crafted CoT prompts on many of these tasks.

## 3. Related Work

The paper discusses several related areas of research:

1. <definition>Scaled finetuning for low-resource adaptation</definition>: Recent work has shown that finetuning LLMs on a broad range of public NLP datasets with prefixed instructions is effective for cross-task generalization in both zero-shot and few-shot settings.

2. <definition>Prompting with intermediate reasoning steps</definition>: Chain-of-thought (CoT) prompting encourages LLMs to generate intermediate reasoning steps prior to the final answer. While initially hand-crafted, recent work has shown that LLMs can generate CoT-style multi-step reasoning in a zero-shot manner.

3. <definition>Tool Use</definition>: There is growing interest in overcoming LLM limitations with external tools such as search engines, web browsers, calculators, and translation systems. Most approaches require large amounts of human supervision or carefully constructed prompts tailored to specific tasks and tools.

The authors position ART as an advancement over these existing approaches, offering a more flexible and extensible framework for multi-step reasoning and tool use.

## 4. ART Framework

### 4.1 Overview

The ART framework consists of several key components:

1. <definition>Task Library</definition>: A collection of demonstration programs for various tasks, organized by skill clusters.
2. <definition>Tool Library</definition>: A set of external tools that can be called during the reasoning process.
3. <definition>Program Grammar</definition>: A custom parsing expression grammar (PEG) that defines the structure of reasoning programs.
4. <definition>Human Feedback Loop</definition>: A mechanism for incorporating human feedback to improve performance on specific tasks.

The process of using ART involves the following steps:

1. Given a new task, ART retrieves similar tasks from the task library.
2. Demonstrations from these tasks are used to construct a prompt for the LLM.
3. The LLM generates a program for the new task, which includes reasoning steps and tool calls.
4. ART parses the generated program, executing tool calls and integrating their outputs.
5. The final answer is produced based on the completed program.

### 4.2 Task Library

The task library is a crucial component of ART, providing demonstrations of multi-step reasoning and tool use for various tasks. The authors describe the process of constructing the task library:

1. Analyze input-output instances of tasks in BigBench.
2. Identify common reasoning skills required for solving these tasks.
3. Group tasks into skill clusters (e.g., Arithmetic, Code, Search, Free-form reasoning, String Operations).
4. Select 2-4 tasks from each cluster and author decomposed programs with appropriate tool use.

The resulting task library contains 15 tasks that cover a significant proportion of BigBench tasks for classification.

<example>
Example of a program in the task library for string operations:

```
Description: (Date Understanding) Find the required date in MM/DD/YYYY using information about related events and dates in the input.
Input: The deadline is Jun 1, 2021, which is 2 days away from now. What is the date 24 hours later in MM/DD/YYYY?
Q1: [string reformat] Jun 1, 2021 in MM/DD/YYYY
#1: 06/01/2021
Q2: [arithmetic] 06/01/2021 is 2 days away from now. What date is today?
#2: Today is 04/01/2021
Q3: [arithmetic] What date is 24 hours later than today?
#3: 05/01/2021
Q4: [EOQ]
Ans: 05/31/2021
```
</example>

### 4.3 Tool Library

The tool library contains external tools that can be called during the reasoning process. The authors describe several tools implemented in ART:

1. <definition>Search</definition>: Uses SerpAPI to provide Google search functionality.
2. <definition>Code Generation</definition>: Utilizes the Codex model for generating Python code.
3. <definition>Code Execution</definition>: Runs Python code in a virtual environment with pre-installed packages.
4. <definition>Knowledge Base lookup</definition>: Allows for looking up data by keys in a relational knowledge base.
5. <definition>Prolog Engine</definition>: Executes Prolog code for logical reasoning tasks.

The authors provide detailed descriptions of how each tool is implemented and integrated into the ART framework.

### 4.4 Human Feedback

ART is designed to be amenable to human feedback, allowing for immediate improvements without additional finetuning. The authors describe two main types of feedback:

1. Editing existing programs in the task library.
2. Adding or modifying tools in the tool library.

<example>
Example of human feedback:
"For the Physics QA task, a user corrects a specific program by including a step that adds the unit of measurement, and adds this (modified) program to the task library."
</example>

The authors demonstrate that this feedback mechanism can lead to significant performance improvements on specific tasks with minimal human intervention.

## 5. Experimental Setup

The authors evaluate ART on several benchmarks:

1. 19 unseen test tasks from BigBench
2. 6 MMLU tasks
3. Various tasks used by related work on tool use (SQUAD, TriviaQA, SVAMP, MAWPS)

They compare ART to several baselines:

1. Few-shot/Direct prompting
2. Auto-CoT (automatic generation of CoT-style reasoning)
3. ART without tool use
4. Best published GPT-3 results with multi-step decomposition and/or tool use

The experiments use InstructGPT (text-davinci-002) as the frozen LLM and Codex for code generation. The authors set the number of seed tasks in the prompt to N = 3 and use 2 demonstration programs from each task.

## 6. Results

### 6.1 Results on the Task Library

The authors present results for tasks in the task library, where demonstrations in the prompt include two instances of the task itself, along with other instances from tasks in the same cluster. Key findings include:

1. ART significantly improves performance over few-shot learning (+14.9 percentage points on average).
2. ART outperforms AutoCoT on most tasks, even without tool use (+8 percentage points on average).
3. When tool use is enabled, ART outperforms AutoCoT on all tasks except one (+17.7 percentage points on average).
4. Tools are called in approximately 95% of test instances and significantly improve performance (+7.91 percentage points).
5. Gains from tool use are particularly significant for arithmetic tasks (+21.85 percentage points on average).

### 6.2 Test Tasks (Cross-Task Transfer)

The authors evaluate ART's performance on unseen tasks to measure cross-task generalization. Key findings include:

1. ART outperforms few-shot learning (+6.9 percentage points on average).
2. ART is better than AutoCoT on almost all tasks (+24.6 percentage points on average).
3. Tools are called frequently (89% of instances) and contribute significantly to the gains over baselines.
4. ART performs favorably compared to the best published GPT-3 results, especially on arithmetic tasks (+6.1 percentage points on average).

The authors also evaluate ART on MMLU tasks and a subset of tasks used to evaluate Toolformer, demonstrating strong performance across different benchmarks.

### 6.3 Improving ART

The authors explore two methods for further improving ART's performance:

1. <definition>Self-consistency</definition>: Generating multiple LLM outputs and taking the most frequent answer. This approach consistently improves performance across various tasks.

2. <definition>Human feedback</definition>: Editing programs and adding them as demonstrations leads to significant gains in performance on specific tasks. The authors show that ART with human feedback consistently outperforms the best published GPT-3 baseline for the task at hand.

## 7. Conclusion

The authors conclude that ART represents a significant advancement in automatic multi-step reasoning and tool use for large language models. Key contributions of ART include:

1. A lightweight grammar to represent multi-step reasoning as a program.
2. An extensible library of seed tasks with authored programs.
3. A tool library consisting of useful external utilities.
4. An interpretable reasoning framework that allows for human feedback and improvement.

ART achieves substantial improvements over few-shot prompting and automatic generation of CoT reasoning on unseen tasks in various benchmarks. The framework's flexibility and extensibility make it a promising approach for enhancing the capabilities of large language models across a wide range of tasks.

## 8. Appendix

The appendix provides additional details on various aspects of the ART framework and experimental setup:

### 8.1 Task Library

The authors provide a detailed description of how the task library was designed and constructed, including the process of identifying common skills and grouping tasks into clusters.

### 8.2 Task Selection

Two strategies for task selection are described:

1. Task-Cluster based: Uses a held-out set of examples to determine the best task cluster for demonstrations.
2. LLM-Similarity based: Uses the LLM to determine similarity between tasks based on their descriptions and examples.

### 8.3 Tool Use

Detailed descriptions of how various tools are implemented and integrated into the ART framework are provided, including code generation, code execution, and knowledge base lookup.

### 8.4 Baselines

The authors provide detailed descriptions of the baselines used for comparison, including few-shot prompting, Auto-CoT, and the best published GPT-3 approaches.

### 8.5 Human Feedback

Examples of human feedback for various tasks are presented, demonstrating how the ART framework can be improved through minimal human intervention.

## 9. Terminology and Definitions

<definition>Large Language Models (LLMs)</definition>: Advanced AI models trained on vast amounts of text data, capable of generating human-like text and performing various language tasks.

<definition>Chain of Thought (CoT)</definition>: A prompting technique that encourages LLMs to generate intermediate reasoning steps before producing a final answer.

<definition>Few-shot learning</definition>: The ability of a model to learn from a small number of examples or demonstrations.

<definition>Zero-shot learning</definition>: The ability of a model to perform a task without any specific training or examples for that task.

<definition>Task Library</definition>: A collection of demonstration programs for various tasks, organized by skill clusters in the ART framework.

<definition>Tool Library</definition>: A set of external tools that can be called during the reasoning process in the ART framework.

<definition>Parsing Expression Grammar (PEG)</definition>: A type of analytic formal grammar used to define the structure of reasoning programs in ART.

<definition>Self-consistency</definition>: A technique that involves generating multiple outputs from a language model and selecting the most frequent answer.

<definition>Cross-task generalization</definition>: The ability of a model to apply knowledge and skills learned from one task to perform well on different, but related tasks.

## 10. References and Further Reading

The paper includes an extensive list of references, which can be found at the end of the original document. Some key references include:

1. Brown, T. B., et al. (2020). Language models are few-shot learners. arXiv preprint arXiv:2005.14165.

2. Chen, M., et al. (2021). Evaluating large language models trained on code. arXiv preprint arXiv:2107.03374.

3. Chowdhery, A., et al. (2022). PaLM: Scaling language modeling with pathways. arXiv preprint arXiv:2204.02311.

4. Kojima, T., et al. (2022). Large language models are zero-shot reasoners. arXiv preprint arXiv:2205.11916.

5. Ouyang, L., et al. (2022). Training language models to follow instructions with human feedback. arXiv preprint arXiv:2203.02155.

6. Wei, J., et al. (2022). Chain of thought prompting elicits reasoning in large language models. arXiv preprint arXiv:2201.11903.
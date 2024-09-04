# Goal-Oriented Prompt Engineering for Large Language Models: A Survey

Authors: Haochen Li, Jonathan Leung, Zhiqi Shen
Affiliation: Nanyang Technological University, Singapore

## Table of Contents

1. Introduction
2. Taxonomy of Methods
   2.1 Decomposing Goal into Sub-goal Sequences
   2.2 Action Selection for Attaining Sub-goals
   2.3 Executing Actions to Get Sub-goal Results
   2.4 Evaluating Sub-goal Results
   2.5 Further Selection of Valuable Sub-goals
3. Discussion
4. Challenges & Opportunities
5. Conclusion
6. References

## 1. Document Overview

This knowledge base entry is based on a comprehensive survey paper that explores goal-oriented prompt engineering for Large Language Models (LLMs). The document provides an in-depth analysis of current prompt engineering methods, highlighting the limitations of designing prompts based on anthropomorphic assumptions. It introduces a novel taxonomy for goal-oriented prompting methods and demonstrates the broad applicability of this framework.

The significance of this survey lies in its systematic approach to categorizing and analyzing goal-oriented prompting methods. It offers valuable insights for researchers and practitioners working with LLMs, providing a foundation for improving LLM performance across various tasks.

## 2. Key Sections

### 2.1 Decomposing Goal into Sub-goal Sequences

This section discusses methods for breaking down complex problems into manageable sub-goals, a strategy that aligns with human problem-solving approaches.

#### Iterative decomposition

Iterative decomposition involves generating sub-goals sequentially, with each new sub-goal informed by previous results. 

Key methods:
- Chain-of-thought prompting (CoT)
- DecomP
- Successive Prompting
- Self-ask

Quote: "Chain-of-thought prompting (CoT) (Wei et al., 2022) can be considered the first work that follows iterative decomposition. With either 'Let's think step by step.' (Kojima et al., 2022), or intermediate reasoning steps in in-context examples in the prompt, LLMs can imitate the decomposition process and solve the problem step by step."

#### Plan-then-execute decomposition

This approach generates the entire sub-goal sequence at once, rather than iteratively.

Key methods:
- Least-to-most prompting
- Plan-and-solve prompting
- DEPS
- GITM

Quote: "Plan-and-solve prompting (Wang et al., 2023b) further improves the efficiency of Least-to-most prompting by merging the generation of the plan and execution of the plan into one output."

#### External decomposition

This method leverages external tools to ensure accurate decomposition.

Key methods:
- LLM+P
- SayPlan

Quote: "To ensure the accuracy of decomposition, LLM+P (Liu et al., 2023a) and SayPlan (Rana et al., 2023) take advantage of classical planners. They use LLMs to translate goals written in natural language to planning domain definition language so that classical planners can deal with them."

### 2.2 Action Selection for Attaining Sub-goals

This section discusses methods for choosing effective actions to achieve sub-goals.

#### Constrain-then-select

This method predefines an action space and then has LLMs select from it.

Key methods:
- MWP
- PEARL
- DecomP
- SayPlan
- RLP
- ProCoT

Quote: "Constrain-then-select method predefines an action space and then has LLMs select the actual action among the space. As in MWP (Zhang et al., 2023), to deal with math word problems, the authors first employ an operation prediction module to predict the needed calculation operation (e.g. multiplication, summation). LLMs are then used to select the appropriate operands and complete the calculation."

#### Select-then-mapping

This approach first generates actions based on LLM knowledge, then maps them to valid actions.

Key methods:
- Zero-shot planners
- SALP
- Re-Prompting

Quote: "Zero-shot planners (Huang et al., 2022a), SALP (Gramopadhye and Szafir, 2023), and Re-Prompting (Raman et al., 2022) aim to solve agent planning problems in an interactive environment. In such virtual environments, there are only a few admissible actions that can be applied."

### 2.3 Executing Actions to Get Sub-goal Results

This section explores methods for executing actions to achieve sub-goals, often leveraging external tools.

Key methods:
- DecomP
- Program-of-Thoughts (PoT)
- Recmind
- Toolformer
- HuggingGPT

Quote: "Toolformer (Schick et al., 2023) specifically studied which APIs to call and when to call them when using external tools. In their paper, several tools are adopted, including a calculator, a calendar, a BM25-based Wikipedia search engine, and a fine-tuned language model (LM)."

### 2.4 Evaluating Sub-goal Results

This section discusses methods for evaluating and correcting sub-goal results to address the hallucination problem in LLMs.

#### Evaluate with LLMs

Methods that use LLMs themselves for evaluation:
- Self-refine
- SelfCheck
- Reflexion

Quote: "Self-refine (Madaan et al., 2023) is the first work addressing the evaluation of sub-goal results. After getting the output of LLMs, Self-refine feeds the output combined with task-specific prompts to the same LLM to get feedback for the output."

#### Evaluate with external evaluators

Methods that use external tools or heuristics for evaluation:
- Self-debug
- INTERVENOR
- SayPlan
- Re-prompting
- GITM
- LLM-Planner
- Inner Monologue
- DEPS

Quote: "Self-debug (Chen et al., 2023) and INTERVENOR (Wang et al., 2023a) leverages unit tests and executors to gain feedback on generated code snippets. The authors also empirically show that leveraging unit test error messages leads to superior performance than LLM's self-reflection."

### 2.5 Further Selection of Valuable Sub-goals

This section discusses methods for selecting the most valuable sub-goals from multiple candidates.

#### Chain-of-thought and its variants

Methods that improve upon the basic CoT approach:
- Self-consistency
- MCR
- Recmind
- Selection-Inference

Quote: "Self-consistency (Wang et al., 2022) prompts LLMs via CoT several times and then conducts majority votes based on the similarity of different outputs from each COT sequence to decide valuable sub-goal sequences."

#### Tree of thoughts and its variants

Methods that enable exploration and comparison of sub-goals based on a tree structure:
- ToT
- RAP
- GDP-Zero

Quote: "ToT (Yao et al., 2023) advances over CoT by enabling the exploration and comparison of sub-goals based on a tree structure. To make global choices, at each sub-goal when traversing the tree, a decision can be made that involves backtracking or looking ahead based on the implementation of traditional searching algorithms like breadth-first search."

#### Graph of thoughts

A method that models all LLM-generated sub-goals as a graph:
- GoT

Quote: "GoT (Besta et al., 2023) advances ToT by modeling all of the LLM-generated sub-goals as a graph. While in ToT, only sub-goals in a sequence or at the same step can interact with each other through comparison, lookahead, or backtracking, GoT allows the synergy of arbitrary sub-goals."

## 3. Discussion

This section provides an overview of the application areas and performance comparisons of the surveyed methods.

### Application Areas

The survey covers 11 main tasks:
1. Arithmetic reasoning
2. Commonsense reasoning
3. Symbolic reasoning
4. Logical reasoning
5. Planning in virtual environment
6. Planning in real environment
7. Multihop question answering
8. Open-domain question answering
9. Code generation
10. Dialogue systems
11. Recommender systems

Quote: "We could see that 60% of the works focus on reasoning, 31% of the works are for planning and the remaining 9% of the works are for other tasks."

### Performance Comparisons

The survey provides performance comparisons for various tasks, including:
- Planning in virtual environment
- Commonsense reasoning
- Code generation
- Rating prediction in recommender systems
- Arithmetic reasoning
- Symbolic reasoning and logical reasoning
- Multihop question answering

Quote: "Compared with vanilla CoT, on average goal decomposition (Plan-and-solve) improves by 6.1%, action selection (PoT) improves by 2.9%, and valuable sub-goal selection (Self-consistency) improves by 22.7% in arithmetic reasoning, as shown in Table 6."

## 4. Challenges & Opportunities

This section outlines four main areas for future research and development in goal-oriented prompt engineering:

### 1. Hierarchical Goal Decomposition

The survey suggests exploring hierarchical decomposition to break down complex sub-goals into simpler "sub-sub-goals."

Quote: "To make sure each sub-goal is simple enough to be handled by LLMs, researchers are now exploring hierarchical decomposition, which further decomposes sub-goals into simpler 'sub-sub-goals'."

### 2. Efficiency

The authors propose considering both task-agnostic and task-specific efficiency measures when designing goal-oriented prompting methods.

Quote: "Task-agnostic efficiency aims at measuring the efficiency of model targets for any task, for instance, the total number of prompting times before reaching the sub-goal or final goal. On the other hand, task-specific efficiency is designed to measure efficiency that appears only in certain tasks."

### 3. Stage Synergy

The survey highlights the potential for improving performance by carefully integrating different stages of the goal-oriented framework.

Quote: "We found two works that combine their methods, on one stage, with a method, on another stage, in their ablation studies and show performance improvement (Chen et al., 2022; Wang et al., 2023b). This suggests the power of synergizing the stages in the goal-oriented framework and careful integration of stages would have the potential for further improvement."

### 4. Broader Applications

The authors suggest exploring the application of goal-oriented prompt engineering in other domains, such as software development and medical diagnosis.

Quote: "Moreover, goal-oriented prompt engineering has the potential for broader applications, in for example software development and medical diagnosis, beyond the 11 tasks summarized in this paper."

## 5. Conclusion

The survey provides a comprehensive review of goal-oriented prompt engineering for Large Language Models, introducing a novel taxonomy and demonstrating the broad applicability of this framework. It highlights the potential for significant improvements in LLM performance across various tasks by adopting goal-oriented approaches.

The authors emphasize the need for further research in areas such as hierarchical goal decomposition, efficiency optimization, stage synergy, and broader applications of goal-oriented prompt engineering.

Quote: "We hope this paper can serve as an overview of the current state of goal-oriented prompt engineering and stimulate further research on this important topic."

## 6. References

The document includes an extensive list of references, which can be found at the end of the PDF. Some key references include:

1. Wei, J., et al. (2022). Chain-of-thought prompting elicits reasoning in large language models.
2. Wang, L., et al. (2023b). Plan-and-solve prompting: Improving zero-shot chain-of-thought reasoning by large language models.
3. Yao, S., et al. (2023). Tree of thoughts: Deliberate problem solving with large language models.
4. Besta, M., et al. (2023). Graph of thoughts: Solving elaborate problems with large language models.

## Terminology and Definitions

<definition>
Large Language Models (LLMs): Advanced AI models trained on vast amounts of text data, capable of generating human-like text and performing various language-related tasks.
</definition>

<definition>
Prompt Engineering: The process of designing and optimizing text inputs (prompts) to elicit desired outputs from language models.
</definition>

<definition>
Goal-Oriented Prompt Engineering: An approach to prompt design that focuses on breaking down complex tasks into manageable sub-goals and guiding LLMs through a structured problem-solving process.
</definition>

<definition>
Chain-of-Thought (CoT): A prompting technique that encourages LLMs to generate intermediate reasoning steps when solving problems.
</definition>

<definition>
Tree of Thoughts (ToT): An advanced prompting method that explores multiple reasoning paths in a tree-like structure, enabling more complex problem-solving.
</definition>

<definition>
Graph of Thoughts (GoT): A prompting approach that models sub-goals and their relationships as a graph, allowing for more flexible interactions between different reasoning steps.
</definition>

## Core Concepts and Principles

1. Goal Decomposition: Breaking down complex tasks into simpler, manageable sub-goals.
2. Action Selection: Choosing appropriate actions to achieve each sub-goal.
3. Action Execution: Implementing selected actions, often with the help of external tools.
4. Result Evaluation: Assessing the outcomes of executed actions and correcting errors.
5. Valuable Sub-goal Selection: Identifying and prioritizing the most important sub-goals for achieving the overall objective.

These concepts form the foundation of the goal-oriented framework for prompt engineering, which aims to improve LLM performance by mimicking human problem-solving strategies.

## AI-Friendly Features

<metadata>
{
  "topic": "Goal-Oriented Prompt Engineering",
  "subtopics": [
    "Goal Decomposition",
    "Action Selection",
    "Action Execution",
    "Result Evaluation",
    "Valuable Sub-goal Selection"
  ],
  "relatedConcepts": [
    "Large Language Models",
    "Chain-of-Thought Prompting",
    "Tree of Thoughts",
    "Graph of Thoughts"
  ],
  "applicationAreas": [
    "Arithmetic Reasoning",
    "Commonsense Reasoning",
    "Planning",
    "Question Answering",
    "Code Generation",
    "Dialogue Systems",
    "Recommender Systems"
  ]
}
</metadata>
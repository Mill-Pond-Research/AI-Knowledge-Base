# Large Language Models are Human-Level Prompt Engineers

Authors: Yongchao Zhou, Andrei Ioan Muresanu, Ziwen Han, Keiran Paster, Silviu Pitis, Harris Chan, Jimmy Ba

## Table of Contents

1. Introduction
2. Related Work
3. Natural Language Program Synthesis Using LLMs
   3.1 Initial Proposal Distributions
   3.2 Score Functions
   3.3 Iterative Proposal Distributions
4. Large Language Models are Human-Level Prompt Engineers
   4.1 Instruction Induction
   4.2 BIG-Bench
   4.3 Zero-shot Chain of Thought
   4.4 TruthfulQA
5. Quantitative Analysis
   5.1 LLMs for Proposal Distribution
   5.2 LLMs for Selection
   5.3 Iterative Monte Carlo Search
6. Conclusion
7. References

## 1. Introduction

<introduction>
This knowledge base document is based on a comprehensive paper that explores the capabilities of large language models (LLMs) in prompt engineering. The document serves as a practical guide for researchers and practitioners seeking to understand and leverage the potential of LLMs in generating effective prompts for various natural language processing tasks.

The integration of LLMs into prompt engineering represents a significant advancement that redefines how we approach task-specific instructions for language models. This knowledge base aims to bridge the gap between theoretical concepts and practical applications, providing readers with the foundational concepts, methodologies, and experimental results crucial for understanding and implementing automatic prompt engineering techniques.

The document covers a wide range of topics, including:
- The formulation of prompt engineering as a natural language program synthesis problem
- A novel algorithm called Automatic Prompt Engineer (APE) for generating and selecting instructions
- Extensive experiments demonstrating the effectiveness of APE across various tasks
- Quantitative analyses of different components of the APE algorithm
- Future directions and potential applications of automatic prompt engineering
</introduction>

### Key Concepts

<key_concepts>
1. Large Language Models (LLMs): Advanced AI models capable of understanding and generating human-like text across a wide range of tasks.
2. Prompt Engineering: The process of designing and optimizing input prompts to elicit desired behaviors from language models.
3. Natural Language Program Synthesis: Framing the task of generating effective prompts as a program synthesis problem in natural language.
4. Automatic Prompt Engineer (APE): A novel algorithm that uses LLMs to generate and select optimal instructions for various tasks.
5. Zero-shot Learning: The ability of a model to perform a task without any specific training examples.
6. Few-shot Learning: The ability of a model to learn from a small number of examples.
7. Chain of Thought: A prompting technique that encourages step-by-step reasoning in language models.
</key_concepts>

## 2. Related Work

<related_work>
The paper builds upon and extends several areas of research in natural language processing and machine learning:

1. Large Language Models: The authors cite the work of Kaplan et al. (2020) and Vaswani et al. (2017) on the scaling and architecture of language models, which have led to unprecedented levels of generality in these models.

2. Prompt Engineering: The paper references works by Reynolds & McDonell (2021) on manual prompt engineering, as well as automated approaches by Gao et al. (2021) and Shin et al. (2020).

3. Program Synthesis: The authors draw inspiration from classical program synthesis techniques, citing works by Gulwani et al. (2017) and Ellis et al. (2021) on synthesizing programs from input-output examples.

4. Emergent Abilities of LLMs: The paper mentions the work of Wei et al. (2022a) on the emergent abilities of LLMs, including few-shot learning, zero-shot problem-solving, and instruction following.

5. Instruction Induction: The authors build upon the work of Honovich et al. (2022) on instruction induction, which serves as a baseline for their experiments.

These related works provide the foundation for the novel contributions presented in the paper, particularly the formulation of prompt engineering as a natural language program synthesis problem and the development of the APE algorithm.
</related_work>

## 3. Natural Language Program Synthesis Using LLMs

<natural_language_program_synthesis>
The authors propose a novel approach to prompt engineering by framing it as a natural language program synthesis problem. This section outlines the key components of their method, which leverages the capabilities of LLMs to generate, evaluate, and optimize prompts.

The problem is formulated as an optimization task:

ρ* = arg max_ρ f(ρ) = arg max_ρ E_(Q,A) [f(ρ, Q, A)]

Where:
- ρ is the instruction (prompt)
- Q is the input
- A is the output
- f is a scoring function

The authors propose to treat this optimization problem as a black-box optimization process guided by LLMs. Their algorithm, Automatic Prompt Engineer (APE), uses LLMs in two key components: proposal and scoring.
</natural_language_program_synthesis>

### 3.1 Initial Proposal Distributions

<initial_proposal_distributions>
The authors consider two approaches to generate high-quality candidates from P(ρ | D_train, f(ρ) is high):

1. Forward Mode Generation:
This approach translates the distribution P(ρ | D_train, f(ρ) is high) into words. The authors provide an example prompt:

"I gave a friend an instruction and five inputs. The friend read the instruction and wrote an output for every one of the inputs. Here are the input-output pairs:
Input: [...] Output: [...]
Input: [...] Output: [...]
...
The instruction was <COMPLETE>"

2. Reverse Mode Generation:
This approach uses an LLM with infilling capabilities to infer missing instructions. The authors provide an example template:

"I instructed my friend to <INSERT>.
The friend read the instruction and wrote an output for every one of the inputs. Here are the input-output pairs:
Input: [...] Output: [...]
Input: [...] Output: [...]
..."

The authors note that depending on the score function being used, there may exist more appropriate prompts than these samples.
</initial_proposal_distributions>

### 3.2 Score Functions

<score_functions>
The authors consider two potential score functions for evaluating the quality of generated instructions:

1. Execution accuracy:
This metric is defined as the 0-1 loss:
f(ρ, Q, A) = 1[M([ρ; Q]) = A]

Where M is the target model. In some tasks, execution accuracy may take into account invariants, such as order-invariant set matching loss.

2. Log probability:
This softer probabilistic score function is defined as:
log P(A | [ρ; Q])

The authors hypothesize that this metric might improve optimization by providing a more fine-grained signal when searching over low-quality instruction candidates.

To reduce computation costs, the authors adopt a filtering scheme where promising candidates receive more computational resources while low-quality candidates receive less. This is achieved through a multi-stage computation strategy:

1. Evaluate all candidates with a small subset of the training dataset.
2. For candidates with scores above a certain threshold, sample and evaluate a new non-overlapping subset from the training dataset to update the moving average of the score.
3. Repeat this process until a small set of candidates is left, which are then evaluated on the entire training dataset.

This adaptive filtering scheme significantly improves computational efficiency by allocating more resources to high-quality samples and reducing computation for low-quality candidates.
</score_functions>

### 3.3 Iterative Proposal Distributions

<iterative_proposal_distributions>
To address potential challenges with the initial proposal set, the authors explore an iterative process for resampling the set of candidate instructions U. They introduce a variant called "iterative APE" that involves the following steps:

1. Evaluate a set of instructions and filter out candidates with low scores.
2. Use an LLM to generate new instructions similar to those with high scores.

The authors provide a prompt for resampling:

"Generate a variation of the following instruction while keeping the semantic meaning.
Input: [INSTRUCTION]
Output: <COMPLETE>"

While this approach improves the overall quality of the proposal set U, the authors note that the highest scoring instruction tends to remain the same with more stages. They conclude that iterative generation provides marginal improvement over the relative simplicity and effectiveness of the initial generative process.
</iterative_proposal_distributions>

## 4. Large Language Models are Human-Level Prompt Engineers

This section presents the experimental results demonstrating the effectiveness of the APE algorithm across various tasks and datasets.

### 4.1 Instruction Induction

<instruction_induction>
The authors assess the effectiveness of zero-shot and few-shot in-context learning on 24 instruction induction tasks proposed by Honovich et al. (2022). These tasks span many facets of language understanding, from simple phrase structure to similarity and causality identification.

Methodology:
1. Sample five input-output pairs from the training data for each task.
2. Select the best instruction using the APE algorithm.
3. Evaluate the quality of the instruction by executing it on InstructGPT.
4. Repeat experiments five times with different random seeds to report mean and standard deviation.

Results:
1. Zero-shot Learning:
   - APE outperforms the "Greedy" baseline on every task.
   - APE achieves equal or better than human performance on 24 of 24 tasks.
   - The Interquartile Mean (IQM) across all 24 tasks shows that APE with InstructGPT outperforms human-engineered prompts, obtaining an IQM of 0.810 vs humans' 0.749.

2. Few-shot In-context Learning:
   - Adding an APE-generated instruction achieves comparable or better test performance than standard in-context learning on 21 of 24 tasks.
   - Counter-intuitively, adding in-context examples for Rhymes, Large Animal, and Second Letters hurts model performance.
   - The authors conjecture that this may be due to the selected instructions overfitting the zero-shot learning scenario.

Qualitative Analysis:
The authors provide a qualitative analysis of the Rhymes task, where they find an adversarial case when combining the instruction and in-context prompts. They observe that 4 of 5 filtered instructions ask to echo the input word, effectively hacking the evaluation with near-perfect test accuracy. However, this creates a misalignment between the instruction and the in-context examples, resulting in a significant drop in performance.
</instruction_induction>

### 4.2 BIG-Bench

<big_bench>
To evaluate APE on more challenging tasks, the authors propose and curate BIG-Bench Instruction Induction (BBII), a clean and tractable subset of 21 tasks from the BIG-Bench dataset. These tasks have clear, human-written instructions that can be applied to all examples in the dataset.

Methodology:
1. Use the reverse mode generation of InstructGPT to generate a set of instruction candidates for each task.
2. Rank the instructions based on their execution accuracy.
3. Execute the selected instruction on InstructGPT to compute the zero-shot performance on the test set.
4. Compare the results with the default human prompt.

Results:
- APE achieves comparable or better performance than the default human prompt on 17 out of 21 tasks.
- The authors report the normalized preferred metric defined in Srivastava et al. (2022), where a score of 100 corresponds to human expert performance, and 0 corresponds to random guessing.

The results demonstrate that APE can generate effective prompts for a wide range of complex tasks, often outperforming human-designed prompts.
</big_bench>

### 4.3 Zero-shot Chain of Thought

<zero_shot_chain_of_thought>
The authors use APE to discover a better chain of thought (CoT) prompt than the widely used "Let's think step by step." from Kojima et al. (2022).

Methodology:
1. Generate a dataset of questions and reasoning steps using InstructGPT with "Let's think step by step."
2. Remove any data points with incorrect answers.
3. Use APE to find a prompt starting with "Let's" that maximizes the likelihood of correct reasoning steps.

Results:
- APE produces the prompt: "Let's work this out in a step by step way to be sure we have the right answer."
- This generated prompt improves performance on MultiArith from 78.7 to 82.0 and on GSM8K from 40.7 to 43.0 compared to the original CoT prompt.
- The APE-generated prompt outperforms at least nine human-designed prompts tested by Kojima et al. (2022).

The authors note that this workflow represents a common use-case for APE, where prompt engineers can use the algorithm to optimize parts of their existing templates to improve performance.
</zero_shot_chain_of_thought>

### 4.4 TruthfulQA

<truthful_qa>
The authors apply APE to the TruthfulQA dataset to investigate how generated instructions can steer an LLM to generate answers with different styles, and study the trade-off between truthfulness and informativeness.

Methodology:
1. Use APE to learn instructions that maximize three metrics: truthfulness (% True), informativeness (% Info), and a combination of both (%True + %Info).
2. Rely on fine-tuned GPT-judge and GPT-info models to evaluate the scores, as these automated metrics align with human prediction over 90% of the time.
3. Randomly sample 100 out of 817 questions to form training demonstrations.
4. Use a "reverse" model to generate instructions based on six randomly chosen demonstration pairs.

Results:
1. APE outperforms the human-engineered prompt with only 200 candidates proposed by InstructGPT (175B).
2. Choosing the top 10 of 200 candidates on the training set generalizes well to the test set.
3. APE achieves over 40% accuracy in providing both true and informative answers (vs. 30% by the "help" prompt from humans).
4. The instructions discovered by APE tend to target the two ends of the %true-%info Pareto frontier:
   - Some instructions achieve very high truthfulness with answers such as "No comment," but these provide little information.
   - Other instructions aim for high informativeness but may sacrifice some truthfulness.

The authors note that this experiment demonstrates APE's ability to generate prompts that can steer LLMs towards specific behaviors, such as prioritizing truthfulness or informativeness.
</truthful_qa>

## 5. Quantitative Analysis

This section provides in-depth analyses of the various components of the APE algorithm, including the proposal distribution, score functions, and iterative search process.

### 5.1 LLMs for Proposal Distribution

<llms_for_proposal_distribution>
The authors investigate how the quality of the initial proposal distribution changes as the model size increases. They examine eight different models available via the OpenAI API, ranging from smaller models to larger, instruction-tuned models.

Methodology:
1. Generate 250 instructions per model.
2. Compute the execution accuracy on 50 test data points.
3. Visualize the survival function (percentage of instructions with test accuracy greater than a certain threshold) and the histogram of test accuracy.

Results:
1. Larger models tend to produce better proposal distributions than smaller ones.
2. Models fine-tuned to follow human instructions perform better than their non-fine-tuned counterparts.
3. For simple tasks (e.g., Pluralization), all instructions generated by the best model (InstructGPT 175B) have reasonable test accuracy.
4. For more challenging tasks (e.g., Start With), about half of the instructions are off-topic and perform poorly, even for the best model.

The authors conclude that while larger and instruction-tuned models generally produce better proposals, there is still room for improvement, especially on more complex tasks.
</llms_for_proposal_distribution>

### 5.2 LLMs for Selection

<llms_for_selection>
The authors investigate two key aspects of the selection process: the impact of proposal quality and the effectiveness of different scoring functions.

Impact of Proposal Quality:
1. Increase the sample size from 4 to 128 instructions and evaluate the test accuracy change.
2. Results show a monotonically increasing trend with diminishing returns, as human-level performance is achieved with 64 instruction samples.
3. The default sample size is set to 50 based on these findings.

Effectiveness of Scoring Functions:
The authors compare two scoring functions: execution accuracy and log probability.

1. Generate 250 instructions per task using InstructGPT (175B) in "forward" mode.
2. Compute the metric score and test accuracy on 10 test data points.
3. Visualize the Spearman correlation between the test accuracy and the two metrics.

Results:
- Execution accuracy aligns better with test performance across the tasks.
- Based on these findings, execution accuracy is chosen as the default metric for the APE algorithm.

The authors note that while small models may be less likely to generate good instructions, they can still produce some effective ones if enough candidates are sampled. This explains why APE outperforms the greedy approach across all eight models tested.
</llms_for_selection>

### 5.3 Iterative Monte Carlo Search

<iterative_monte_carlo_search>
The authors investigate the effectiveness of the iterative search process in improving instruction quality.

Methodology:
1. Visualize the survival function and histogram of test accuracy on the "Passivization" task and five additional tasks.
2. Compare APE and iterative APE on six selected tasks.

Results:
1. The survival plots show that the curves increase as the round number increases, suggesting that iterative search does result in a higher-quality proposal set.
2. Diminishing returns are observed after three rounds of iteration.
3. Iterative search marginally improves performance on tasks where APE underperforms humans but achieves similar performance on other tasks.

The authors conclude that while iterative search can provide some benefits, especially on challenging tasks, the improvements are often marginal compared to the initial APE algorithm. This suggests that the initial proposal generation and selection process is already quite effective in most cases.
</iterative_monte_carlo_search>

## 6. Conclusion

<conclusion>
The paper demonstrates that large language models can be effectively used as general-purpose computers that execute programs specified by natural language prompts. The authors have automated the prompt engineering process by formulating it as a black-box optimization problem, which they propose to solve using efficient search algorithms guided by LLMs.

Key findings and contributions:
1. The Automatic Prompt Engineer (APE) algorithm achieves human-level performance on various tasks with minimum human input.
2. APE outperforms previous baselines and human-engineered prompts on a wide range of tasks, including instruction induction, BIG-Bench tasks, zero-shot chain-of-thought reasoning, and TruthfulQA.
3. The algorithm demonstrates the ability to generate effective prompts for both zero-shot and few-shot learning scenarios.
4. APE can be used to optimize existing prompts, such as improving the chain-of-thought prompt for better reasoning performance.
5. The approach shows promise in steering language models towards desired behaviors, such as balancing truthfulness and informativeness.

Future directions and implications:
1. As recent LLMs demonstrate an impressive ability to follow human instructions, the authors expect many future models, including those for formal program synthesis, to have a natural language interface.
2. This work builds the foundation for controlling and steering generative artificial intelligence, opening up new possibilities for task-specific optimization of language models.
3. The approach could be extended to other domains with natural language interfaces, such as image generation models.

Limitations and areas for future research:
1. While APE performs well on a wide range of tasks, there are still some challenges in generating optimal prompts for very complex tasks.
2. The trade-offs between different objectives (e.g., truthfulness vs. informativeness) need further investigation.
3. The transferability of generated prompts between different models could be explored more extensively.

In conclusion, this work represents a significant advancement in the field of prompt engineering, demonstrating that LLMs can be used to automate and optimize the process of generating task-specific instructions. This has far-reaching implications for the development and application of AI systems across various domains.
</conclusion>

## 7. References

<references>
1. Kaplan, J., McCandlish, S., Henighan, T., Brown, T. B., Chess, B., Child, R., ... & Amodei, D. (2020). Scaling laws for neural language models. arXiv preprint arXiv:2001.08361.

2. Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez, A. N., ... & Polosukhin, I. (2017). Attention is all you need. Advances in neural information processing systems, 30.

3. Reynolds, L., & McDonell, K. (2021). Prompt programming for large language models: Beyond the few-shot paradigm. In Extended Abstracts of the 2021 CHI Conference on Human Factors in Computing Systems (pp. 1-7).

4. Gao, T., Fisch, A., & Chen, D. (2021). Making pre-trained language models better few-shot learners. In Proceedings of the 59th Annual Meeting of the Association for Computational Linguistics and the 11th International Joint Conference on Natural Language Processing (Volume 1: Long Papers) (pp. 3816-3830).

5. Shin, T., Razeghi, Y., Logan IV, R. L., Wallace, E., & Singh, S. (2020). AutoPrompt: Eliciting Knowledge from Language Models with Automatically Generated Prompts. In Empirical Methods in Natural Language Processing (EMNLP).

6. Gulwani, S., Polozov, O., Singh, R., et al. (2017). Program synthesis. Foundations and Trends® in Programming Languages, 4(1-2), 1-119.

7. Ellis, K., Wong, C., Nye, M., Sablé-Meyer, M., Morales, L., Hewitt, L., ... & Tenenbaum, J. B. (2021). Dreamcoder: Bootstrapping inductive program synthesis with wake-sleep library learning. In Proceedings of the 42nd ACM SIGPLAN International Conference on Programming Language Design and Implementation (pp. 835-850).

8. Wei, J., Tay, Y., Bommasani, R., Raffel, C., Zoph, B., Borgeaud, S., ... & Srivastava, A. (2022). Emergent abilities of large language models. arXiv preprint arXiv:2206.07682.

9. Honovich, O., Shaham, U., Bowman, S. R., & Levy, O. (2022). Instruction induction: From few examples to natural language task descriptions. arXiv preprint arXiv:2205.10782.

10. Srivastava, A., Rastogi, A., Rao, A., Shoeb, A. A. M., Abid, A., Fisch, A., ... & Zoph, B. (2022). Beyond the imitation game: Quantifying and extrapolating the capabilities of language models. arXiv preprint arXiv:2206.04615.

11. Kojima, T., Gu, S. S., Reid, M., Matsuo, Y., & Iwasawa, Y. (2022). Large language models are zero-shot reasoners. arXiv preprint arXiv:2205.11916.

12. Roy, S., & Roth, D. (2016). Solving general arithmetic word problems. arXiv preprint arXiv:1608.01413.

13. Cobbe, K., Kosaraju, V., Bavarian, M., Hilton, J., Nakano, R., Hesse, C., & Schulman, J. (2021). Training verifiers to solve math word problems. arXiv preprint arXiv:2110.14168.

14. Lin, S., Hilton, J., & Evans, O. (2022). TruthfulQA: Measuring how models mimic human falsehoods. In Proceedings of the 60th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers) (pp. 3214-3252).

15. Ouyang, L., Wu, J., Jiang, X., Almeida, D., Wainwright, C. L., Mishkin, P., ... & Lowe, R. (2022). Training language models to follow instructions with human feedback. arXiv preprint arXiv:2203.02155.

16. Zhang, S., Roller, S., Goyal, N., Artetxe, M., Chen, M., Chen, S., ... & Pascual, F. (2022). OPT: Open pre-trained transformer language models. arXiv preprint arXiv:2205.01068.

17. Chen, M., Tworek, J., Jun, H., Yuan, Q., Pinto, H. P. D. O., Kaplan, J., ... & Zaremba, W. (2021). Evaluating large language models trained on code. arXiv preprint arXiv:2107.03374.

18. Zeng, A., Liu, X., Du, Z., Wang, Z., Lai, H., Ding, M., ... & Zhang, C. (2022). GLM-130B: An open bilingual pre-trained model. arXiv preprint arXiv:2210.02414.
</references>
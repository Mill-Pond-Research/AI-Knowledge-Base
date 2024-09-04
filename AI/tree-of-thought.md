"Tree of Thoughts: Deliberate Problem Solving with Large Language Models"

Table of Contents:
1. Introduction
2. Background and Related Work
3. Tree of Thoughts Framework
4. Experimental Setup
5. Results and Analysis
6. Discussion
7. Conclusion
8. References and Further Reading

1. Introduction

The document "Tree of Thoughts: Deliberate Problem Solving with Large Language Models" presents a novel framework for enhancing the problem-solving capabilities of large language models (LLMs). This knowledge base entry provides a comprehensive overview of the Tree of Thoughts (ToT) approach, its implementation, and its implications for the field of artificial intelligence.

<significance>
The Tree of Thoughts framework represents a significant advancement in the use of language models for complex problem-solving tasks. It addresses limitations in current approaches and offers a more flexible and powerful method for leveraging LLMs in diverse applications.
</significance>

<scope>
This knowledge base entry covers the entire content of the original document, including:
- The motivation behind the Tree of Thoughts approach
- Detailed explanation of the ToT framework
- Experimental results on various tasks
- Comparison with existing methods
- Discussion of limitations and future directions
</scope>

2. Background and Related Work

2.1 Large Language Models in Problem Solving

Large language models, such as GPT (Generative Pre-trained Transformer) series, have demonstrated remarkable capabilities in a wide range of tasks requiring reasoning and knowledge application. However, their problem-solving abilities are often limited by their token-level, left-to-right decision-making process during inference.

<quote>
"Language models are increasingly being deployed for general problem solving across a wide range of tasks, but are still confined to token-level, left-to-right decision-making processes during inference. This means they can fall short in tasks that require exploration, strategic lookahead, or where initial decisions play a pivotal role."
</quote>

2.2 Chain of Thought Prompting

Chain of Thought (CoT) prompting is a popular approach for improving LLMs' reasoning capabilities. It involves providing intermediate steps or "thoughts" in the prompt to guide the model's reasoning process.

<definition>
Chain of Thought (CoT) prompting: A technique that augments input-output pairs with intermediate reasoning steps to improve language models' performance on complex tasks.
</definition>

2.3 Limitations of Current Approaches

The authors identify several limitations in current approaches to problem-solving with LLMs:

1. Lack of exploration: Models typically generate a single chain of thought without considering alternative paths.
2. No strategic lookahead: LLMs make decisions based on immediate context without considering long-term consequences.
3. Inability to backtrack: Once a decision is made, the model cannot revise earlier choices.

2.4 Cognitive Science Inspiration

The Tree of Thoughts approach draws inspiration from cognitive science, particularly the concept of dual-process models of human cognition.

<theory>
Dual Process Theory: This theory suggests that human cognition involves two distinct modes of thinking:
1. System 1: Fast, automatic, and unconscious
2. System 2: Slow, deliberate, and conscious
</theory>

The authors argue that current LLM approaches resemble System 1 thinking and could benefit from incorporating aspects of System 2 thinking.

3. Tree of Thoughts Framework

The Tree of Thoughts (ToT) framework is designed to address the limitations of current LLM problem-solving approaches by enabling more deliberate and strategic decision-making.

3.1 Key Components

<definition>
Tree of Thoughts (ToT): A framework that generalizes over the Chain of Thought approach, allowing exploration over coherent units of text ("thoughts") that serve as intermediate steps toward problem-solving.
</definition>

The ToT framework consists of several key components:

1. Thought decomposition
2. Thought generator
3. State evaluator
4. Search algorithm

3.2 Thought Decomposition

ToT leverages problem properties to design and decompose intermediate thought steps. The granularity of thoughts can vary depending on the task:

<example>
- Crosswords: A thought could be a couple of words
- Game of 24: A thought could be a line of equation
- Creative Writing: A thought could be a whole paragraph of writing plan
</example>

3.3 Thought Generator

The thought generator, denoted as G(pθ, s, k), produces k candidates for the next thought step given a tree state s. Two strategies are considered:

1. Sample: Generate i.i.d. thoughts from a CoT prompt
2. Propose: Sequentially generate thoughts using a "propose prompt"

<quote>
"We perform a breadth-first search (BFS) in ToT, where at each step we keep the best b = 5 candidates."
</quote>

3.4 State Evaluator

The state evaluator, V(pθ, S), assesses the progress of different states towards solving the problem. This serves as a heuristic for the search algorithm. Two strategies are proposed:

1. Value: Independently evaluate each state
2. Vote: Compare different states and vote for the most promising one

<quote>
"We prompt LM to evaluate each thought candidate as "sure/maybe/impossible" with regard to reaching 24. The aim is to promote correct partial solutions that can be verdicted within few lookahead trials, and eliminate impossible partial solutions based on "too big/small" commonsense, and keep the rest "maybe"."
</quote>

3.5 Search Algorithm

The ToT framework allows for the use of different search algorithms depending on the tree structure. The paper explores two search algorithms:

1. Breadth-first search (BFS)
2. Depth-first search (DFS)

<code>
Algorithm 1: ToT-BFS(x, pθ, G, k, V, T, b)
Require: Input x, LM pθ, thought generator G() & size limit k, states evaluator V(), step limit T, breadth limit b.
S0 ← {x}
for t = 1, · · · , T do
    S′t ← {[s, z] | s ∈ St−1, zt ∈ G(pθ, s, k)}
    Vt ← V(pθ, S′t)
    St ← arg maxS⊂S′t,|S|=b Σs∈S Vt(s)
end for
return G(pθ, arg maxs∈ST VT(s), 1)
</code>

4. Experimental Setup

The authors evaluate the Tree of Thoughts framework on three novel tasks that challenge existing LLM inference methods:

1. Game of 24
2. Creative Writing
3. Mini Crosswords

4.1 Game of 24

<task_description>
Game of 24: A mathematical reasoning challenge where the goal is to use 4 numbers and basic arithmetic operations (+-*/) to obtain 24.
</task_description>

Experimental details:
- Data source: 4nums.com
- Test set: 100 relatively hard games (indexed 901-1,000)
- Success metric: Valid equation that equals 24 using input numbers exactly once
- Baselines: IO prompt, CoT prompt, CoT self-consistency, iterative-refine
- ToT setup: 3 thought steps, BFS with b = 5 candidates, 3 value samples per thought

4.2 Creative Writing

<task_description>
Creative Writing: Generate a coherent passage with 4 paragraphs that end in 4 given random sentences.
</task_description>

Experimental details:
- Input: 4 random sentences from randomwordgenerator.com
- Evaluation: GPT-4 zero-shot prompt for 1-10 scalar score, human judgments for pairwise comparisons
- Baselines: IO prompt, CoT prompt, iterative-refine
- ToT setup: Depth 2 (1 intermediate thought step), k = 5 plans/passages, b = 1, 5 votes per step

4.3 Mini Crosswords

<task_description>
Mini Crosswords: Solve 5x5 mini crosswords given horizontal and vertical clues.
</task_description>

Experimental details:
- Data source: GooBix
- Test set: 20 games (indices 1, 6, ..., 91, 96)
- Evaluation: Correct letters, words, and full games
- Baselines: IO prompt, CoT prompt
- ToT setup: Depth-first search (DFS), up to 10 intermediate steps, 5 thought proposals, 7 value aggregations

5. Results and Analysis

5.1 Game of 24

The Tree of Thoughts approach significantly outperforms baseline methods on the Game of 24 task:

<results>
- IO prompt: 7.3% success rate
- CoT prompt: 4.0% success rate
- CoT-SC (k=100): 9.0% success rate
- ToT (b=1): 45% success rate
- ToT (b=5): 74% success rate
</results>

Analysis:
- ToT with b=1 already achieves a 45% success rate, highlighting the importance of deliberate search.
- Increasing the beam size to b=5 further improves performance to 74%.
- Error analysis shows that around 60% of CoT samples fail after generating the first step, emphasizing the limitations of left-to-right decoding.

5.2 Creative Writing

The ToT framework demonstrates improved coherence in the Creative Writing task:

<results>
- IO prompt: 6.19 average GPT-4 score
- CoT prompt: 6.93 average GPT-4 score
- ToT: 7.56 average GPT-4 score
</results>

Human evaluation results:
- ToT preferred over CoT in 41 out of 100 passage pairs
- CoT preferred over ToT in 21 out of 100 passage pairs
- 38 pairs found "similarly coherent"

5.3 Mini Crosswords

The ToT approach shows significant improvements in solving Mini Crosswords:

<results>
- IO prompt: 38.7% letter success, 14% word success, 0% game success
- CoT prompt: 40.6% letter success, 15.6% word success, 1% game success
- ToT: 78% letter success, 60% word success, 20% game success
</results>

Additional findings:
- Using the oracle best DFS state improves performance to 82.4% letter success, 67.5% word success, and 35% game success.
- Ablation studies demonstrate the importance of pruning and backtracking in the search process.

6. Discussion

6.1 Advantages of Tree of Thoughts

The authors highlight several key advantages of the ToT framework:

1. Generality: ToT generalizes over existing methods like IO, CoT, and CoT-SC.
2. Modularity: The base LM, thought decomposition, generation, evaluation, and search procedures can be varied independently.
3. Adaptability: ToT can accommodate different problem properties, LM capabilities, and resource constraints.
4. Convenience: No extra training is needed; a pre-trained LM is sufficient.

6.2 Limitations and Future Directions

The authors acknowledge several limitations and suggest future research directions:

1. Task selection: ToT might not be necessary for tasks that GPT-4 already excels at.
2. Resource requirements: ToT requires more computational resources than standard prompting methods.
3. Fine-tuning potential: Exploring ToT-style high-level counterfactual decision making during LM fine-tuning.

<quote>
"As we begin to deploy LMs for more real-world decision making applications (e.g. coding, data analysis, robotics, etc.), more complex tasks could emerge and present new opportunities to study these research questions."
</quote>

6.3 Broader Impact

The authors discuss potential broader impacts of the ToT framework:

<impact>
Positive:
- Empowers LMs to make more autonomous and intelligent decisions
- Improves interpretability of model decisions
- Provides opportunities for human alignment

Negative:
- Potential for facilitating harmful uses of LMs in future applications involving interaction with external environments or humans
</impact>

7. Conclusion

The Tree of Thoughts framework represents a significant advancement in problem-solving capabilities for large language models. By incorporating deliberate search and planning processes inspired by human cognition, ToT addresses key limitations of current approaches and demonstrates superior performance on challenging tasks.

<conclusion>
"The Tree of Thoughts framework provides a way to translate classical insights about problem-solving into actionable methods for contemporary LMs. At the same time, LMs address a weakness of these classical methods, providing a way to solve complex problems that are not easily formalized, such as creative writing. We see this intersection of LMs with classical approaches to AI as an exciting direction."
</conclusion>

The success of ToT across diverse tasks suggests its potential for broader application in AI systems, paving the way for more sophisticated and capable language models in the future.

8. References and Further Reading

[1] T. Brown, B. Mann, N. Ryder, M. Subbiah, J. D. Kaplan, P. Dhariwal, A. Neelakantan, P. Shyam, G. Sastry, A. Askell, et al. Language models are few-shot learners. Advances in neural information processing systems, 33:1877–1901, 2020.

[2] A. Chowdhery, S. Narang, J. Devlin, M. Bosma, G. Mishra, A. Roberts, P. Barham, H. W. Chung, C. Sutton, S. Gehrmann, et al. Palm: Scaling language modeling with pathways. arXiv preprint arXiv:2204.02311, 2022.

[3] J. Wei, X. Wang, D. Schuurmans, M. Bosma, E. Chi, Q. Le, and D. Zhou. Chain of thought prompting elicits reasoning in large language models. arXiv preprint arXiv:2201.11903, 2022.

[4] X. Wang, J. Wei, D. Schuurmans, Q. Le, E. Chi, and D. Zhou. Self-consistency improves chain of thought reasoning in language models. arXiv preprint arXiv:2203.11171, 2022.

[5] D. Kahneman. Thinking, fast and slow. Macmillan, 2011.

[6] A. Newell, J. C. Shaw, and H. A. Simon. Report on a general problem solving program. In IFIP congress, volume 256, page 64. Pittsburgh, PA, 1959.

[7] D. Silver, J. Schrittwieser, K. Simonyan, I. Antonoglou, A. Huang, A. Guez, T. Hubert, L. Baker, M. Lai, A. Bolton, et al. Mastering the game of go without human knowledge. nature, 550(7676):354–359, 2017.

[8] E. Wallace, N. Tomlin, A. Xu, K. Yang, E. Pathak, M. Ginsberg, and D. Klein. Automated crossword solving. arXiv preprint arXiv:2205.09665, 2022.

[9] S. Yao, J. Zhao, D. Yu, N. Du, I. Shafran, K. Narasimhan, and Y. Cao. ReAct: Synergizing reasoning and acting in language models. arXiv preprint arXiv:2210.03629, 2022.

[10] D. Zhou, N. Schärli, L. Hou, J. Wei, N. Scales, X. Wang, D. Schuurmans, C. Cui, O. Bousquet, Q. Le, et al. Least-to-most prompting enables complex reasoning in large language models. arXiv preprint arXiv:2205.10625, 2022.
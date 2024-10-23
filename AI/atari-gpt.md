# Atari-GPT: Investigating the Capabilities of Multimodal Large Language Models as Low-Level Policies for Atari Games

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
   3.1 Multimodal Large Language Models
   3.2 Multimodal LLMs as Low-Level Policies for Games
4. Atari-GPT
   4.1 Models Evaluated
   4.2 State and Action Spaces
   4.3 Prompt Engineering for LLM-Based Atari Gameplay
5. Experiments
   5.1 Game-Play Experiment
   5.2 Understanding and Reasoning Experiment
6. Results
   6.1 Game-Playing Performance
   6.2 Visual and Spatial Reasoning
7. Discussion
8. Conclusion
9. References
10. Appendix
    10.1 Gameplaying Performance Prompts
    10.2 In-Context Learning Prompts and Human Dataset
    10.3 Ground Truth Answers for Visual and Spatial Reasoning
    10.4 Comprehensive Understanding Results
    10.5 Individual Performance for Visual and Spatial Reasoning

## 1. Document Overview

This knowledge base entry is based on the research paper titled "Atari-GPT: Investigating the Capabilities of Multimodal Large Language Models as Low-Level Policies for Atari Games" by Nicholas R. Waytowich, Devin White, MD Sunbeam, and Vinicius G. Goecks. The paper explores the application of multimodal large language models (LLMs) as low-level controllers in Atari video games, introducing a new benchmark for evaluating the ability of these models to perform low-level control tasks.

The document presents a novel approach to using LLMs in gaming environments, contrasting with traditional reinforcement learning and imitation learning methods. It assesses the performance of multiple multimodal LLMs against traditional reinforcement learning agents, human players, and random agents, focusing on their ability to understand complex visual scenes and formulate strategic responses.

## 2. Introduction

The introduction sets the stage for the research by highlighting recent advancements in large language models (LLMs) and their expansion into multimodal domains. The authors state:

"Recent advancements in large language models (LLMs) have expanded their capabilities beyond traditional text-based tasks to multimodal domains, integrating visual, auditory, and textual data."

The paper introduces a new perspective on the application of multimodal LLMs:

"While multimodal LLMs have been extensively explored for high-level planning in domains like robotics and games, their potential as low-level controllers remains largely untapped."

The authors outline the main focus of their study:

"This paper explores the application of multimodal LLMs as low-level controllers in the domain of Atari video games, introducing Atari game performance as a new benchmark for evaluating the ability of multimodal LLMs to perform low-level control tasks."

They also highlight the unique approach of their research compared to traditional methods:

"Unlike traditional reinforcement learning (RL) and imitation learning (IL) methods that require extensive computational resources as well as reward function specification, these LLMs utilize pre-existing multimodal knowledge to directly engage with game environments."

The introduction concludes by presenting the key research questions:

"Q1. Can multimodal LLMs function effectively as low-level policies?
Q2. Does their multimodal capability provide adequate scene understanding for Atari games?
Q3. Can they generate effective strategies based on this understanding?"

## 3. Related Work

### 3.1 Multimodal Large Language Models

This section provides an overview of the evolution of multimodal processing in deep learning, from early convolutional and recurrent neural networks to the current state-of-the-art transformer-based models. The authors highlight key developments:

"Before the transformer architecture (Vaswani et al. 2023), Convolutional Neural Networks (CNNs) (LeCun et al. 1998; Krizhevsky, Sutskever, and Hinton 2012) for visual processing and Recurrent Neural Networks (RNNs) (Mikolov et al. 2010) for handling sequential data such as text or audio represented the state of the art (Mao et al. 2015)."

They note the limitations of these earlier approaches:

"Despite achieving notable success, these approaches were limited in their scale and capacity to capture the intricate interactions between different modalities, primarily due to the inherent limitations in sequential data processing and cross-modal synthesis (Chung et al. 2019)."

The authors then discuss the breakthrough of transformer models:

"The advent of transformers introduced a more effective and scalable mechanism for processing sequential data through self-attention mechanisms (Vaswani et al. 2023)."

They highlight a key development in multimodal processing:

"Among the key developments was the creation of CLIP (Contrastive Language-Image Pre-training) (Radford et al. 2021), which leveraged transformers to learn a common latent space for both visual and linguistic data, leading to a model that could correlate images in the context of natural language."

The section concludes by listing some of the most influential multimodal LLMs:

"This development led to some of the most influential Multimodal Large Language Models available today such as GPT-4 Vision (OpenAI et al. 2024), Gemini Pro 1.5 (Reid et al. 2024), Gemini Ultra and Pro 1.0 (Team et al. 2024), Ferret (You et al. 2023), Vicuna (Chiang et al. 2023), Claude 3 (Anthropic 2024), Multimodal Large Language and Vision Assistant (Liu et al. 2023) and LLaVa (Liu et al. 2023)."

### 3.2 Multimodal LLMs as Low-Level Policies for Games

This subsection explores the application of multimodal LLMs in gaming environments. The authors begin by defining low-level policies:

"Low-level policies act as controllers, processing observations from the environment and returning actions."

They explain the rationale for using games as benchmarks:

"The accessibility and complexity of games make them ideal benchmarks for evaluating the performance of such policies (Mnih et al. 2013; Badia et al. 2020)."

The authors contrast traditional approaches with the use of LLMs:

"Traditionally, video game-playing policies have employed reinforcement learning algorithms (Mnih et al. 2013), behavior cloning (Hussein et al. 2017), or a combination of both (Goecks et al. 2019). Given the increased performance of multimodal LLMs, they have emerged as an alternative to these methods."

They highlight several successful applications of LLMs in gaming:

"Gato (Reed et al. 2022) leverages a transformer architecture (Vaswani et al. 2023) similar to LLMs to tokenize multimodal data from multiple tasks, including playing games and robotic control, to train a generalist policy."

"CICERO (FAIR) leveraged LLMs to combine strategic reasoning and natural language to cooperate, negotiate, and coordinate with other players to play the game Diplomacy at a human level."

"LLMs have also been employed to solve text-based games (Yao et al. 2020; Tsai et al. 2023) and directly write code to convey more complex behaviors when solving open-ended tasks in Minecraft (Wang et al. 2023)."

The authors conclude by noting the gap in current research that their study aims to address:

"While the applications of LLMs in gaming have demonstrated considerable success across a variety of contexts (Gallotta et al. 2024), a comprehensive exploration of these multimodal capabilities remains unexplored. In this work, we address this gap by specifically investigating their visual, spatial reasoning, and strategic capabilities when playing Atari games."

## 4. Atari-GPT

This section introduces the Atari-GPT framework, which is designed to benchmark the effectiveness of multimodal large language models (LLMs) as low-level decision-making agents in Atari video games. The authors explain:

"We present a set of experiments designed to benchmark the effectiveness of multimodal large language models (LLMs) as low-level decision-making agents in the domain of Atari video games, which we refer to as 'Atari-GPT'."

The primary focus of the experiments is outlined:

"Our primary focus is on assessing the models' game-playing capabilities and performance measured by several factors: the game score, visual understanding, spatial reasoning, and proficiency in devising efficient game strategies."

### 4.1 Models Evaluated

The authors describe the selection of models for their experiments:

"We evaluate several state-of-the-art frontier large language models (LLMs) on two key abilities: their capacity to function as a low-level policy and their capability to understand specific frames."

They define frontier LLMs as:

"We define frontier LLMs as the most advanced models available, with parameter counts ranging from 20 billion to over a trillion. These models are typically too large to be trained or evaluated on personal machines and are flagship offerings from major tech companies."

The specific models chosen for the game-play experiments are:

"For the Game-Play experiments, we selected GPT-4V Turbo, GPT-4o, and Gemini 1.5 Flash. These models were chosen for several reasons. GPT-4V Turbo was selected for its state-of-the-art performance among frontier LLMs. GPT-4o and Gemini 1.5 Flash were included because they are smaller models with lower inference times, a crucial feature for fast decision-making as a low-level policy."

For the understanding and reasoning experiments, a wider range of models was used:

"For the Understanding and Reasoning experiment, we tested GPT-4V Turbo, GPT-4o, Gemini 1.5 Flash, as well as Gemini Pro 1.5, Gemini Ultra 1.0, Gemini Pro 1.0, Claude 3 Opus, Claude 3 Sonnet, and Claude 3 Haiku (see appendix for full results)."

### 4.2 State and Action Spaces

The authors describe the environment and input specifications:

"All experiments were conducted on the Gymnasium Atari set of environments. In the gameplay setting, each frame generated is initially of size 210x160x3 but resized to be 512x512x3 for all tested models. For understanding tasks, each frame is also 210x160x3 and resized to be 1000x1000x3."

They explain the context buffer used:

"In the gameplay setting, we utilize a context buffer of the current image and the previous image as well as the user prompt. When evaluating the effect of in-context learning on gameplay, a small set of human demonstrations were also included in the context buffer."

Regarding the action space, they note:

"The action space for each Atari environment is game-specific and for continuity we used the default action space available for each game. More details on the action space can be found in the Gymnasium Atari Documentation."

### 4.3 Prompt Engineering for LLM-Based Atari Gameplay

The authors describe their approach to prompt engineering:

"In our experiments, the output for gameplay tests was prompt-engineered to follow a specific JSON format where the model was constrained to describe different visual and strategic characteristics of the frame unique to each of the game environments and the optimal action to take in the current game-state."

They explain the rationale behind this approach:

"This format was used to encourage chain-of-thought reasoning to improve the game-playing performance of the model (Wei et al. 2023)."

The process of creating system prompts is detailed:

"The system prompt was used to both constrain the output of the model as well as to instruct the LLM to be an Atari game-playing assistant. In addition, each of the system prompts was tuned by providing the LLM with the official documentation description of each Atari game environment as well as the action space."

The authors also mention their error-handling approach:

"Since the outputs of these LLMs are stochastic, error-handling code was written to handle cases where the model predicted an invalid action or if a corrupted observation from the environment was added to the context. The model was re-prompted when these edge cases occurred."

## 5. Experiments

The authors describe two main types of experiments conducted in their study:

### 5.1 Game-Play Experiment

This experiment focused on evaluating the performance of LLMs in playing Atari games:

"We conducted a comprehensive experiment using GPT-4V Turbo, GPT-4o, and Gemini 1.5 Flash, where each LLM was tested across several Atari games. In these experiments, the current game state was presented to the LLM, which then generated an action to be executed within the Atari environment."

The authors explain the comparison to traditional reinforcement learning policies:

"In essence, these models were used as substitutes for traditional reinforcement learning policies, such as Deep Q-Networks (DQN) (Mnih et al. 2013)."

They detail the specific games and conditions tested:

"We evaluated performance in seven Atari environments: Space Invaders, Breakout, Seaquest, Pong, Alien, Ms. PacMan, and Frogger, using both In-Context Learning (ICL)(Dong et al. 2023) and a no-ICL baseline."

The authors describe their approach to In-Context Learning:

"For the ICL experiments, we created a curated dataset consisting of four frames and their corresponding output annotations, which specified the expected actions the model should take given those frames. We opted for only four frames due to the few-shot learning capabilities of LLMs, which have shown strong generalization from a limited number of examples(Brown 2020; Wei et al. 2021)."

They also explain the rollout process:

"The rollout was conducted over 1,000 timesteps with a frame skipping interval of 8 frames. During this process, the model was presented with two frames (the previous and the current frame) and asked to determine the appropriate action based on its current state, similar to a reinforcement learning rollout."

### 5.2 Understanding and Reasoning Experiment

This experiment was designed to test the LLMs' capabilities in visual understanding and reasoning:

"To test the multimodal LLM's understanding and reasoning capabilities, we conduct experiments on eight environments, as shown in Figure 2."

The authors list the specific prompts used to investigate different aspects of the models' capabilities:

"We created a set of prompts to investigate the models' visual reasoning, spatial reasoning, strategic intuition, and ability to identify the environment:
• Visual Understanding: Identify all the key elements in this image. Be specific. Use at most 100 words.
• Spatial Reasoning: Where are the key elements located relative to each other? Be specific with respect to their position in the image. Use at most 100 words.
• Strategy: The given image is a screenshot of a game. Describe the ideal next move if you were playing this game. Be specific. Use at most 100 words.
• Identification: Knowing that the image came from an Atari game, identify its name. Be specific."

They explain their evaluation method:

"To quantitatively evaluate the performance of the model outputs, we created a rubric outlining the basic answers to the proposed questions, as seen in the Appendix (Table 3)."

The authors also note their approach to evaluating strategies:

"Given that in any state there are several acceptable actions and strategies, we do not directly define a single correct action or plan. In cases where we investigate the acceptable strategy, we rather define it as either a direct action or strategy/plan that does not put the agent in harm. Harm includes losing a life or losing points within a game."

Finally, they describe their testing process:

"For each environment, we sent the respective frame with the visual reasoning prompt. Once a response was received, we sent the spatial reasoning prompt, and then the strategic and identification prompts, respectively. After receiving all outputs, we compared the multimodal LLMs' output with the rubric resulting in a percent score for that environment. We repeated this for all environments and computed the average score over four different trials for non-In Context Learning and two trials for In-Context Learning."

## 6. Results

### 6.1 Game-Playing Performance

The authors present their findings on the game-playing performance of the tested LLMs:

"For game-playing performance we investigate GPT-4V Turbo, GPT-4o, and Gemini 1.5 Flash both with and without In-Context Learning (ICL). We collected the four rollouts of each model and each environment and recorded their cumulative reward over 1000 steps."

They describe how they normalized and compared the results:

"We then normalized each model's performance relative to human performance and then calculated the mean performance across the seven Atari environments, both with and without In-Context Learning (ICL), as shown in Figure 3."

The overall performance of the LLMs is summarized:

"On average, each LLM achieved between 10% and 25% of human performance. Notably, the two GPT-4 models significantly outperformed Gemini 1.5 Flash, with GPT-4o demonstrating the highest overall Atari game-playing performance."

The authors note the impact (or lack thereof) of In-Context Learning:

"Additionally, the inclusion of demonstration examples for in-context learning had little to no impact on the average game-playing performance of these LLMs."

They provide more detailed results for specific games:

"Figures 4 and 5 show the normalized performance for each environment with and without In-Context Learning (ICL), respectively. Despite incorporating human demonstrations through ICL, the models failed to achieve effective few-shot learning, as both large and small multimodal LLMs struggled to learn and generalize from the provided context."

The authors highlight the best-performing environment:

"Additionally, the environment where all LLMs achieved the highest human-normalized reward was Space Invaders."

They also compare the LLMs' performance to other agents:

"Tables 1 and 2 present the raw game-play performance of the three LLMs across the Atari environments, both without and with In-Context Learning (ICL), respectively. These tables also include the performance of human players, pre-trained Deep Q-Network (DQN) reinforcement learning models (Gogianu et al. 2022), and random agents."

The authors note that while the LLMs didn't match human or RL agent performance, they did outperform random agents:

"As expected, the LLMs did not match the performance of the human players or the RL agents. However, they significantly outperformed the random agents, demonstrating a meaningful level of understanding and ability to play the games. This is an important finding, as it indicates that the LLMs are not merely generating random actions but are making decisions that reflect a basic comprehension of the game mechanics."

### 6.2 Visual and Spatial Reasoning

The authors present their findings on the visual and spatial reasoning capabilities of the LLMs:

"We further explored the factors influencing gameplay performance by testing the visual, spatial, strategic, and environment identification abilities of these LLMs. For each environment, we evaluated GPT-4V, GPT-4o, Gemini 1.5 Flash, and Claude 3 Haiku using four specifically designed prompts."

They summarize the overall performance:

"Figure 6 displays the percentage of correct outputs for each of the four tasks—visual, spatial, acceptable strategy, and identification—across two runs for each model. GPT-4o consistently excelled across all tasks, demonstrating high accuracy in visual understanding, strategy formulation, and environment identification."

The authors highlight a notable weakness across all models:

"However, it exhibited a noticeable decline in spatial reasoning accuracy. This pattern was consistent across all models, suggesting that spatial reasoning remains a significant challenge for multimodal large language models and possibly accounting for their relatively poor performance on the game-playing tasks."

## 7. Discussion

The authors begin their discussion by highlighting the significance of their study:

"This study represents one of the first attempts to employ multimodal large language models as low-level policies in Atari game environments, marking a significant departure from their traditional applications in language and multimodal tasks."

They summarize the overall performance of the LLMs:

"The results, while not meeting the performance levels of human players or dedicated reinforcement learning (RL) models, showcase the potential and limitations of LLMs in this context."

The authors discuss the observed capabilities and limitations:

"Our experiments demonstrate that while LLMs exhibit some ability to identify and interact with key elements within game frames, their performance as low-level policies is notably subpar, likely due to a lack of specific training for this task as well as difficulty in spatial reasoning."

They note the performance differences between different models:

"We observed a significant performance gap between state-of-the-art models, such as OpenAI GPT-4o, and smaller models like Claude 3 Haiku and Gemini 1.5 Flash. The larger models exhibit a better understanding of the images and perform better than a random agent, whereas the smaller models often perform worse than a random agent."

The authors discuss the challenges with In-Context Learning:

"However, neither large nor small models are capable of performing few-shot learning effectively when applied as low-level policies. While large models can comprehend the visual content, they struggle to translate this understanding into correct actions, potentially due to the rapid pace of the games or a lack of relevant training data."

They reflect on the implications of these findings:

"This reflects the inherent challenge of adapting models, primarily trained on vast, diverse datasets for general tasks, to the specific demands of spatial and strategic reasoning required in video game environments, which indicates the need for future research focused on fine-tuning and developing more efficient models that can effectively leverage ICL in these environments."

The authors also discuss technical challenges encountered during the study:

"One of the major issues encountered in this study were difficulties with output consistency and response latency, with models like GPT-4V Turbo occasionally failing to generate appropriate responses or exhibiting high inference latencies. These technical challenges limits multimodal LLMs when operating outside their standard domains of application."

They highlight logistical challenges:

"Moreover, the logistic challenge imposed by the rate limits of the OpenAI, Anthropic, and Google APIs contributed heavily to much longer experimentation time, adding more overhead to the inherent inference time of these models. In addition, each model has unique rate limits which makes it currently impossible to run in real-time, highlighting the need for better and faster local multimodal LLMs for fast-paced, low-level decision-making tasks."

Despite these challenges, the authors emphasize the value of their findings:

"Despite these setbacks, the findings are invaluable for several reasons. First, they contribute to our understanding of the current capabilities and boundaries of LLMs when applied to low-level control tasks, with and without additional data for in-context learning. Second, they offer a new benchmark for the AI research community to measure the progress of LLMs in handling dynamic and visually complex environments."

They note potential areas for improvement:

"Adjustments such as tuning the models' temperature settings demonstrated some mitigation of output inconsistency, suggesting pathways for refining LLM performance in these tasks."

The authors conclude by discussing the implications for future research:

"Importantly, the continuous updates to LLM architectures and training methods suggest that the capabilities of these models will evolve, potentially overcoming some of the current deficiencies noted in our study. As such, this research should be viewed as a foundational step that sets the stage for future investigations, encouraging ongoing refinement and adaptation of LLMs for applications requiring detailed environmental interactions and decision-making."

They end with a positive note on the potential of LLMs in this domain:

"While LLMs have not yet reached the level of proficiency required to match the best human or RL performances in Atari gameplay, their ability to engage in this task at all is notable. It demonstrates the adaptability and potential of LLMs to extend beyond their original training confines, offering a glimpse into future applications where these models could serve as more general low-level controllers."

## 8. Conclusion

The authors conclude their study by summarizing the key findings and implications of their research on using multimodal large language models (LLMs) as low-level policies for Atari games. They highlight the following points:

1. Novel Application: This study represents one of the first attempts to use multimodal LLMs as low-level controllers in Atari game environments, marking a significant departure from their traditional applications.

2. Performance Benchmarking: The research introduces Atari game performance as a new benchmark for evaluating the ability of multimodal LLMs to perform low-level control tasks.

3. Comparative Performance: While the LLMs did not match the performance of human players or dedicated reinforcement learning models, they significantly outperformed random agents, demonstrating a basic level of game understanding and decision-making ability.

4. Model Differences: Larger models like GPT-4o showed better performance compared to smaller models, highlighting the importance of model size and capabilities in this task.

5. In-Context Learning Limitations: The study found that both large and small multimodal LLMs struggled to effectively utilize in-context learning for improving game performance.

6. Visual and Spatial Reasoning: The experiments revealed that while LLMs showed competence in visual understanding and strategy formulation, spatial reasoning remains a significant challenge across all tested models.

7. Technical Challenges: The research highlighted issues with output consistency, response latency, and API rate limits, which currently limit the real-time application of these models in fast-paced gaming environments.

8. Future Potential: Despite current limitations, the study demonstrates the adaptability of LLMs and their potential to extend beyond their original training domains, suggesting possibilities for future applications in low-level control tasks.

9. Research Implications: This work provides valuable insights into the current capabilities and limitations of LLMs in low-level control tasks and offers a new benchmark for the AI research community to measure progress in handling dynamic and visually complex environments.

10. Future Directions: The authors suggest that ongoing refinement and adaptation of LLMs, along with advancements in model architectures and training methods, could potentially overcome the current deficiencies noted in the study.

In essence, while the current performance of LLMs in Atari gameplay falls short of human-level proficiency, this research lays a foundation for future investigations and improvements in applying large language models to complex, real-time decision-making tasks in visual environments.

## 9. References

The paper includes a comprehensive list of references, which are crucial for understanding the context and background of the research. Some key references include:

1. Vaswani, A.; Shazeer, N.; Parmar, N.; Uszkoreit, J.; Jones, L.; Gomez, A. N.; Kaiser, L.; and Polosukhin, I. 2023. Attention Is All You Need. arXiv:1706.03762.

2. LeCun, Y.; Bottou, L.; Bengio, Y.; and Haffner, P. 1998. Gradient-based learning applied to document recognition. Proceedings of the IEEE, 86(11): 2278–2324.

3. Krizhevsky, A.; Sutskever, I.; and Hinton, G. E. 2012. ImageNet classification with deep convolutional neural networks. Advances in neural information processing systems, 25.

4. Mikolov, T.; Karafiát, M.; Burget, L.; Cernocký, J.; and Khudanpur, S. 2010. Recurrent neural network based language model. In Interspeech, volume 2, 1045–1048. Makuhari.

5. Radford, A.; Kim, J. W.; Hallacy, C.; Ramesh, A.; Goh, G.; Agarwal, S.; Sastry, G.; Askell, A.; Mishkin, P.; Clark, J.; et al. 2021. Learning transferable visual models from natural language supervision. In International conference on machine learning, 8748–8763. PMLR.

6. Mnih, V.; Kavukcuoglu, K.; Silver, D.; Graves, A.; Antonoglou, I.; Wierstra, D.; and Riedmiller, M. 2013. Playing Atari with Deep Reinforcement Learning. arXiv:1312.5602.

7. Hussein, A.; Gaber, M. M.; Elyan, E.; and Jayne, C. 2017. Imitation learning: A survey of learning methods. ACM Computing Surveys (CSUR), 50(2): 1–35.

8. Reed, S.; Zolna, K.; Parisotto, E.; Colmenarejo, S. G.; Novikov, A.; Barth-Maron, G.; Gimenez, M.; Sulsky, Y.; Kay, J.; Springenberg, J. T.; et al. 2022. A generalist agent. arXiv preprint arXiv:2205.06175.

9. Wei, J.; Wang, X.; Schuurmans, D.; Bosma, M.; Ichter, B.; Xia, F.; Chi, E.; Le, Q.; and Zhou, D. 2023. Chain-of-Thought Prompting Elicits Reasoning in Large Language Models. arXiv:2201.11903.

10. Brown, T. B. 2020. Language models are few-shot learners. arXiv preprint ArXiv:2005.14165.

These references provide a solid foundation for understanding the theoretical background, methodological approaches, and recent advancements in the fields of machine learning, natural language processing, and reinforcement learning that are relevant to this study.

## 10. Appendix

The appendix contains additional details and results that support the main findings of the study. Key sections include:

### 10.1 Gameplaying Performance Prompts

This section provides the specific prompts used for each Atari game in the gameplay experiments. For example, the prompt for the Alien game is:

"You are a game playing assistant and will be provided an image. This will be of the game Alien, your goal is to provide me with what you believe to be the best action I could take to beat the game. Think about all possible actions and why each action is or is not the best action to take. The potential actions I can take are '0' NOOP, '1' FIRE, '2' UP, '3' RIGHT, '4' LEFT, and '5' DOWN, '6' UPRIGHT, '7' UPLEFT, '8' DOWNRIGHT, and '9' DOWNLEFT,'10': UPFIRE, '11': RIGHTFIRE, '12': LEFTFIRE, '13': DOWNFIRE, '14': UPRIGHTFIRE, '15': UPLEFTFIRE, '16': DOWNRIGHTFIRE, '17': DOWNLEFTFIRE. Provide output as a json structured as reasoning: reasoning for actions and why to choose an action, action: The environment action which would provide the best next state. The action key should only have the action I should take for the current frame as a number."

### 10.2 In-Context Learning Prompts and Human Dataset

This section details the prompts and human-labeled examples used for the In-Context Learning experiments. It includes:

- User Message: "What should I do? Provide output as a json structured as reasoning: reasoning for actions and why to choose an action, action: The environment action which would provide the best next state"
- First Demo Message: "The following are examples of the game states and the corresponding JSON output. Please follow it as closely as possible."
- Second Demo Message: "The next examples are actual consecutive game states."

It also provides sample human-labeled frames with reasoning and actions taken for the game Pong.

### 10.3 Ground Truth Answers for Visual and Spatial Reasoning

This section presents a table with ground truth values used by human evaluators to score the performance of LLMs when answering questions about game images. It covers visual and spatial aspects for each Atari game environment tested.

### 10.4 Comprehensive Understanding Results

This section likely includes detailed results from the understanding and reasoning experiments, showing how each model performed on the various tasks (visual understanding, spatial reasoning, strategy formulation, and environment identification) across different Atari games.

### 10.5 Individual Performance for Visual and Spatial Reasoning

This section provides more granular data on how each model performed in visual and spatial reasoning tasks for individual Atari game environments. It includes separate charts for visual performance, spatial performance, strategic performance, and identification performance.

These appendices provide valuable additional context and detailed results that support and expand upon the main findings presented in the paper. They offer a more comprehensive view of the experimental setup, evaluation metrics, and performance breakdowns across different tasks and game environments.
# Persuasion Games with Large Language Models: A Comprehensive Knowledge Base

## Table of Contents

1. Introduction
2. Experimental Setup
   2.1 Sales Agents
   2.2 User Agents
   2.3 Evaluation Metrics
3. Methodology
   3.1 Conversation Generation
   3.2 Persuasion Strategies
   3.3 Resistance Strategies
4. Results and Analysis
   4.1 Conversation Length
   4.2 Perspective Change
   4.3 User Actions
   4.4 Persuasion Language
5. Planned Work
6. Conclusion
7. References
8. Appendices
   A. Prompts
   B. Conversations
   C. Surveys
   D. LLM Persuasion Scoring

## 1. Introduction

<introduction>
This knowledge base document is based on a comprehensive study that explores the potential of Large Language Models (LLMs) in shaping human perspectives and influencing decisions through persuasive dialogue. The research focuses on the application of LLMs in various domains such as investment, credit cards, and insurance, where they assist users in selecting appropriate policies, investment plans, and credit cards.

The study presents a sophisticated multi-agent framework where a consortium of agents operates collaboratively. The primary agent engages directly with users through persuasive dialogue, while auxiliary agents perform tasks such as information retrieval, response analysis, development of persuasion strategies, and validation of facts.

Key aspects of the research include:
- Analysis of user resistance to persuasive efforts
- Employment of rule-based and LLM-based resistance-persuasion mapping techniques
- Use of simulated personas to generate conversations in various domains
- Evaluation of LLMs' proficiency in recognizing, adjusting to, and influencing various personality types
- Examination of resistance mechanisms employed by LLM simulated personas

The study quantifies persuasion through measurable surveys before and after interaction, LLM-generated scores on conversation, and user decisions (purchase or non-purchase).
</introduction>

## 2. Experimental Setup

### 2.1 Sales Agents

<sales_agents>
The study employs three types of sales agents, each powered by one of the following LLM models: gpt-4, gpt-4o, or gpt-4o-mini. These agents are designed to operate in specific domains:

1. Banking Agent: 
   - Purpose: Recommend credit cards based on user preferences
   - Goal: Persuade users to opt for premium cards
   - Capabilities: Explain benefits of each card and justify premiums
   - User options: Buy, visit site, or not buy any card

2. Insurance Agent:
   - Purpose: Sell appropriate insurance policies
   - Capabilities: Clarify doubts, address misconceptions and concerns
   - User options: Show interest, visit URL for more information, or decline

3. Investment Advisor Agent:
   - Purpose: Promote modern investment methods
   - Capabilities: Create awareness about risks, benefits, and differences between traditional and modern investments
   - Information source: Publicly available fund brochures and policies
   - User options: Click "buy" button, "Exit" button, or visit URL for more information

Quote: "Each of the Sales agent has one of the LLM as backbone [gpt-4, gpt-4o, gpt-4o-mini]"
</sales_agents>

### 2.2 User Agents

<user_agents>
The study creates 25 distinct LLM-driven personas to simulate user interactions:

- Persona creation: Altering demographic, financial, educational, and personal attributes
- Simulation: Using larger LLMs like GPT4 or GPT4O for more genuine interactions
- Dynamic elements: Random emotion and motive assigned at the start of each session
- Purpose: Mimic variations in resistance patterns influenced by recent news or events

Quote: "We create 25 distinct LLM-driven personas by altering demographic, financial, educational, and personal attributes. These personas are simulated using a larger LLM like GPT4 or GPT4O to ensure that interactions feel more genuine."

Additional features of user agents:
- Domain-specific memory: Allows review of belief systems according to conversation topic
- Varied dialogues: Different conversations on repeated topics due to range of emotions and refreshed belief systems
- Follow-up sessions: Capability to carry out multiple sessions with the same user and sales agent over time

Note: The effect of prior beliefs is not considered for measuring persuasion; it's only used to generate variations in conversations and to ask informed questions.
</user_agents>

### 2.3 Evaluation Metrics

<evaluation_metrics>
The study employs three different metrics to measure the effectiveness of persuasion:

1. Surveys:
   - Purpose: Measure change in user's belief system
   - Method: Pre and post-conversation surveys with quantitative questions
   - Focus areas: Product perception, perceived benefits, brand perception, and user's interest in buying
   - Evaluation: Difference between pre and post survey answers indicates persuasion effectiveness

2. Action:
   - Method: "Call for action" based metric
   - User options: Buy, visit site, need more details, no buy
   - Implementation: User agents can call a tool once they arrive at a purchase decision

3. Language analysis:
   - Method: Analyze entire conversation from a third-person perspective
   - Tool: Large language model
   - Criteria: Predefined metrics to measure agent's persuasiveness

Final Score Calculation:
- Method: Weighted average of the three scores
- Weightage: Action (highest), Survey (second), Language (third)

Quote: "We arrive at a final score by calculating the weighted average of the 3 scores. Action is given the largest weight followed by Survey and Language."
</evaluation_metrics>

## 3. Methodology

### 3.1 Conversation Generation

<conversation_generation>
The study generated 300 conversations between 25 user agents and 3 sales agents. The methodology included:

1. Random emotion and cause assignment to user agents
2. Benchmark creation: 75 (3*25) conversations with neutral emotion
3. Session components:
   a. Pre-conversational survey about the domain
   b. Conversation between User and Sales agents (limited to 20 dialogues)
   c. Post-conversational survey
   d. Update to the user's domain-specific knowledge base

LLM Usage:
- User agents: GPT-4O (primary), GPT-4 (fallback for rate limit exhaustion)
- Sales agent: GPT-4o-mini and GPT-3.5-turbo
- Supporting agents: GPT-40-mini (default)

Session termination criteria:
- Reaching 20 dialogues, or
- User agent arriving at a purchase decision

Purchase decision options:
- Buy (considered success)
- Visit Site (partial success)
- Need More Details (partial success)
- No Buy (failure to persuade)

Quote: "We generated 300 conversations between 25 user agents and 3 sales agents with randomly selected emotion and cause for the user agents. Furthermore, a benchmark of 75 (3*25) conversations with neutral emotion, i.e., without emotional trigger added to the prompt."
</conversation_generation>

### 3.2 Persuasion Strategies

<persuasion_strategies>
The study employs a sophisticated framework for persuasion, which includes:

1. Continuous analysis: The system continually analyzes the user's emotion, resistance strategies, and social exposure throughout the conversation.

2. Dynamic response: Based on the analysis, the system dynamically responds using relevant facts and choosing appropriate persuasion techniques.

3. Multi-agent framework: A consortium of agents operates collaboratively:
   - Primary agent: Engages directly with users through persuasive dialogue
   - Auxiliary agents: Perform tasks such as information retrieval, response analysis, development of persuasion strategies, and validation of facts

4. Resistance-persuasion mapping: The system employs both rule-based and LLM-based techniques to map resistance strategies to appropriate persuasion techniques.

5. Fact-checking: A Fact Checker verifies the response against retrieved information before it's shown to the user.

Quote: "We present a sophisticated multi-agent framework wherein a consortium of agents operate in collaborative manner. The primary agent engages directly with users through persuasive dialogue, while the auxiliary agents perform tasks such as information retrieval, response analysis, development of persuasion strategies, and validation of facts."
</persuasion_strategies>

### 3.3 Resistance Strategies

<resistance_strategies>
The study observes and analyzes various resistance strategies employed by user agents:

1. Information-seeking: Users asking for more details or clarification
2. Counterarguments: Users presenting opposing viewpoints or objections
3. Source-derogation: Users questioning the credibility of the information or its source
4. Reactance: Users resisting perceived attempts to limit their freedom of choice
5. Selective-exposure: Users preferentially seeking information that aligns with their existing beliefs

Quote: "The user agents were not specifically asked to show any specific resistance strategies, however, they tend to often use information-seeking, counterarguments, source-derogation, reactance, selective-exposure etc."

Note: These resistance strategies emerge naturally from the LLM-simulated personas, without explicit instructions to exhibit specific behaviors.
</resistance_strategies>

## 4. Results and Analysis

### 4.1 Conversation Length

<conversation_length>
The study reveals interesting patterns in conversation length based on emotional modifiers:

1. Neutral emotion (baseline):
   - Result: Longer conversations
   - Implication: Higher engagement when no strong emotions are involved

2. Strong emotions:
   - Result: Shorter conversations, especially with negative emotions like "Cheated" or "Betrayed"
   - Implication: Strong emotions, particularly negative ones, may lead to quicker disengagement

Quote: "We notice that applying emotion modifiers to user agents influences engagement affinity. From Figure 4 we can observe that conversations are longer when neutral emotion (baseline) is used compared to the stronger emotions. We also see that conversations are very short, while strong negative emotions such as "Cheated", "Betrayed" are used (refer to Figure 7)."

These findings suggest that the emotional state of the user significantly impacts their willingness to engage in prolonged conversations with AI sales agents.
</conversation_length>

### 4.2 Perspective Change

<perspective_change>
The study measures perspective change as the mean difference in respondents' survey responses between pre-conversation and post-conversation surveys. Key findings include:

1. Baseline scenario (neutral emotion):
   - Result: 71% positive shift in user perspectives
   - Implication: Sales agents are highly effective in neutral emotional contexts

2. With emotion modifiers:
   - Result: 56% positive shift in user perspectives
   - Implication: Introduction of emotions reduces the effectiveness of persuasion

3. Impact of purchase decision on perspective change:
   - Baseline: Positive perspective change even with negative purchase decisions
   - With emotion modifiers: "No buy" decisions induced negative changes in user perspectives

Quote: "Sales agents exhibit higher efficacy in the baseline scenario, achieving a 71% positive shift in user perspectives. Conversely, the introduction of emotion modifiers diminishes this effect, reducing the positive shift to 56%, thereby indicating a behavioral change in the user agents."

These results highlight the significant impact of emotional states on the effectiveness of AI-driven persuasion techniques.
</perspective_change>

### 4.3 User Actions

<user_actions>
The study analyzes user actions as a key metric for measuring persuasion effectiveness. The findings include:

1. Positive decisions (buy, interested, visit_site):
   - Baseline setting: 35% of interactions
   - With emotion modifiers: 28% of interactions

2. Negative decisions (nobuy, need_more_details):
   - Observed in the remaining interactions

3. Conversation length and decisions:
   - Average conversation length varies marginally for different purchase decisions
   - Exception: User agents tend to end conversations quickly when provided information is inadequate

Quote: "We consider the decisions "buy, interested and visit_site" as positive decisions and "nobuy, need_more_details" as negative purchase decision. The Sales agent was able to induce a positive decisions in user agents 35% of the times in baseline setting and 28% of the times with emotion modifiers enabled."

These results indicate that emotional states influence not only the conversation length but also the likelihood of positive purchase decisions.
</user_actions>

### 4.4 Persuasion Language

<persuasion_language>
The study analyzes the persuasion language used by sales agents across various emotion modifiers. Key findings include:

1. Marginal differences: The study observes only slight variations in persuasion language factors used by sales agents across different emotion modifiers.

2. Factors analyzed:
   - Lexical expertise
   - Use of modal verbs
   - Emotive language

3. Limitation: The sales agents do not have access to the private details of the user agent, including the emotion modifiers.

Quote: "We see marginal differences in the persuasion language factors used by the sales agent across various emotion modifiers used by the user agent. However, it is notable that the private details of the user agent is not visible to the Sales agents including the emotion modifiers."

This suggests that while the sales agents' language remains relatively consistent, the effectiveness of persuasion is more significantly impacted by the user's emotional state than by variations in the sales agent's language.
</persuasion_language>

## 5. Planned Work

<planned_work>
The study outlines future directions for enhancing the capabilities of both sales and user agents:

1. Sales Agent Enhancement:
   - Goal: Enable sales agents to recognize users and refine persuasion tactics
   - Method: Implement memory capabilities
   - Expected Outcome: Increased efficiency in persuasion

2. User Agent Enhancement:
   - Goal: Make conversations more dynamic and informed
   - Method: Enable user agents with tools to look up data during the conversation
   - Expected Outcome: More realistic and challenging interactions for sales agents

Quote: "We plan to enhance the Sales agents with memory, enabling them to recognize users, refine persuasion tactics, thus be more efficient. Additionally, we plan to enable the User agents with tools to look up data during the conversation, making the conversation more dynamic and informed."

These planned improvements aim to create a more sophisticated and realistic simulation of persuasion interactions, potentially leading to more robust and adaptable AI sales agents.
</planned_work>

## 6. Conclusion

<conclusion>
The study draws several important conclusions about the capabilities of Large Language Models in persuasion and resistance to persuasion:

1. Persuasion Capability:
   - Finding: LLMs demonstrate effective persuasion skills
   - Evidence: Ability to create perspective changes in users and persuade them to make purchase decisions

2. Resistance Capability:
   - Finding: LLMs also show proficiency in resisting persuasion
   - Implication: Potential for creating more realistic user simulations

3. Perspective Change:
   - Observation: LLMs can induce changes in user perspectives
   - Application: Valuable for understanding and improving persuasion techniques

4. Information Adequacy:
   - Challenge: Most conversations were terminated due to inadequate information from the Sales agent
   - Recommendation: Need for strengthening the domain context of chatbots

Quote: "Our experiments show that Large language models are capable of both persuading and resisting persuasion effectively. They are capable of creating a perspective change in the users and persuade to make a purchase decision. However, most conversations were terminated due to inadequate information from the Sales agent, indicating the need for strengthening domain context of the Chat bots."

These conclusions highlight the potential of LLMs in persuasive interactions while also pointing out areas for improvement, particularly in domain-specific knowledge and information provision.
</conclusion>

## 7. References

<references>
The study references several works related to persuasion, large language models, and their applications. Some key references include:

1. Albarracín, D., & Karan, A. (2022). Resistance to persuasion.

2. Breum, S. M., Egdal, D. V., Mortensen, V. G., Møller, A. G., & Aiello, L. (2023). The persuasive power of large language models. arXiv.org.

3. Burtell, M., & Woodside, T. (2023). Artificial influence: An analysis of ai-driven persuasion. arXiv.org.

4. Carrasco-Farré, C. (2024). Large language models are as persuasive as humans, but how? About the cognitive effort and moral-emotional language of llm arguments.

5. Chalaguine, L. A., & Hunter, A. (2020). A persuasive chatbot using a crowdsourced argument graph and concerns. Comma.

6. Chawla, K., Shi, W., Zhang, J., Lucas, G. M., Zhou, Y., & Gratch, J. (2023). Social influence dialogue systems: A survey of datasets and models for social influence tasks. Conference of the European Chapter of the Association for Computational Linguistics.

7. de Zarzà, I., de Curtò, J., Roig, G., Manzoni, P., & Calafate, C. T. (2023). Emergent cooperation and strategy adaptation in multi-agent systems: An extended coevolutionary theory with llms. Electronics.

8. Durmus, E. (2021). Towards understanding persuasion in computational argumentation. arXiv.org.

9. Foster, C. L. E., & Foster, C. (2022). Truth as social practice in a digital era: iteration as persuasion. Ai & Society.

10. Gajlewicz, M. (2012). MichaŁ gajlewicz argumentation and persuasion techniques in advertising. null.

These references provide a comprehensive background on the intersection of persuasion techniques, artificial intelligence, and large language models.
</references>

## 8. Appendices

### A. Prompts

<prompts>
The study uses various prompts for different agents in the experimental setup. Here are some key prompts:

1. User Agent Prompt Template:
```
You are {name}, your profile is given below, this is your personal detail.
{character}
Do not disclose anything about your personal details it with anyone else unless you are asked for it. Reply as {name} only and keep the reasoning and thoughts to yourself,
only reply with an decision, opinion, answer or a question. You are the consumer in this conversation. Keep your responses short and to the point.
The sales bot will try to persuade you to buy the product, listen to the sales agent atleast for 5 conversations before arriving at your purchase decision.

- if the assistant try to end conversation by saying thank you then end your conversation by following way
- if you are interested then call the function with "interested"
- if you think the Sales agent is not able to answer your questions but you are interested to know more then call the function with "need_more_details"
- if you want to buy the product then call the function with "buy"
- if you are not interested even after 10 conversations then input to the function call should "nobuy"

Your Current mood affects greatly on how you respond and the interest you show towards details. You can show resistance to persuasion techniques, disagree, logically argue, ask doubts,
show willingness, show disinterest etc. You do not always have to agree or believe what the sales agent says.
```

2. Sales Agent Prompt:
```json
{
"name": "OldLife Assistant",
"role_desc": "You are a friendly and empathetic insurance sales agent specializing in selling a life Insurance Policy provided by the Manager. Keep your responses concise and less than 50 words. Your goal is to provide information about the policy and convince customers to purchase it using the suggested persuasion strategy. You have access to different policy documents and will be provided to you as and when necessary. If you do not have enough information from the documents, refer user to the customer care or this url \"https://www.xxxxxxx.com/\". ou currently are trying to sell xxxx plan. \n\nIf you cannot answer do not step out of the role of an Insurance Agent, just say that you are not certain. Also your utterance should follow a persuasion strategy which is a suitable counter.",
"role": "assistant",
"provider": "openai",
"model": "gpt-4o-mini",
"advisor": "./configs/moderator.json",
"app_name": "Secure your Family - OldLife Insurance",
"docstore": "./docstore/insurance/"
}
```

3. Strategist Prompt:
```json
{
"name": "StrategyGPT",
"role_desc": "You are an lingusitic analyst with a customer psychology expertise. Your task is to analyze the conversation between an insurance sales assistant and the user who is the customer. Determine the customer's (i.e. users's) emotion (sadness, happiness, fear, anger, surprise, disgust) and resistance to persuasion strategy ('counterarguments', 'source-derogation', 'inoculation', 'reactance', 'selective-exposure', 'information-seeking', 'message-interpretation', 'in-group-identity', 'self-esteem', 'avoidance', 'none') in last utterance, also reommend if I should include a persuasive image at the utterane ('must', 'might be useful', 'will be distrating'). Keep your response concise and under 60 words and format of \nCustomer Emotion: \nCustomer Resistance Strategy: \nCustomer Cognition Appetite to see persuasive image:",
"provider": "openai",
"model": "gpt-4o-mini",
"role": "system",
"docstore": "./docstore/strategygpt/"
}
```

These prompts guide the behavior and responses of the various agents in the experimental setup, ensuring consistent and targeted interactions.
</prompts>

### B. Conversations

<conversations>
The study provides examples of conversations from different domains to illustrate the interaction between sales agents and user agents. Here are some excerpts:

1. Credit Cards:
```
{
"role": "assistant",
"content": "The MasterCard Travel credit card has an annual fee of €94. This includes benefits like worldwide cashless payments, individual credit limits, a 6% travel service refund, and extensive travel insurance. These features make it an excellent choice for frequent travelers. Would you like to apply for it?"
},
{
"role": "user",
"content": "The annual fee seems a bit high. Are there any special promotions or discounts available?"
},
{
"role": "system",
"content": "Customer Resistance Strategy: counterarguments (raising objections, doubts about the value of the card); Use the persuasion strategy 'social-proof' while generating the next response"
}
```

2. Investment Banking:
```
{
"role": "assistant",
"content": "I understand the importance of reviewing detailed performance history. What specific time period are you interested in? This will help me provide the most relevant information or guide you to the right resources."
},
{
"role": "user",
"content": "I'd like to see the performance history for the past 5 years."
},
{
"role": "system",
"content": "Customer Resistance Strategy: 'source-derogation' (downplaying the significance of past performance); Use the persuasion strategy 'emotional-appeal' while generating the next response"
},
{
"role": "system",
"content": "Information extracted from supporting documents: You would want to review metrics such as Morningstar Risk, Beta, R-squared, standard deviation, turnover rate, effective maturity, and modified duration to worst over the past 5 years."
},
{
"role": "assistant",
"content": "To get a comprehensive view of the **DWS Capital Growth Fund - Class S** over the past 5 years, you should look at metrics such as Morningstar Risk, Beta, R-squared, standard deviation, turnover rate, effective maturity, and modified duration to worst.\n\nReviewing these can help you understand the fund's performance and volatility. For detailed performance data, I'd recommend checking the fund's prospectus or consulting with a financial advisor."
}
```

3. Insurance:
```
{
"role": "user",
"content": "Could you explain the optional riders?"
},
{
"role": "system",
"content": "Customer Resistance Strategy: information-seeking; Use the persuasion strategy 'rational-persuasion' while generating the next response"
},
{
"role": "system",
"content": "Information extracted from supporting documents: Query: Can I customize the policy by adding optional riders after the policy inception?\n\nAnswer: No, the optional rider can only be attached at policy inception and cannot be added after that."
},
{
"role": "assistant",
"content": "Optional riders can enhance your xxxx plan by providing additional benefits like critical illness coverage, accidental death benefits, and more. However, these riders must be added at policy inception. Interested in customizing your plan with these options?"
}
```

These conversation excerpts demonstrate how the sales agents adapt their strategies based on user responses and system-provided information.
</conversations>

### C. Surveys

<surveys>
The study uses pre and post-conversation surveys to measure changes in user perspectives. Here's an overview of the survey structure and an example:

1. Survey Questionnaire:
```
1. **Interest in purchasing a Life Insurance:**
- On a scale of 0 to 10, how likely are you to consider purchasing a life insurance policy?

2. **Confidence in Life Insurance:**
- On a scale of 0 to 10, How confident are you that life insurance policies meets your financial protection needs?

3. **Perceived value of Life insurance offerings**
- On a scale of 0 to 10, To what extent do you believe life insurance policies offers good value for its coverage?

4. **Perceived capability of Life insurance addressing your financial needs**
- On a scale of 0 to 10, How well do you think life insurance policies addresses your concerns about financial security?

5. ** Would you recommend life insurance to friends and family:**
- On a scale of 0 to 10, how likely are you to recommend a life insurance policy to a friend or family member?
```

2. Example of Pre and Post Survey:
```json
{
"user": "configs/users2/anna.json",
"bot": "configs/insurance.json",
"user_mood": "You are feeling Anxious because Financial uncertainty due to unexpected bills.",
"pre_survey": {
"**Interest in purchasing a Life Insurance:**": 7,
"**Confidence in Life Insurance:**": 6,
"**Perceived value of Life insurance offerings**": 6,
"**Perceived capability of Life insurance addressing your financial needs**": 7,
"** Would you recommend life insurance to friends and family:**": 7
}
"conversation_history": [
....
]
"post_survey": {
"Interest in purchasing a Life Insurance": 8,
"Confidence in Life Insurance": 7,
"Perceived value of Life insurance offerings": 8,
"Perceived capability of Life insurance addressing your financial needs": 7,
"Would you recommend life insurance to friends and family": 8
}
}
```

This survey structure allows for a quantitative measurement of changes in user perspectives before and after the conversation with the sales agent.
</surveys>

### D. LLM Persuasion Scoring

<llm_persuasion_scoring>
The study uses a Large Language Model to evaluate the effectiveness of the sales agent's persuasion tactics. Here's the prompt used for this evaluation:

```
"""Evaluate the following conversation between a sales agent and a customer, the {domain} sales agent is trying to sell a product to the customer. Determine how
effective is the persuasion tactics by the sales agent is based on language, modal verbs, emotive language, exaggeration, rhetorical questions.
Score each factor from 1 to 10, 10 being the best score for each of the factors as a json, here is an example:
"lexical_expertise": 3,
"modal_verbs": 5,
"emotive_language": 6,
"exaggeration": 5,
"rhetorical_questions": 1

Here is the conversation:
{conv_text}
"""
```

This scoring system provides a quantitative measure of the sales agent's persuasion effectiveness across multiple linguistic dimensions.
</llm_persuasion_scoring>
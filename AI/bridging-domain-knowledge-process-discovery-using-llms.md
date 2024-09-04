# Bridging Domain Knowledge and Process Discovery Using Large Language Models: A Comprehensive Knowledge Base

## Table of Contents

1. Introduction
   1.1 Background and Motivation
   1.2 Research Objectives
   1.3 Significance of the Study
2. Theoretical Framework
   2.1 Process Mining and Process Discovery
   2.2 Large Language Models (LLMs)
   2.3 Domain Knowledge in Process Mining
   2.4 Inductive Miner with Rules (IMr)
3. Challenges in Process Discovery
   3.1 Limitations of Traditional Approaches
   3.2 Integration of Domain Knowledge
   3.3 Natural Language Processing in Process Mining
4. The Proposed Framework
   4.1 Overview and Architecture
   4.2 Components and Their Interactions
   4.3 Workflow and Data Flow
5. Methodology
   5.1 Task Definition for LLMs
   5.2 Rule Extraction Process
      5.2.1 Business Context Integration
      5.2.2 Feedback Incorporation
      5.2.3 Interactive Refinement
   5.3 Rule Validation and Error Handling
6. Case Study: UWV Employee Insurance Agency
   6.1 Context and Dataset Description
   6.2 Process Discovery Without Domain Knowledge
      6.2.1 IMf Algorithm Results
      6.2.2 IMr Algorithm Results (Without Rules)
   6.3 Employing ChatGPT to Extract Rules
      6.3.1 Initial Rule Extraction
      6.3.2 Interactive Refinement Process
      6.3.3 Final Set of Extracted Rules
   6.4 Process Discovery with LLM-Generated Rules
7. Results and Discussion
   7.1 Comparative Analysis of Discovered Models
   7.2 Impact of Domain Knowledge Integration
   7.3 LLM Performance in Rule Extraction
   7.4 Limitations and Potential Improvements
8. Conclusion and Future Work
   8.1 Summary of Findings
   8.2 Implications for Process Mining
   8.3 Future Research Directions
9. References
10. Appendices
    10.1 Glossary of Terms
    10.2 Detailed Prompts and LLM Responses
    10.3 Supplementary Figures and Tables

## 1. Introduction

### 1.1 Background and Motivation

Process mining has emerged as a crucial discipline in the realm of business process management, offering data-driven insights into organizational processes. At the heart of process mining lies process discovery, which aims to automatically generate process models from event logs recorded by information systems. However, the complexity of real-world processes and the limitations of purely data-driven approaches have led to a significant challenge: the integration of domain knowledge into automated process discovery.

The authors of the paper "Bridging Domain Knowledge and Process Discovery Using Large Language Models" recognize this challenge and its implications:

> "Discovering good process models is essential for different process analysis tasks such as conformance checking and process improvements. Automated process discovery methods often overlook valuable domain knowledge. This knowledge, including insights from domain experts and detailed process documentation, remains largely untapped during process discovery."

This statement underscores the critical gap between the wealth of domain expertise that exists within organizations and the automated techniques used to discover process models. The motivation for this research stems from the recognition that bridging this gap could significantly enhance the quality and relevance of discovered process models.

### 1.2 Research Objectives

The primary objective of this research is to develop a framework that effectively integrates domain knowledge into the process discovery task. Specifically, the authors aim to:

1. Leverage Large Language Models (LLMs) to interpret and formalize domain knowledge expressed in natural language.
2. Develop a methodology for translating domain expertise into declarative rules that can guide process discovery algorithms.
3. Enhance the Inductive Miner with rules (IMr) algorithm to incorporate these LLM-generated rules.
4. Demonstrate the effectiveness of this approach through a real-world case study.

### 1.3 Significance of the Study

The significance of this research lies in its potential to revolutionize the field of process mining by addressing a long-standing challenge. By successfully integrating domain knowledge into automated process discovery, this study offers several key benefits:

1. Improved accuracy and relevance of discovered process models
2. Enhanced alignment between process models and organizational knowledge
3. Increased trust and adoption of process mining techniques in business environments
4. A novel application of Large Language Models in the domain of process mining

The authors emphasize the broader impact of their work:

> "By integrating LLMs, we create a bridge between process knowledge expressed in natural language and the discovery of robust process models, advancing process discovery methodologies significantly."

This advancement has the potential to influence not only academic research in process mining but also practical applications across various industries, leading to more effective process analysis, optimization, and decision-making.

## 2. Theoretical Framework

### 2.1 Process Mining and Process Discovery

Process mining is an interdisciplinary field that combines data science and process management to extract knowledge from event logs. It encompasses three main areas: process discovery, conformance checking, and process enhancement. Among these, process discovery is particularly crucial as it forms the foundation for other process mining activities.

Process discovery algorithms aim to automatically construct a process model that accurately represents the behavior recorded in an event log. These algorithms analyze sequences of events, identify patterns, and generate a formal representation of the process, typically in the form of a process model (e.g., Petri nets, BPMN diagrams, or process trees).

The authors highlight the complexity of this task:

> "Despite the development of numerous methodologies for process discovery, the task remains inherently complex and challenging."

This complexity arises from several factors:
1. Noise and incompleteness in event logs
2. The presence of infrequent or exceptional behavior
3. The need to balance between fitness, precision, generalization, and simplicity in the discovered models
4. The challenge of capturing the true underlying process logic from observed behavior

### 2.2 Large Language Models (LLMs)

Large Language Models represent a significant advancement in natural language processing and artificial intelligence. These models, such as GPT (Generative Pre-trained Transformer) series, BERT, and their variants, are trained on vast amounts of text data and can perform a wide range of language-related tasks.

Key characteristics of LLMs include:
1. Ability to understand and generate human-like text
2. Contextual understanding of language
3. Transfer learning capabilities, allowing them to adapt to specific domains
4. Potential for few-shot and zero-shot learning

In the context of this research, LLMs play a crucial role in bridging the gap between natural language expressions of domain knowledge and formal representations that can be used in process discovery algorithms. The authors leverage the capabilities of LLMs, particularly ChatGPT, to interpret complex process descriptions and generate declarative rules.

### 2.3 Domain Knowledge in Process Mining

Domain knowledge refers to the expertise, insights, and understanding that professionals have about their specific business processes. This knowledge is often tacit, meaning it's not easily codified or transferred. In the context of process mining, domain knowledge can include:

1. Understanding of process goals and constraints
2. Awareness of business rules and regulations
3. Insights into process variations and exceptions
4. Knowledge of the organizational context and culture

The integration of domain knowledge into process mining has been recognized as a critical factor for improving the quality and relevance of discovered process models. However, as the authors point out:

> "This knowledge, including insights from domain experts and detailed process documentation, remains largely untapped during process discovery."

The challenge lies in formalizing this knowledge in a way that can be directly used by process discovery algorithms.

### 2.4 Inductive Miner with Rules (IMr)

The Inductive Miner with rules (IMr) is an extension of the Inductive Miner algorithm, which is widely used in process discovery due to its ability to guarantee sound process models. The IMr framework allows for the incorporation of rules to guide the discovery process.

Key features of IMr include:
1. Recursive divide-and-conquer approach to process discovery
2. Ability to handle noise and infrequent behavior
3. Incorporation of declarative rules to constrain the search space

The authors build upon this framework:

> "Our framework builds upon the IMr framework proposed in [12]. IMr is an inductive mining-based framework that recursively selects the process structure that best explains the actual process."

By extending IMr to work with LLM-generated rules, the researchers create a powerful synergy between data-driven discovery and knowledge-driven guidance.

## 3. Challenges in Process Discovery

### 3.1 Limitations of Traditional Approaches

Traditional process discovery approaches face several limitations that can impact the quality and usefulness of the discovered models:

1. Over-fitting or under-fitting: Models may either be too specific, capturing noise in the data, or too general, missing important process details.
2. Inability to capture complex control-flow patterns: Some algorithms struggle with advanced constructs like non-free-choice, OR-joins, or long-term dependencies.
3. Scalability issues: As the size and complexity of event logs increase, many algorithms face performance challenges.
4. Lack of semantic understanding: Pure data-driven approaches may miss the underlying business logic or intent behind observed behavior.

The authors implicitly acknowledge these limitations by proposing a framework that goes beyond traditional data-centric methods.

### 3.2 Integration of Domain Knowledge

The integration of domain knowledge into process discovery presents its own set of challenges:

1. Formalization of expert knowledge: Translating human expertise into a format that algorithms can use is non-trivial.
2. Subjectivity and bias: Expert knowledge may be influenced by individual perspectives or incomplete understanding.
3. Consistency and completeness: Ensuring that all relevant domain knowledge is captured and consistently applied is challenging.
4. Balancing data and knowledge: Finding the right equilibrium between observed behavior in logs and expert insights can be difficult.

The authors highlight this challenge:

> "Incorporating domain knowledge into the discovery of process models poses several challenges. For instance, domain experts usually have a thorough understanding of their processes, but they can only explain them in natural language."

### 3.3 Natural Language Processing in Process Mining

The use of natural language processing (NLP) in process mining, while promising, comes with its own set of challenges:

1. Ambiguity in natural language: Business process descriptions can be vague or open to interpretation.
2. Domain-specific terminology: Each organization or industry may have its own jargon that needs to be correctly interpreted.
3. Contextual understanding: NLP models need to grasp the broader context in which process descriptions are provided.
4. Mapping between natural language and formal process constructs: Translating linguistic expressions into process model elements or rules is complex.

The authors' approach of using LLMs aims to address these challenges:

> "Our framework leverages LLMs and prompt engineering to integrate domain knowledge into process discovery. Starting with an event log, it employs process knowledge in various forms. LLMs play a crucial role by translating textual inputs into declarative rules, which IMr then integrates."

By employing advanced LLMs, the researchers seek to overcome the limitations of traditional NLP approaches in the context of process mining.

## 4. The Proposed Framework

### 4.1 Overview and Architecture

The proposed framework represents a novel approach to integrating domain knowledge into process discovery through the use of Large Language Models. The architecture of this framework is designed to create a seamless flow from natural language process descriptions to formal process models, with LLMs serving as the crucial bridge.

The authors provide an overview of their framework:

> "Figure 1 illustrates an overview of our proposed framework. The core idea is to utilize domain knowledge to generate a set of rules R which serves as input for the IMr framework."

This framework consists of several key components that work together to achieve the goal of knowledge-enhanced process discovery:

1. Event Log Processor: Handles the input event log data
2. Domain Knowledge Interface: Captures expert knowledge in natural language
3. Large Language Model (LLM): Interprets domain knowledge and generates rules
4. Rule Validator: Ensures the correctness and consistency of generated rules
5. IMr Algorithm: Incorporates validated rules into the process discovery task
6. Process Model Generator: Produces the final process model

The architecture is designed to be flexible and iterative, allowing for continuous refinement of the discovered process model based on expert feedback and additional domain insights.

### 4.2 Components and Their Interactions

Each component of the framework plays a specific role and interacts with others to create a cohesive system:

1. Event Log Processor:
   - Inputs: Raw event log data
   - Function: Preprocesses and structures the event data for analysis
   - Output: Formatted event log ready for process discovery

2. Domain Knowledge Interface:
   - Inputs: Natural language descriptions, expert feedback, process documentation
   - Function: Captures and organizes domain knowledge
   - Output: Structured textual information for LLM processing

3. Large Language Model (LLM):
   - Inputs: Structured domain knowledge, prompts for rule generation
   - Function: Interprets domain knowledge and generates declarative rules
   - Output: Set of declarative rules in a predefined format

4. Rule Validator:
   - Inputs: LLM-generated rules
   - Function: Checks syntax, semantics, and consistency of rules
   - Output: Validated set of rules or error reports for refinement

5. IMr Algorithm:
   - Inputs: Preprocessed event log, validated rules
   - Function: Discovers process model considering both data and rules
   - Output: Process model structure

6. Process Model Generator:
   - Inputs: Process model structure from IMr
   - Function: Renders the final process model in desired notation (e.g., BPMN)
   - Output: Visual and/or formal representation of the discovered process model

The interactions between these components are designed to be iterative and feedback-driven. For example, if the Rule Validator detects issues, it can prompt the LLM for refinements. Similarly, the discovered process model can be presented back to domain experts through the Domain Knowledge Interface for further feedback and improvement.

### 4.3 Workflow and Data Flow

The workflow of the framework follows a logical progression from raw data and knowledge to a refined process model:

1. Initial Setup:
   - Event log is processed and prepared for analysis
   - Domain experts provide initial process descriptions and knowledge

2. Rule Generation:
   - LLM interprets domain knowledge
   - Generates an initial set of declarative rules

3. Rule Validation:
   - Generated rules are checked for correctness and consistency
   - Any issues are flagged for refinement

4. Process Discovery:
   - IMr algorithm uses the validated rules and event log
   - Discovers a process model that aligns with both data and domain knowledge

5. Model Evaluation:
   - Discovered model is presented to domain experts
   - Experts provide feedback on the model's accuracy and completeness

6. Iterative Refinement:
   - Based on expert feedback, the cycle can repeat
   - LLM generates new or modified rules
   - Process discovery is performed with updated rules

The data flow within this workflow is designed to ensure that both event data and domain knowledge are effectively utilized throughout the process discovery task. The LLM serves as a key component in translating between the natural language domain of experts and the formal rule language required by the IMr algorithm.

This comprehensive framework addresses the challenges outlined earlier by providing a structured approach to incorporating domain knowledge into process discovery, leveraging the power of LLMs to bridge the gap between human expertise and algorithmic analysis.

## 5. Methodology

### 5.1 Task Definition for LLMs

The effective use of Large Language Models (LLMs) in this framework requires careful task definition to ensure that the LLM can accurately interpret domain knowledge and generate useful declarative rules. The authors describe their approach to task definition:

> "As outlined in [9], role promoting, knowledge injection, few-shot learning, and negative prompting techniques have significant potential to effectively prepare LLMs for specific process mining tasks."

This approach involves several key elements:

1. Role Promotion:
   - The LLM is assigned a specific role, such as "process mining expert" or "rule generator"
   - This helps frame the context and expectations for the LLM's outputs

2. Knowledge Injection:
   - Relevant process mining concepts and terminology are provided to the LLM
   - This ensures that the LLM has the necessary background knowledge to understand the task

3. Few-Shot Learning:
   - Examples of process descriptions and corresponding declarative rules are provided
   - This helps the LLM understand the expected input-output relationship

4. Negative Prompting:
   - Examples of incorrect or undesirable outputs are given
   - This helps the LLM avoid common pitfalls or misinterpretations

The authors further elaborate on their prompt engineering approach:

> "In our initial prompt, we define the role of the LLM as an interface between the domain expert and process discovery framework, such that LLM should encode the domain knowledge to declarative constraints as we need in IMr."

They also address the challenge of adhering to specific rule formats:

> "Despite the similarity of declarative templates to human logic and reasoning, we observed the difficulties of LLMs in adhering to strict expectations. Therefore, we explain in our prompt the set of constraints we support, detailing both the syntax and the semantics of these constraints (cf. Table 1)."

This detailed task definition ensures that the LLM is well-prepared to handle the complex task of translating domain knowledge into formal declarative rules.

### 5.2 Rule Extraction Process

The rule extraction process is a critical component of the framework, involving the translation of domain knowledge into formal declarative rules that can guide the process discovery algorithm. This process is divided into three main stages:

#### 5.2.1 Business Context Integration

In this stage, domain experts provide general information about the business process. The authors describe this step:

> "The domain expert can introduce the actual business process to the LLM, providing a general overview, detailing the relationships between specific activities, or even including constraints written in natural language."

This flexibility allows experts to share their knowledge in a natural and comfortable manner. The LLM then interprets this information, identifying key process elements and relationships.

To ensure accuracy, the authors note:

> "The list of activities can be automatically derived from the event log, ensuring that all relevant actions are accurately captured in the generated constraints."

This step helps align the domain expert's description with the actual activities recorded in the event log.

#### 5.2.2 Feedback Incorporation

After an initial process model is discovered, it is presented to domain experts for review. The authors explain:

> "The domain expert is expected to examine the process model for accuracy, completeness, and practical alignment with real-life scenarios. In case of finding errors in the represented model, the domain expert can provide a written feedback and explain the behaviors that do not make sense in the real process."

This feedback is then fed back into the LLM, which adjusts and refines the declarative constraints based on the expert's insights. This iterative process allows for continuous improvement of the discovered process model.

#### 5.2.3 Interactive Refinement

The authors recognize the importance of addressing uncertainties and ambiguities in the process description. They introduce an interactive refinement stage:

> "We facilitate a more detailed understanding of the provided textual descriptions by encouraging the LLM to express uncertainty and address it by asking questions. This stage involves a dynamic dialogue between the LLM and the domain expert."

This approach allows the LLM to seek clarification on specific aspects of the process, leading to more accurate and comprehensive rule generation. The authors emphasize the importance of this interaction:

> "The quality and precision of the responses provided by domain experts play a significant role in enhancing the quality of the generated constraints."

### 5.3 Rule Validation and Error Handling

Once rules are extracted by the LLM, they undergo a validation process to ensure their correctness and compatibility with the process discovery algorithm. The authors describe this step:

> "An essential step in the framework is checking the extracted declarative constraints from the LLM's response. The LLM is instructed to encapsulate the constraints within specific tags in the response and to write them in a predefined language with no additional text or descriptions."

The validation process includes several checks:

1. Syntax Validation: Ensuring that each constraint follows the predefined format
2. Semantic Validation: Checking that the constraints make logical sense in the context of process discovery
3. Activity Label Verification: Confirming that all activity labels in the constraints match those in the event log

If any errors are detected during validation, an error-handling loop is initiated:

> "If any errors are detected during validation, an error-handling loop is initiated. A new prompt specifies the problem and its location, prompting the LLM to adjust its output."

This error-handling mechanism ensures that only valid and relevant rules are passed to the IMr algorithm, maintaining the integrity of the process discovery task.

The methodology described in this section demonstrates a comprehensive approach to leveraging LLMs for the extraction of declarative rules from domain knowledge. By combining careful task definition, multi-stage rule extraction, and rigorous validation, the framework aims to produce high-quality rules that effectively guide the process discovery algorithm.

## 6. Case Study: UWV Employee Insurance Agency

### 6.1 Context and Dataset Description

To demonstrate the effectiveness of their proposed framework, the authors conducted a case study with the UWV employee insurance agency in the Netherlands. They provide context for this study:

> "UWV is responsible for managing unemployment and disability benefits in the Netherlands. For this case study, one of UWV's claim-handling processes is selected."

The dataset used for this case study is substantial, providing a realistic test for the framework:

> "The event log used in this study contains 144,046 cases, 16 unique activities, and 1,309,719 events."

This large-scale, real-world dataset offers a challenging and representative scenario for evaluating the performance of the proposed approach.

### 6.2 Process Discovery Without Domain Knowledge

To establish a baseline and highlight the challenges of traditional process discovery methods, the authors first attempted to discover process models without incorporating domain knowledge.

#### 6.2.1 IMf Algorithm Results

The authors describe their initial attempt using the Inductive Miner with frequency threshold (IMf):

> "Our initial attempt to discover a process model using the IMf algorithm with f = 0.2 resulted in the model shown in Fig. 5a. When compared to the normative model, significant differences are observed, e.g., Receive Claim and Start Claim are the first mandatory steps but the process model allows for skipping them or for many other activities occurring before them."

This result demonstrates the limitations of purely data-driven approaches, which can produce models that deviate significantly from the actual business process.

#### 6.2.2 IMr Algorithm Results (Without Rules)

The authors then applied the IMr algorithm without any input rules:

> "Fig. 5b illustrates the process model discovered using the IMr algorithm with sup = 0.2 and an empty set of input rules. Although this model shows more structural similarities to the normative model, it still contains some nonsensical differences."

They highlight specific issues with this model:

> "For instance, Block Claim 1 should only be relevant if the claim is planned to be accepted, but this model permits it for rejected cases as well. Similarly, Receive Objection 2 should only occur if the claim is rejected, yet the model allows it for accepted cases as well."

These results underscore the need for incorporating domain knowledge to produce more accurate and meaningful process models.

### 6.3 Employing ChatGPT to Extract Rules

The core of the case study involves using ChatGPT, a large language model, to extract declarative rules from domain knowledge.

#### 6.3.1 Initial Rule Extraction

The authors began by providing ChatGPT with a process description and activity labels. They note:

> "The process knowledge for this case study is incorporated as a set of activity labels and a process description provided by a domain expert."

This initial input allowed ChatGPT to generate an initial set of declarative rules based on its understanding of the process description.

#### 6.3.2 Interactive Refinement Process

To improve the quality of the extracted rules, the authors implemented an interactive refinement process. They describe this approach:

> "Following this process description, we encouraged ChatGPT to ask clarifying questions whenever it encountered uncertainties about the declarative rules."

Example questions posed by ChatGPT include:

> "Q1: Can 'Block Claim 1,' 'Block Claim 2,' and 'Block Claim 3' occur in the same process instance, or are they mutually exclusive?"

> "Q2: Are the corresponding unblocking activities ('Unblock Claim 1,' 'Unblock Claim 2,' and 'Unblock Claim 3') strictly linked to their respective blocking activities, or can there be other sequences?"

These questions demonstrate the LLM's ability to identify potential ambiguities and seek clarification, leading to more precise rule generation.

#### 6.3.3 Final Set of Extracted Rules

After the interactive refinement process, ChatGPT produced a set of declarative rules. The authors provide examples of these rules:

> "not-co-existence(Block Claim 2, Block Claim 1), not-co-existence(Block Claim 2, Block Claim 3), co-existence(Block Claim 1, Unblock Claim 1), co-existence(Block Claim 2, Unblock Claim 2), co-existence(Block Claim 3, Unblock Claim 3), precedence(Block Claim 1, Unblock Claim 1), precedence(Block Claim 2, Unblock Claim 2), precedence(Block Claim 3, Unblock Claim 3), not-co-existence(Receive Objection 1, Receive Objection 2), precedence(Reject Claim, Receive Objection 2), precedence(Payment Order, Receive Objection 1), ..."

These rules capture complex relationships between activities, reflecting the domain knowledge provided by experts.

### 6.4 Process Discovery with LLM-Generated Rules

The authors then used the rules extracted by ChatGPT as input for the IMr algorithm. They describe the result:

> "These rules are used as input for the IMr framework in addition to the event log, and the process model represented in Fig. 5c is discovered."

They highlight specific improvements achieved by incorporating these rules:

> "For example, the answer to the first question (A1) led to the extraction of not-co-existence(Block Claim 2, Block Claim 1) and not-co-existence(Block Claim 2, Block Claim 3), correctly illustrating the relationship between these activities. These rules help IMr avoid the incorrect positioning of Block Claim 1 observed in Fig. 5b."

The case study demonstrates the potential of using LLMs to bridge the gap between domain knowledge and process discovery, resulting in more accurate and meaningful process models.

## 7. Results and Discussion

### 7.1 Comparative Analysis of Discovered Models

The authors conduct a thorough comparative analysis of the process models discovered using different approaches:

1. IMf algorithm without domain knowledge (Fig. 5a)
2. IMr algorithm without rules (Fig. 5b)
3. IMr algorithm with initial LLM-generated rules (Fig. 5c)
4. IMr algorithm with refined LLM-generated rules (Fig. 5d)

They observe significant improvements in the models discovered using LLM-generated rules:

> "While this model differs from the normative model in Fig. 4, it better represents the actual process compared to the models in Fig. 5a and Fig. 5b, which were discovered without considering process knowledge."

Specific improvements noted include:

1. Correct positioning of activities based on domain rules
2. Prevention of incorrect loops and sequences
3. Better alignment with expert feedback and process constraints

For example, they highlight:

> "The constraint at-most(Receive Objection 1) prevents Receive Objection 1 from being included in a loop, and precedence(Execute Payment, Receive Objection 1) ensures it is positioned after Execute Payment."

These improvements demonstrate the value of incorporating domain knowledge through LLM-generated rules.

### 7.2 Impact of Domain Knowledge Integration

The case study clearly illustrates the positive impact of integrating domain knowledge into the process discovery task. The authors emphasize:

> "Through a comprehensive case study, we demonstrated the effectiveness of our framework in generating process models that better align with process knowledge."

Key benefits observed include:

1. Enhanced accuracy of discovered models
2. Improved alignment with business reality
3. Reduction in nonsensical or impossible process flows
4. Ability to capture complex business rules and constraints

The integration of domain knowledge helps bridge the gap between data-driven discovery and expert understanding of the process, resulting in more meaningful and actionable process models.

### 7.3 LLM Performance in Rule Extraction

The authors provide insights into the performance of Large Language Models, particularly ChatGPT, in extracting declarative rules from domain knowledge:

> "ChatGPT-4o provided the best constraints and demonstrated a superior understanding of the task."

They highlight the LLM's ability to:

1. Interpret complex process descriptions
2. Generate relevant declarative rules
3. Ask clarifying questions to resolve ambiguities
4. Refine rules based on additional input

However, they also note areas for improvement:

> "While the extracted set of declarative constraints from LLMs shows great promise, there is still room for improvement in precision and completeness."

This observation suggests that while LLMs are highly effective in this task, there is potential for further refinement and enhancement of their capabilities.

### 7.4 Limitations and Potential Improvements

The authors acknowledge several limitations of their current approach and suggest potential improvements:

1. Limited range of declarative templates:
   > "Future work focuses on expanding the range of declarative templates within the IMr framework"

2. Need for more comprehensive rule specification:
   > "developing additional rule specification patterns"

3. Enhancing LLM task understanding:
   > "Providing more detailed examples in task definition steps helps LLMs capture a broader context, further enhancing the quality of the extracted constraints."

4. Balancing automation and expert input:
   The framework still requires significant expert involvement, and finding the right balance between automation and human expertise remains a challenge.

5. Scalability and performance:
   The paper does not extensively discuss the computational requirements and scalability of the approach, which could be important for very large or complex processes.

These limitations provide direction for future research and development in this area, highlighting the ongoing challenges in bridging domain knowledge and process discovery.

## 8. Conclusion and Future Work

### 8.1 Summary of Findings

The research presented in this paper demonstrates a novel and effective approach to integrating domain knowledge into process discovery using Large Language Models. The authors summarize their key findings:

> "Our framework leverages LLMs to integrate such knowledge directly into process discovery. We use rules derived from LLMs to guide model construction, ensuring alignment with both domain knowledge and actual process executions."

The case study with the UWV employee insurance agency provides strong evidence for the effectiveness of this approach, showing significant improvements in the quality and relevance of discovered process models when compared to traditional methods.

Key achievements of the research include:

1. Successful translation of natural language process descriptions into formal declarative rules
2. Effective integration of LLM-generated rules into the IMr process discovery framework
3. Demonstration of improved process model accuracy and alignment with domain knowledge
4. Development of an interactive approach for refining and improving extracted rules

### 8.2 Implications for Process Mining

The findings of this research have several important implications for the field of process mining:

1. Enhanced Process Discovery: The integration of domain knowledge through LLMs can lead to more accurate and meaningful process models, addressing a long-standing challenge in the field.

2. Bridge Between Experts and Algorithms: The framework provides a novel way to incorporate expert knowledge into automated process discovery, potentially increasing trust and adoption of process mining techniques.

3. Improved Interpretability: By aligning discovered models more closely with domain understanding, the approach may enhance the interpretability and usability of process mining results.

4. New Applications of LLMs: The research demonstrates a novel application of Large Language Models in the domain of process mining, opening up new avenues for AI-assisted process analysis.

5. Iterative Model Refinement: The interactive nature of the framework allows for continuous improvement of process models based on expert feedback, potentially leading to more dynamic and adaptive process mining practices.

### 8.3 Future Research Directions

The authors outline several promising directions for future research:

1. Expanding Declarative Templates:
   > "Future work focuses on expanding the range of declarative templates within the IMr framework"
   This could involve developing new types of constraints that capture more complex process behaviors.

2. Enhancing Rule Specification:
   > "developing additional rule specification patterns"
   Research into more sophisticated rule languages or patterns could allow for more nuanced expression of domain knowledge.

3. Improving LLM Performance:
   > "Providing more detailed examples in task definition steps helps LLMs capture a broader context, further enhancing the quality of the extracted constraints."
   Further research into prompt engineering and fine-tuning of LLMs for process mining tasks could yield significant improvements.

4. Automated Feedback Loop:
   Developing methods for automatically evaluating the quality of discovered models and feeding this information back into the rule generation process could enhance the framework's effectiveness.

5. Cross-Domain Applicability:
   Investigating the applicability of this approach across different industries and process types could help establish its generalizability and identify domain-specific challenges.

6. Integration with Other Process Mining Techniques:
   Exploring how this framework can be combined with other process mining techniques, such as conformance checking or process enhancement, could lead to more comprehensive process analysis solutions.

7. Ethical and Privacy Considerations:
   As the use of LLMs in process mining increases, research into the ethical implications and privacy considerations of using these models with potentially sensitive business process data will be crucial.

In conclusion, this research represents a significant step forward in bridging the gap between domain knowledge and automated process discovery. By leveraging the power of Large Language Models, the authors have demonstrated a promising approach to enhancing the accuracy and relevance of discovered process models. The findings open up numerous avenues for future research and have the potential to significantly impact both the theory and practice of process mining.
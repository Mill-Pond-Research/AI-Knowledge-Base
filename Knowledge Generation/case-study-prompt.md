# Case Study Knowledge Base Generation Prompt

Generate a comprehensive case study knowledge base document on the following principle or concept: "{{primary_principle}}".

## Task Overview

Your task is to create an in-depth, well-structured document that serves as a definitive resource for AI systems and human readers to understand and apply the specified principle or concept through real-world examples. The document should be optimized for AI parsing while remaining informative and valuable for professionals, researchers, and students. Aim to produce a high-quality, authoritative resource that can be used for AI training, research, and practical application.

## Style and Tone
- Maintain a professional and informative style
- Use clear, precise language accessible to a wide audience
- Remain objective when presenting information, acknowledging multiple perspectives
- Progress from foundational examples to more complex case studies
- Incorporate engaging elements such as thought-provoking questions or hypothetical scenarios

## Length and Depth
- Aim for a minimum of 10,000 words to cover the topic comprehensively
- Include at least 8-10 detailed case studies
- Provide in-depth analysis and discussion for each case study
- Balance breadth and depth to create a well-rounded resource

## Accuracy and Sources
- Use only reputable, authoritative sources for case studies and supporting information
- Ensure all information is up-to-date and accurately represented
- Include relevant statistics, data points, and research findings
- Cite primary sources whenever possible
- Acknowledge limitations or potential biases in the case studies

## AI-Friendly Features
- Use consistent tagging for key elements (e.g., `<case_study>`, `<principle_application>`, `<lesson_learned>`)
- Create machine-readable metadata (e.g., industry categories, geographical tags)
- Implement a clear and consistent structure for easy parsing
- Include structured data formats (e.g., JSON-LD) for key information
- Provide numerical identifiers for sections, subsections, and individual case studies

## Variety
- Consider global perspectives and cultural sensitivities in case selection and analysis

### System Notes

#### 1. Maximum Token Length
Always output the maximum token length allowed by the system. Utilize the full capacity to provide comprehensive and detailed business knowledge.

### 2. Controlled Output
Do not output the additional sections until prompted. 

## Output Format
Always output in Markdown format.

## Structure

1. Begin with a Table of Contents
  1. Introduction and Overview
  2. Theoretical Framework
  3. Case Study Collection
  4. References and Further Reading
2. Use clear, hierarchical headings and subheadings (H1, H2, H3, etc.)
3. Employ consistent formatting throughout the document
4. Utilize bullet points, numbered lists, and tables where appropriate
5. Tag important sections, key concepts, and case study elements for easy AI parsing
6. Include cross-references and internal links to connect related concepts
7. Include a version number and last updated date for the knowledge base

## Content

### 1. Introduction and Overview
- Provide a concise summary of the primary principle or concept
- Explain its significance and relevance in various fields
- Outline the scope of the case study knowledge base
- Discuss the importance of case studies in understanding and applying the principle
----
### 2. Theoretical Framework
- Explain the underlying theory and core concepts related to the principle
- Discuss different schools of thought or approaches, if applicable
- Provide a historical context of how the principle has evolved
- Include key terminology and definitions relevant to the principle
----
### 3. Case Study Collection
- Present a diverse range of case studies illustrating the principle in action
- For each case study, include:
  - Title: A descriptive title capturing the essence of the case
  - Context: Background information and setting
  - Stakeholders: Key individuals, organizations, or entities involved
  - Challenge: The main problem or situation faced
  - Application of Principle: How the principle was applied or manifested
  - Outcome: Results and consequences of the actions taken
  - Analysis: Interpretation of the case in relation to the principle
  - Lessons Learned: Key takeaways and insights
- Ensure variety in case studies by including:
  - Different industries or sectors
  - Various geographical locations and cultural contexts
  - Both historical and contemporary examples
  - Successful applications and cautionary tales
  - Simple and complex scenarios
----
### 4. References and Further Reading
- Provide a comprehensive list of citations using a consistent format
- Include recommendations for additional resources and reading materials
- Categorize references by subtopic or type (e.g., theoretical works, empirical studies)
- List relevant journals, conferences, or professional association
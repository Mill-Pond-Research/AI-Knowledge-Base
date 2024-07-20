# Knowledge Base Generation Prompt

Generate a comprehensive knowledge base document on the following keyword or topic: "{{subject/keyword}}".

## Task Overview

Your task is to create an in-depth, well-structured document that serves as a definitive resource on the given topic. The document should be easily parsable by AI systems while also being informative and valuable for human readers. Aim to produce a high-quality, authoritative resource that can be used for AI training, research, and reference.

## Guidelines

### Structure

1. Begin with a Table of Contents
2. Use clear, hierarchical headings and subheadings (H1, H2, H3, etc.)
3. Employ consistent formatting throughout the document
4. Utilize bullet points, numbered lists, and tables where appropriate
5. Tag important sections, definitions, and key concepts for easy AI parsing
6. Include cross-references and internal links to connect related concepts

### Content

#### 1. Introduction and Overview
- Provide a concise summary of the topic
- Explain its significance and relevance in the field
- Outline the scope of the knowledge base

#### 2. Historical Context and Development
- Trace the evolution of the topic over time
- Highlight key milestones and influential figures
- Create a timeline of significant events

#### 3. Key Terminology and Definitions
- Create a glossary of essential terms related to the topic
- Provide clear, concise definitions for each term
- Include etymology and context where relevant

#### 4. Core Theories and Principles
- Explain fundamental theories associated with the topic
- Describe underlying principles and their importance
- Discuss the interrelationships between different theories

#### 5. Critical Frameworks and Models
- Present and explain relevant frameworks and models
- Discuss their applications and limitations
- Compare and contrast different approaches

#### 6. Current State of Research
- Summarize recent developments and breakthroughs
- Identify leading researchers and institutions in the field
- Highlight ongoing debates and areas of active investigation

#### 7. Applications and Real-World Examples
- Provide concrete examples of how the topic is applied in practice
- Include case studies or scenarios that illustrate key concepts
- Discuss the impact of these applications on various industries or domains

#### 8. Challenges and Limitations
- Discuss current obstacles or controversies in the field
- Address potential limitations of existing theories or approaches
- Explore ethical considerations and potential risks

#### 9. References and Further Reading
- Provide a comprehensive list of citations using a consistent format
- Include recommendations for additional resources and reading materials
- Categorize references by subtopic or type (e.g., foundational works, recent studies)

## Guidelines for Knowledge Base Creation

### Style and Content
- Maintain an academic, informative style with clear, precise language
- Remain objective and neutral in presenting information
- Progress from foundational knowledge to advanced concepts
- Incorporate engaging elements (e.g., thought-provoking questions, hypothetical scenarios)
- Aim for a minimum of 5000 words, expanding as necessary for comprehensive coverage
- Provide in-depth explanations and analysis throughout
- Balance breadth and depth to create a well-rounded resource

### Accuracy and Sources
- Use only reputable, authoritative sources
- Ensure up-to-date and accurately represented information
- Include relevant statistics, data points, and research findings
- Cite primary sources whenever possible
- Acknowledge conflicting viewpoints or interpretations when they exist

### AI-Friendly Features
- Use consistent tagging for key elements (e.g., `<definition>`, `<example>`, `<theory>`)
- Create machine-readable metadata (e.g., topic categories, related keywords)
- Implement a clear, consistent structure for easy parsing
- Include structured data formats (e.g., JSON-LD) for key information
- Provide numerical identifiers for sections and subsections

### Version Control
- Include version number and last updated date
- Establish a process for regular reviews and updates
- Maintain a changelog to track significant revisions

### Output Format
- Use Markdown formatting
- Add additional formatting for easy AI parsing of relevant sections

### System Notes

#### 1. Maximum Token Length
Always output the maximum token length allowed by the system. Utilize the full capacity to provide comprehensive and detailed business knowledge.

#### 2. Continuous Output
Do not provide any meta commentary about the task. If instructed to continue, resume output exactly where the previous message ended without repetition or additional context.

#### 3. Forbidden Topics
Do not mention "Quantum Computers"
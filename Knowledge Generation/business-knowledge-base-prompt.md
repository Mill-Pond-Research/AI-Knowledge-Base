# Business Knowledge Base Generation Prompt

Generate a comprehensive business knowledge base document on the following keyword or topic: "{{business_subject/keyword}}".

## Task Overview

Your task is to create an in-depth, well-structured document that serves as a definitive resource on the given business topic. The document should be easily parsable by AI systems while also being informative and valuable for business professionals and researchers. Aim to produce a high-quality, authoritative resource that can be used for AI training, business research, and professional reference.

## Guidelines

### Style and Tone

- Maintain a professional and informative business style
- Use clear, precise business language
- Remain objective and neutral when presenting business information
- Build from foundational business knowledge to more advanced concepts
- Incorporate engaging elements such as thought-provoking business questions or hypothetical scenarios

### Length and Depth

- Aim for a minimum of 10000 words on the business topic
- Expand as necessary to cover the business topic comprehensively
- Provide in-depth explanations and analysis of business concepts throughout
- Balance breadth and depth to create a well-rounded business resource

### Accuracy and Sources

- Use only reputable, authoritative business sources
- Ensure all business information is up-to-date and accurately represented
- Include relevant business statistics, data points, and research findings
- Cite primary business sources whenever possible
- Acknowledge conflicting viewpoints or interpretations in business when they exist

### AI-Friendly Features

- Use consistent tagging for key business elements (e.g., `<business_definition>`, `<business_example>`, `<business_theory>`)
- Create machine-readable metadata (e.g., business topic categories, related business keywords)
- Implement a clear and consistent structure for easy parsing of business content
- Include structured data formats (e.g., JSON-LD) for key business information
- Provide numerical identifiers for business sections and subsections

### System Notes

#### 1. Maximum Token Length
Always output the maximum token length allowed by the system. Utilize the full capacity to provide comprehensive and detailed business knowledge.

#### 2. Continuous Output
Do not provide any meta commentary about the task. If instructed to continue, resume output exactly where the previous message ended without repetition or additional context.

#### 3. Forbidden Topics
Do not mention "Quantum Computers"

## Output Format
Always output in Markdown format.

### Structure

1. Begin with a Table of Contents
    1. Introduction and Overview
    2. Historical Context and Business Evolution
    3. Key Business Terminology and Definitions
    4. Core Business Theories and Principles
    5. Critical Business Frameworks and Models
    6. Current State of Business Research and Practice
    7. Business Applications and Real-World Examples
    8. Business Challenges and Limitations
    9. Future Directions and Emerging Business Trends
    10. Business References and Further Reading.
2. Use clear, hierarchical headings and subheadings (H1, H2, H3, etc.)
3. Employ consistent formatting throughout the document
4. Utilize bullet points, numbered lists, and tables where appropriate
5. Tag important sections, definitions, and key business concepts for easy AI parsing
6. Include cross-references and internal links to connect related business concepts

### Content

#### 1. Introduction and Overview
- Provide a concise summary of the business topic
- Explain its significance and relevance in the business world
- Outline the scope of the knowledge base and its applications in business
----
#### 2. Historical Context and Business Evolution
- Trace the evolution of the business concept or practice over time
- Highlight key milestones and influential business figures
- Create a timeline of significant events in business history related to the topic
----
#### 3. Key Business Terminology and Definitions
- Create a glossary of essential business terms related to the topic
- Provide clear, concise definitions for each business term
- Include business context and usage examples where relevant
----
#### 4. Core Business Theories and Principles
- Explain fundamental business theories associated with the topic
- Describe underlying business principles and their importance
- Discuss the interrelationships between different business theories
----
#### 5. Critical Business Frameworks and Models
- Present and explain relevant business frameworks and models
- Discuss their applications in various business contexts and their limitations
- Compare and contrast different business approaches
----
#### 6. Current State of Business Research and Practice
- Summarize recent developments and breakthroughs in business practice
- Identify leading researchers, practitioners, and institutions in the business field
- Highlight ongoing debates and areas of active investigation in business
----
#### 7. Business Applications and Real-World Examples
- Provide concrete examples of how the topic is applied in business practice
- Include business case studies or scenarios that illustrate key concepts
- Discuss the impact of these applications on various industries or business domains
----
#### 8. Business Challenges and Limitations
- Discuss current obstacles or controversies in the business field
- Address potential limitations of existing business theories or approaches
- Explore ethical considerations and potential risks in business practice
----
#### 9. Future Directions and Emerging Business Trends
- Explore potential future developments in the business field
- Identify emerging business trends and their potential impact
- Discuss interdisciplinary connections and potential collaborations in business
----
#### 10. Business References and Further Reading
- Provide a comprehensive list of business citations using a consistent format
- Include recommendations for additional business resources and reading materials
- Categorize references by business subtopic or type (e.g., foundational works, recent studies)
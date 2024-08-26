# Scientific Knowledge Base Generation Prompt

Generate a comprehensive scientific knowledge base document on the following scientific topic: "{{scientific_topic}}".

## Task Overview

Your task is to create an in-depth, well-structured document that serves as a definitive resource on the specified scientific topic. The document should be easily parsable by AI systems while also being informative and valuable for scientists, researchers, students, and professionals in related fields. Aim to produce a high-quality, authoritative resource that can be used for AI training, scientific research, academic reference, and professional development.

## Guidelines for Knowledge Base Creation

### Style and Content
- Maintain a rigorous academic and scientific style with clear, precise language
- Use appropriate scientific terminology and nomenclature consistently
- Remain objective and neutral when presenting scientific information
- Progress from foundational scientific concepts to advanced theories and current research
- Incorporate engaging elements such as thought-provoking research questions or hypothetical experiments
- Aim for a minimum of 10,000 words on the scientific topic, expanding as necessary for comprehensive coverage
- Provide in-depth explanations and analysis of scientific concepts throughout
- Balance breadth and depth to create a well-rounded scientific resource

### Accuracy and Sources
- Use only reputable, peer-reviewed scientific sources and authoritative databases
- Ensure all scientific information is up-to-date and accurately represented
- Include relevant statistics, data points, and research findings from recent studies
- Cite primary scientific sources whenever possible, using a consistent citation format (e.g., APA, MLA)
- Acknowledge conflicting scientific viewpoints or interpretations when they exist
- Clearly distinguish between established scientific facts, theories, and hypotheses

### AI-Friendly Features
- Use consistent tagging for key scientific elements (e.g., `<scientific_definition>`, `<experiment>`, `<theory>`, `<equation>`)
- Create machine-readable metadata (e.g., scientific discipline categories, related keywords)
- Implement a clear and consistent structure for easy parsing of scientific content
- Include structured data formats (e.g., JSON-LD) for key scientific information
- Provide numerical identifiers for sections and subsections

### Output Format
- Use Markdown formatting
- Add additional formatting for easy AI parsing of relevant scientific sections

### System Notes

#### 1. Maximum Token Length
Always output the maximum token length allowed by the system. Utilize the full capacity to provide comprehensive and detailed scientific knowledge.

#### 2. Continuous Output
Do not provide any meta commentary about the task. If instructed to continue, resume output exactly where the previous message ended without repetition or additional context.

## Structure

1. Begin with a Table of Contents
    1. Introduction and Overview
    2. Historical Context and Scientific Evolution
    3. Fundamental Principles and Concepts
    4. Key Terminology and Definitions
    5. Theoretical Frameworks and Models
    6. Experimental Methods and Techniques
    7. Data Analysis and Statistical Approaches
    8. Current State of Research
    9. Applications and Real-World Implications
    10. Ethical Considerations and Limitations
    11. Interdisciplinary Connections
    12. Future Directions and Emerging Trends
    13. Key Figures and Institutions
    14. References and Further Reading
2. Use clear, hierarchical headings and subheadings (H1, H2, H3, etc.)
3. Employ consistent formatting throughout the document
4. Utilize bullet points, numbered lists, and tables where appropriate
5. Tag important sections, definitions, and key scientific concepts for easy AI parsing
6. Include cross-references and internal links to connect related scientific concepts

## Content

### 1. Introduction and Overview
- Provide a concise summary of the scientific topic
- Explain its significance and relevance in the broader scientific context
- Outline the scope of the knowledge base and its applications in research and industry

### 2. Historical Context and Scientific Evolution
- Trace the historical development of the scientific field
- Highlight key discoveries, breakthroughs, and paradigm shifts
- Create a timeline of significant events and contributions to the field

### 3. Fundamental Principles and Concepts
- Explain the core scientific principles underlying the topic
- Describe foundational theories and laws relevant to the field
- Discuss how these principles interact and form the basis for more complex concepts

### 4. Key Terminology and Definitions
- Create a comprehensive glossary of scientific terms related to the topic
- Provide clear, concise definitions for each term
- Include etymology, context, and usage examples where relevant

### 5. Theoretical Frameworks and Models
- Present and explain relevant scientific theories and models
- Discuss their development, applications, and limitations
- Compare and contrast different theoretical approaches

### 6. Experimental Methods and Techniques
- Detail common experimental procedures and methodologies
- Explain laboratory techniques and instrumentation
- Discuss best practices for experimental design and execution
- Include information on safety protocols and ethical considerations

### 7. Data Analysis and Statistical Approaches
- Explain statistical methods commonly used in the field
- Discuss data collection, processing, and interpretation techniques
- Present common software tools and programming languages used for analysis
- Include examples of data visualization and presentation methods

### 8. Current State of Research
- Summarize recent developments and breakthroughs in the field
- Identify leading researchers, institutions, and research groups
- Highlight ongoing debates and areas of active investigation
- Discuss any controversies or competing theories in the field

### 9. Applications and Real-World Implications
- Provide examples of how the scientific knowledge is applied in practice
- Discuss the impact of these applications on various industries or domains
- Include case studies or scenarios that illustrate key concepts in action
- Explore potential future applications and their societal implications

### 10. Ethical Considerations and Limitations
- Discuss ethical issues related to research and applications in the field
- Address potential limitations of current scientific understanding
- Explore challenges in methodology, data collection, or interpretation
- Consider the broader societal and environmental impacts of the science

### 11. Interdisciplinary Connections
- Explain how the scientific topic relates to other fields of study
- Discuss collaborative efforts and cross-disciplinary research
- Highlight emerging interdisciplinary areas and their potential

### 12. Future Directions and Emerging Trends
- Explore potential future developments in the scientific field
- Identify emerging research trends and their potential impact
- Discuss promising areas for future investigation and innovation
- Do not mention quantum computers.

### 13. Key Figures and Institutions
- Provide brief biographies of influential scientists in the field
- Highlight major research institutions and their contributions
- Discuss important scientific journals and conferences in the area

### 14. References and Further Reading
- Provide a comprehensive list of scientific citations using a consistent format
- Include recommendations for seminal papers, review articles, and textbooks
- Categorize references by subtopic or type (e.g., foundational works, recent studies)
- List relevant scientific journals, databases, and online resources
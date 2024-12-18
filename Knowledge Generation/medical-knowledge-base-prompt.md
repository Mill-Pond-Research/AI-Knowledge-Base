# Medical Knowledge Base Generation Prompt

Generate a comprehensive knowledge base document on the following medical topic: "{{medical_topic}}".

## Task Overview

Your task is to create an in-depth, well-structured document that serves as a definitive resource for AI systems to understand and process medical information on the specified topic. The document should be optimized for AI parsing while remaining informative for healthcare professionals. Follow these guidelines:

## Structure

1. Use clear, hierarchical headings and subheadings (H1, H2, H3, etc.)
2. Employ consistent formatting throughout the document
3. Utilize tables, bullet points, and diagrams where appropriate
4. Tag important sections, medical terms, and key concepts for easy AI parsing
5. Include a version number and last updated date for the knowledge base

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

## Output Format
Always output in Markdown format.

## Content

### 1. Introduction and Overview
- Provide a concise summary of the medical topic
- Explain its significance in healthcare and patient outcomes
- Specify the current state of knowledge and research
- Include a brief history and major milestones in understanding the topic

### 2. Anatomy and Physiology
- Detail relevant anatomical structures and physiological processes
- Explain normal function and homeostatic mechanisms
- Include diagrams and illustrations for visual reference
- Discuss variations in anatomy and physiology across different populations
----
### 3. Etiology and Risk Factors
- Outline known causes and contributing factors
- Explain genetic, environmental, and lifestyle risk factors
- Provide statistical data on prevalence and incidence
- Include information on high-risk populations and screening recommendations

### 4. Pathophysiology
- Describe the underlying disease mechanisms
- Explain how normal function is altered in pathological states
- Provide detailed explanations of disease progression
- Include current theories and areas of ongoing research

### 5. Clinical Presentation and Symptoms
- List common signs and symptoms
- Describe typical patient presentations and clinical courses
- Explain variations in presentation across different patient groups
- Include information on rare or atypical presentations
----
### 6. Diagnostic Approaches
- Detail diagnostic criteria and classification systems
- Explain physical examination techniques and findings
- List relevant laboratory tests and imaging studies
- Discuss differential diagnoses and diagnostic algorithms

### 7. Treatment and Management
- Describe current treatment guidelines and protocols
- Explain pharmacological interventions, including mechanisms of action
- Detail surgical procedures and interventional techniques
- Discuss lifestyle modifications and supportive care approaches

### 8. Prognosis and Complications
- Provide information on expected outcomes and survival rates
- Explain potential complications and their management
- Discuss factors affecting prognosis and quality of life
- Include long-term follow-up recommendations
----
### 9. Prevention and Screening
- Outline primary prevention strategies
- Explain screening methods and guidelines
- Discuss vaccine development and immunization protocols (if applicable)
- Include public health measures and population-level interventions

### 10. Special Populations
- Discuss considerations for pediatric and geriatric patients
- Explain management during pregnancy and lactation
- Address racial and ethnic disparities in care and outcomes
- Include information on rare subgroups or genetic variants
----
### 11. Emerging Research and Future Directions
- Summarize current areas of active research
- Explain promising new therapies or diagnostic techniques
- Discuss potential breakthroughs in understanding disease mechanisms
- Include information on ongoing clinical trials

### 12. Patient Education and Counseling
- Provide resources for patient education
- Explain strategies for effective communication with patients
- Discuss shared decision-making and informed consent
- Include culturally sensitive approaches to patient care
----
### 13. Healthcare Economics and Policy
- Discuss the economic burden of the condition
- Explain insurance coverage and reimbursement issues
- Outline relevant healthcare policies and regulations
- Include information on access to care and health disparities

### 14. Interdisciplinary Care and Collaboration
- Describe the roles of various healthcare professionals
- Explain models of interdisciplinary care
- Discuss strategies for effective team communication
- Include information on care coordination and transitions
----
### 15. Technology and Innovation
- Outline current and emerging technologies in diagnosis and treatment
- Explain the role of artificial intelligence and machine learning
- Discuss telemedicine and remote patient monitoring
- Include information on digital health tools and mobile applications

### 16. Global Health Perspectives
- Discuss global prevalence and geographic variations
- Explain cultural factors affecting diagnosis and treatment
- Outline international guidelines and collaborative efforts
- Include information on health equity and access in different regions
----
### 17. References and Resources
- List key clinical practice guidelines
- Include links to reputable medical databases and journals
- Provide references to seminal studies and meta-analyses
- Add a curated list of continuing medical education resources
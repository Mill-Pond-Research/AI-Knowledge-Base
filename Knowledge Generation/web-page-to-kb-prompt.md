# Web Page to Knowledge Base Generation Prompt

Generate a comprehensive knowledge base document based on the content of the following URL: "{{url}}".

## Task Overview

Your task is to create an in-depth, well-structured knowledge base entry from the given web page. The resulting document should be easily parsable by AI systems while also being informative and valuable for human readers. Aim to produce a high-quality, authoritative resource that can be used for AI training, research, and reference, effectively translating the web content into a structured, detailed textual format.

## Guidelines

### Information Extraction and Elaboration

1. Extract ALL information present on the web page, including text, images, videos, and any interactive elements
2. Elaborate on concepts, providing detailed explanations and relevant context where possible
3. For information that is unclear or requires additional knowledge, list the items as they appear on the web page and note the need for further clarification
4. Remove any advertisements, user comments, or irrelevant content not directly related to the main topic
5. If the web page is about a specific product or brand, describe it objectively and provide a comparative analysis with similar products or brands in the category

### Structure

1. Begin with a comprehensive Table of Contents based on the web page's structure and content organization
2. Use clear, hierarchical headings and subheadings (H1, H2, H3, etc.) meticulously mirroring the web page's layout and information hierarchy
3. Employ consistent and professional formatting throughout the document
4. Utilize bullet points, numbered lists, and tables where appropriate, preserving and enhancing the web page's content structure
5. Tag important sections, definitions, and key concepts for easy AI parsing, using a consistent and intuitive tagging system
6. Include cross-references and internal links to connect related concepts within the document, enhancing navigability and comprehension

### Content

#### 1. Web Page Overview
- Provide a concise yet comprehensive summary of the web page's content and purpose
- Explain its significance and relevance in the field it represents, including potential applications
- Outline the scope of the original web page and the resulting knowledge base entry, noting any expansions or elaborations

#### 2. Key Sections
- Create detailed sections based on the main divisions or areas of the web page
- Summarize and expand on the content of each section, providing depth and context
- Meticulously preserve the original structure and flow of information as presented on the web page
- Elaborate on each point, providing additional context, examples, or explanations where possible to enhance understanding

#### 3. Terminology and Definitions
- Extract and compile a comprehensive glossary of ALL terms from the web page, including technical jargon and industry-specific language
- Provide clear, concise, and accurate definitions for each term
- Include context and usage examples as depicted on the original web page, and supplement with additional relevant examples if appropriate
- If definitions are not provided on the web page, list the terms and clearly indicate that definitions are not available from the source

#### 4. Core Concepts and Principles
- Identify and explain ALL concepts presented on the web page, from fundamental ideas to complex theories
- Describe underlying principles and their importance as outlined in the web content, providing additional context where relevant
- Discuss the interrelationships between different concepts within the web page, highlighting any hierarchies or dependencies
- For concepts that are not fully explained on the web page, provide a brief description and explicitly note that further information is not available from the source

#### 5. Multimedia Content
- Describe in detail ALL images, videos, infographics, or other visual elements present on the web page
- Transcribe any video or audio content, ensuring all spoken information is captured in text form
- Interpret and explain the data or information represented in visual elements, including specific values where available
- Discuss trends, patterns, or relationships illustrated in the multimedia content, providing analysis and insights

#### 6. Interactive Elements
- Detail any interactive features on the web page, such as calculators, quizzes, or dynamic charts
- Explain the purpose and functionality of these interactive elements
- Provide examples of how users might interact with these features and what information or results they might obtain

#### 7. External Links and Resources
- Compile a list of ALL external links provided on the web page
- Briefly describe the content or purpose of each linked resource
- Categorize these links (e.g., further reading, references, related topics) based on their context within the web page

#### 8. Author and Source Information
- Provide details about the author(s) or organization responsible for the web page content
- Include any relevant credentials, expertise, or background information provided
- Note the publication date and any recent updates to the web page

#### 9. User Engagement and Community Aspects
- Describe any features for user engagement, such as comment sections or forums
- Summarize key points from user discussions if they provide valuable insights or additional information
- Explain any community guidelines or moderation policies mentioned on the web page

#### 10. Technical Aspects (if relevant)
- Discuss any technical specifications, system requirements, or compatibility information provided
- Explain coding examples, algorithms, or technical processes detailed on the web page
- Provide step-by-step instructions for any technical procedures outlined

#### 11. Case Studies and Examples
- Extract ALL examples, case studies, or real-world applications from the web page
- Provide detailed summaries of these examples, including context, process, and outcomes
- Analyze the relevance and implications of these case studies in relation to the main topic

#### 12. Frequently Asked Questions
- Compile a list of ALL FAQs provided on the web page
- Include both questions and answers, maintaining the original wording
- Organize FAQs into logical categories if not already structured on the web page

#### 13. References and Further Reading
- List ALL sources or citations included on the web page, ensuring proper formatting
- Include any recommendations for additional resources mentioned in the web content
- If no references are provided, clearly state that the web page does not contain citation information

### Style and Tone
- Maintain a professional, informative, and objective style throughout the document
- Use clear, precise language, adapting the terminology used in the web content while ensuring accessibility to a broad audience
- Remain neutral when presenting information, avoiding bias or personal opinions
- Build from foundational knowledge to more advanced concepts as structured on the web page, ensuring a logical progression of ideas
- Incorporate engaging elements from the web content such as questions, scenarios, or thought-provoking statements to maintain reader interest

### Length and Depth
- Aim for exhaustive coverage of the web page's content, leaving no detail unexplored
- Expand on concepts where possible, while maintaining the web page's focus and intent
- Provide in-depth explanations and analysis throughout, based on the web content and supplemented with relevant external knowledge where appropriate
- Balance breadth and depth to create a comprehensive resource that not only reflects but also enhances and elaborates on the original web page

### Accuracy and Sources
- Use the web page as the primary source, ensuring all information is accurately represented and transcribed
- Include ALL statistics, data points, and research findings from the web content, preserving their original context
- Cite specific sections or elements of the web page for key information, using a consistent referencing system
- Clearly indicate when information is inferred or when additional context is added beyond what's explicitly shown on the web page, maintaining transparency

### AI-Friendly Features
- Use consistent and intuitive tagging for key elements (e.g., `<definition>`, `<example>`, `<theory>`, `<principle>`)
- Create comprehensive machine-readable metadata (e.g., topic categories, related keywords, field of study) based on the web page's content
- Implement a clear, consistent, and logical structure for easy parsing and information retrieval
- Include structured data formats (e.g., JSON-LD) for key information, enhancing machine readability
- Provide numerical identifiers for sections and subsections to facilitate precise referencing and navigation

### Version Control and Updates
- Note the date of the knowledge base entry creation and the version of the web page used (if applicable)
- Suggest a comprehensive process for updates based on potential changes to the web page, additional related content, or advancements in the field
- Include a changelog section to track future modifications and enhancements to the knowledge base entry

By meticulously following these enhanced guidelines, you will create a comprehensive, AI-friendly, and human-readable knowledge base entry that accurately represents, expands upon, and enriches ALL content of the original web page, effectively translating online information into a structured, detailed textual format. Remember to extract every piece of information, elaborate where possible, list unknown items, remove any irrelevant content, and strive for a document that serves as a standalone, authoritative resource on the topic presented on the web page.

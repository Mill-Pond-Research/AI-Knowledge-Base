ACCESS: Prompt Engineering for Automated Web Accessibility Violation Corrections" by Calista Huang et al.

Table of Contents:
1. Document Overview
2. Introduction
3. ACCESS Benchmark
4. ACCESS Agent
5. Results
6. Discussion
7. Conclusion
8. Reproducibility Statement
9. References
10. Glossary of Terms

1. Document Overview

This knowledge base entry is based on the research paper titled "ACCESS: Prompt Engineering for Automated Web Accessibility Violation Corrections" by Calista Huang et al., published as a conference paper at ICLR 2024. The paper presents a novel approach to automatically correct web accessibility violations using large language models (LLMs) and prompt engineering techniques.

The significance of this research lies in its potential to improve web accessibility for individuals with disabilities, addressing a critical need in the digital age. The paper introduces the ACCESS framework, which includes a benchmark system for evaluating error corrections and an agent for implementing corrections in the Document Object Model (DOM).

2. Introduction

The introduction section of the paper highlights the importance of web accessibility and the current challenges in achieving it. 

Key points:

- Web accessibility is crucial for ensuring equal access to online content for individuals with disabilities.
- Despite existing guidelines like WCAG, over 90% of websites fail to meet accessibility requirements.
- Manual detection and correction of accessibility violations are expensive, time-consuming, and error-prone.

Quote: "Web accessibility refers to the extent to which online information is readily available to people, regardless of their physical or cognitive capabilities and the technical specifications of the devices they use (Wu et al., 2017)."

The authors propose a novel approach to address these challenges:

Quote: "This paper presents a novel approach to correcting accessibility violations on the web by modifying the document object model (DOM) in real time with foundation models."

3. ACCESS Benchmark

The ACCESS Benchmark is a system created by the authors to evaluate the success of their models in correcting web accessibility violations.

Key features:
- Uses a dataset of website URLs and their accessibility violations
- Maps errors to impact categories: critical, serious, moderate, minor, and cosmetic
- Assigns numerical weights to each category
- Calculates an aggregated severity score

Quote: "To evaluate the success of our models, we created the first general automatic accessibility violation correction benchmark."

Data Collection:
- Used Playwright API to perform tests on website URLs
- Generated a dataframe organizing violations for approximately 25 URLs
- Resulted in 171 rows of violations

Quote: "We used the Playwright API to perform tests on website URLs and acquire web accessibility violation errors (e.g. empty headings, image tags without alternate text, and website links without discernible text)."

4. ACCESS Agent

The ACCESS Agent is responsible for producing corrected DOM for websites in the dataset using LLMs and prompt engineering techniques.

Key components:
- ReAct Prompting
- Few-Shot Guided Prompting
- Transformer Models

ReAct Prompting:
Quote: "To obtain web accessibility violation corrections from our models, we first leveraged ReAct prompting with the action space being a 2D array of the corrected elements."

Few-Shot Guided Prompting:
Quote: "We implemented Few-Shot guided prompting by providing more violation-correction examples in our system message. We utilized four example input and output messages, clearly labeled like the ReAct prompts."

Transformer Models:
The authors used GPT-3.5-turbo-16K for their main experiments and compared it with GPT-4 in a baseline test.

Action Spaces:
The paper defines the action spaces for implementing HTML corrections and computing the improvement in violations.

Quote: "We define S to be the set of tuples comprising error type, description of error, suggested change, and incorrect HTML tag. M_LLM is the LLM which takes S in the form of a user message and system message. M_LLM outputs a thought along with a corrected HTML tag."

5. Results

The results section presents the outcomes of the ACCESS framework in correcting web accessibility violations.

Key findings:
- GPT-3.5-turbo-16K model achieved a 51.303% decrease in severity scores using ReAct prompting
- ReAct prompting outperformed Chain of Thought and Few-Shot Guidance prompting techniques
- GPT-4 outperformed GPT-3.5-turbo-16K by 4.891% in a baseline test with 10 URLs

Quote: "Examining Table 2, our prompt engineering approach was able to successfully decrease severity scores for all three prompting methods using the GPT-3.5-turbo-16K models."

The paper also presents data on the types of websites included in the dataset and the most frequently corrected errors:

Quote: "As detailed in Table 4, the model demonstrated strong proficiency in addressing text-based web accessibility issues, achieving 100% success rates in correcting violations of landmark-no-duplicate-content, label, skip-link, and ARIA-required-attribute."

6. Discussion

The discussion section explores the implications of the research findings and their potential impact on web accessibility.

Key points:
- The research addresses a critical need for automated accessibility violation corrections
- The approach offers a low-cost, efficient solution to a widespread problem
- The findings have significant societal ramifications, particularly for essential online services

Quote: "Our research pioneers an innovative automated approach using LLMs for efficient, low-cost violation corrections. To our knowledge, existing approaches for correcting accessibility violations do not automate the correction process using prompt engineering techniques in a way that can be easily adapted as a tool for users."

The authors also highlight the limitations of their approach, particularly in handling non-text-based violations:

Quote: "Additionally, the prevalence of non-text-based violations, such as region and color-contrast, which make up 12.28% and 7.02% of our data set respectively (Table 5), highlights the limitations of current LLMs."

7. Conclusion

The conclusion summarizes the key achievements of the research and outlines potential future directions.

Key achievements:
- Developed an efficient method for identifying and correcting web accessibility violations
- Achieved a 51% decrease in severity scores using GPT 3.5-turbo-16K model
- Laid groundwork for a user-friendly and robust correction approach

Quote: "Our research efficiently identifies and corrects web accessibility violations according to the Web Content Accessibility Guidelines (WCAG) using OpenAI's GPT models and prompt engineering techniques."

Future directions:
- Expanding the dataset to include more diverse websites
- Integrating deep learning techniques, such as combining computer vision with natural language processing

Quote: "Looking forward, future efforts could approach augmenting the diversity of our violations dataset. Expanding the dataset to encompass websites from varied industries, sectors, and geographic regions would empower our models to effectively address an even broader spectrum of accessibility challenges."

8. Reproducibility Statement

The authors provide information on the reproducibility of their research:

Quote: "Supplementary materials include the violations dataset generated by Playwright, the code used to run ACCESS benchmark and ACCESS agent, and the dataset with corrected DOM elements. Results may vary when running the models as the responses returned from GPT models are not necessarily replicable."

9. References

The paper includes an extensive list of references, which can be found at the end of the document. These references provide additional context and support for the research presented in the paper.

10. Glossary of Terms

- Web accessibility: The extent to which online information is readily available to people, regardless of their physical or cognitive capabilities and the technical specifications of the devices they use.
- WCAG: Web Content Accessibility Guidelines, international standards for enforcing accessibility.
- DOM: Document Object Model, the logical structure of webpages.
- LLM: Large Language Model, a type of artificial intelligence model trained on vast amounts of text data.
- Prompt engineering: The process of designing and optimizing input prompts for language models to generate desired outputs.
- ReAct prompting: A prompting technique that combines reasoning and action in language models.
- Few-Shot Guided prompting: A prompting technique that provides multiple examples to guide the model's responses.
- Playwright: An API used for web testing and automation.
- ARIA: Accessible Rich Internet Applications, a suite of attributes and roles designed to enhance the semantic value of web elements for assistive technologies.
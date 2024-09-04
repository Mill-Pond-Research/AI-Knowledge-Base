# A Novel Approach for Rapid Development Based on ChatGPT and Prompt Engineering

Authors: Youjia Li, Jianjun Shi, Zheng Zhang

## Table of Contents

1. Document Overview
2. Introduction
3. Related Work
4. Methodology
   4.1 User Interface
   4.2 Prompt Builder
   4.3 Backend Service
   4.4 Self-Debugging Optimization
5. Results
   5.1 Case Study 1: Independent Functions
   5.2 Case Study 2: Multi-File Generation
   5.3 Case Study 3: Webpage Visualization
6. Evaluation
   6.1 Evaluation Methods
   6.2 Code Evaluation
   6.3 Human Evaluation
7. Shortcomings and Challenges
8. Conclusion
9. References

## 1. Document Overview

This knowledge base entry is based on a research paper that explores a novel approach to rapid software development using ChatGPT and Prompt Engineering. The study presents a web-based code generation platform that leverages ChatGPT's capabilities and optimizes its performance through prompt engineering techniques. The document outlines the methodology, presents case studies, evaluates the effectiveness of the approach, and discusses its limitations and future directions.

The significance of this research lies in its potential to revolutionize software development processes by harnessing the power of large language models for code generation. As the field of AI-assisted programming continues to evolve, this study provides valuable insights into the practical application of ChatGPT in real-world development scenarios.

## 2. Introduction

<quote>Code generation stands as a powerful technique in modern software development, improving development efficiency, reducing errors, and fostering standardization and consistency. Recently, ChatGPT has exhibited immense potential in automatic code generation. However, existing researches on code generation lack guidance for practical software development process.</quote>

The introduction sets the stage for the research by highlighting the importance of code generation in modern software development. It emphasizes the recent advancements in AI, particularly ChatGPT, and their potential in automating code generation tasks. The authors identify a gap in existing research, noting the lack of practical guidance for implementing these technologies in real-world software development processes.

<quote>In this study, we utilized ChatGPT to develop a web-based code generation platform consisting of key components: User Interface, Prompt Builder and Backend Service. Specifically, Prompt Builder dynamically generated comprehensive prompts to enhance model generation performance.</quote>

The authors introduce their novel approach, which involves the development of a web-based code generation platform that leverages ChatGPT. They highlight three key components of their system:

1. User Interface
2. Prompt Builder
3. Backend Service

Special emphasis is placed on the Prompt Builder, which is designed to dynamically generate comprehensive prompts to enhance the performance of the model.

## 3. Related Work

The paper provides a brief overview of related work in the field of code generation and large language models. Key points include:

1. Deep learning techniques have brought significant advancements in code generation.
2. Previous models faced challenges in practical implementation due to training scale and development costs.
3. ChatGPT, introduced by OpenAI, has shown considerable potential in various domains, including code generation.
4. Prompt optimization has been empirically proven to contribute to improvements in model output.

<quote>Researchers have investigated the effective application of these models in automating code generation [1-3]. Constrained by the scale of training and development costs, these models ultimately faced challenges in being practically implemented in engineering development.</quote>

This quote highlights the limitations of previous approaches, setting the stage for the authors' novel method using ChatGPT.

## 4. Methodology

The methodology section describes the components and processes of the web-based code generation platform developed by the authors.

### 4.1 User Interface

<quote>The interface of the platform utilized in this study is depicted in Figure 2. Users can customize parameters using the settings tab located on the right side of the page, such as API key, Max tokens, Temperature, Top P, and others. A dialogue box at the bottom of the page allows for inputting information. User conversations with ChatGPT are documented in a conversational format at the center of the page. The conversations tab on the left side provides the capability to query and manage historical sessions.</quote>

The user interface is designed to be intuitive and functional, allowing users to:
- Customize parameters
- Input information
- View conversations with ChatGPT
- Manage historical sessions

### 4.2 Prompt Builder

The Prompt Builder is a crucial component of the system, designed to optimize the prompts sent to ChatGPT.

<quote>We adopted a dynamically assembled approach for constructing prompts with our Prompt Builder that consists of two segments. The first part is the original prompt, representing user-inputted information. The second part involves dynamic encapsulation using tools named prompt builder, encompassing system details and strategies for prompt optimization.</quote>

The Prompt Builder consists of several components:

1. Configure system information
2. Original input information
3. Establish coding conventions
4. Specify file format
5. Define file structure
6. Impose stringent requirements

Each of these components plays a specific role in optimizing the prompt for better code generation results.

### 4.3 Backend Service

<quote>Developed backend services using Java, enabling continuous sessions and result output through streaming calls to the ChatGPT API.</quote>

The backend service is responsible for managing the communication between the user interface and the ChatGPT API, ensuring continuous sessions and efficient result output.

### 4.4 Self-Debugging Optimization

<quote>This section incorporates the Self-Debugging method [30] for optimizing the Prompt in Figure 4. The approach involves executing the generated code and utilizing feedback derived from the code and execution results to guide the model in debugging, thereby correcting errors in the code or improving the model's output performance.</quote>

The Self-Debugging optimization process involves three main methods:
1. Simple Feedback
2. Unit Testing
3. Code Explanation

This approach aims to enhance the quality of the generated code through iterative refinement based on execution results and feedback.

## 5. Results

The results section presents three case studies demonstrating the effectiveness of the proposed approach in different scenarios.

### 5.1 Case Study 1: Independent Functions

This case study focuses on generating independent functions within utility classes.

<quote>For example, let's consider a common scenario, creating a file-writing function in PHP. Notably, practical application scenarios might involve challenges like insufficient operating permissions and concurrent access, as highlighted in Table 1.</quote>

The case study demonstrates the system's ability to generate code that addresses specific requirements and potential challenges, such as file permissions and multi-user access security.

### 5.2 Case Study 2: Multi-File Generation

This case study explores the system's capability to handle multi-file code generation tasks.

<quote>To investigate this, we selected a scenario, container start-stop management on a web server, implemented in Java using the Spring Boot framework.</quote>

The results show that the system can effectively generate code for complex scenarios involving multiple files and frameworks.

### 5.3 Case Study 3: Webpage Visualization

The third case study focuses on frontend development, specifically creating a simplified version of Steve Jobs' personal homepage.

<quote>This case aims to develop a simplified version of Steve Jobs' personal homepage, with the technology stack including HTML, CSS, and JavaScript.</quote>

This case study demonstrates the system's ability to generate frontend code, including visual elements and layout.

## 6. Evaluation

The evaluation section presents the methods and results of assessing the effectiveness of the proposed approach.

### 6.1 Evaluation Methods

The authors used two datasets for evaluation:
1. HumanEval: A publicly available dataset based on Python
2. CodeData-L: A novel dataset targeting languages such as SQL, PHP, Java, Python, and JavaScript

They employed both comparison-based metrics (EM, BLEU, CodeBLEU) and execution-based metrics (Pass@1) for evaluation.

### 6.2 Code Evaluation

<quote>Our prompt builder has been proved to be effective in optimizing the generation results of ChatGPT. Table 5 presents the results of the ablation experiments. The use of Prompt Builder yielded a 65.06% improvement in EM, a 38.45% improvement in BLEU, a 15.70% improvement in CodeBLEU, and a 50.64% improvement in Pass@1.</quote>

These results demonstrate the significant improvement in code generation performance achieved through the use of the Prompt Builder.

### 6.3 Human Evaluation

The human evaluation was conducted on the CodeData-L dataset, assessing the generated code based on functionality, quality, complexity, and maintainability.

<quote>Figure 12 displays the statistics for all scenarios. The pie chart depicts a success rate of 80% (Satisfied), a modified success rate of 18.5% (Modified), and a failure rate of 1.5% (Failed). It is noteworthy that only 1.5% of the scenarios failed to meet the expected state even after multiple rounds of questioning.</quote>

These results indicate a high success rate in generating code that meets developers' requirements across various scenarios.

## 7. Shortcomings and Challenges

The authors identify several limitations and challenges associated with their approach:

1. Challenges inherent to ChatGPT, such as accuracy, timeliness, and potential for generating non-factual outcomes.
2. Definition standards for prompts, highlighting the importance of clear and precise descriptions.
3. Balancing single-round and multi-round conversations in code generation.

<quote>ChatGPT exhibits inherent shortcomings in the current stage of large-scale pre-training models. These issues encompass challenges related to the accuracy and timeliness of information generation, as well as tendencies toward repetitive or overly verbose outputs and potential instances of guiding misdirection.</quote>

## 8. Conclusion

The study concludes that the combination of ChatGPT and Prompt Engineering can effectively assist developers in practical code generation tasks.

<quote>This study confirms that with the assistance of high-quality prompts, ChatGPT can proficiently accomplish code generation tasks, offering valuable solutions for researchers and developers. However, in terms of outcomes, ChatGPT and generative AI remain auxiliary tools, capable of aiding users in task completion, yet the effectiveness is still heavily reliant on human input.</quote>

The authors emphasize the importance of integrating professional expertise with AI models to unlock their full potential in software development.

## 9. References

The paper includes a comprehensive list of references, which can be found at the end of the document. These references cover various aspects of code generation, large language models, and related technologies.

<quote>[1] Z.-Y. Feng et al., "Codebert: A pre-trained model for programming and natural languages," arXiv preprint arXiv:2002.08155, 2020.</quote>

<quote>[2] W. U. Ahmad, S. Chakraborty, B. Ray, and K.-W. Chang, "Unified pre-training for program understanding and generation," arXiv preprint arXiv:2103.06333, 2021.</quote>

<quote>[3] L. Phan et al., "Cotext: Multi-task learning with code-text transformer," arXiv preprint arXiv:2105.08645, 2021.</quote>
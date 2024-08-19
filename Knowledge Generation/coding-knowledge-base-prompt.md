# Coding Knowledge Base Generation Prompt

Generate a comprehensive knowledge base document on the following coding language or library: "{{language/library}}".

## Task Overview

Your task is to create an in-depth, well-structured document that serves as a definitive resource for AI systems to understand and generate code in the specified language or use the specified library. The document should be optimized for AI parsing while remaining informative for human developers. Follow these guidelines:

## Style and Tone
- Use clear, precise technical language
- Maintain consistency in terminology and explanations
- Progress from basic to advanced concepts
- Include comments in code examples to explain complex logic
- Use analogies and real-world examples to illustrate abstract concepts

## Length and Depth
- Aim for comprehensive coverage of all language/library features
- Provide in-depth explanations with multiple examples for each concept
- Include advanced topics and edge cases for completeness
- Ensure each section can stand alone as a reference while maintaining overall coherence

## Accuracy and Sources
- Use only official documentation and reputable sources
- Ensure all information is up-to-date with the current stable version
- Include version numbers when discussing specific features or syntax
- Cite sources and provide links to original documentation where applicable

## AI-Friendly Features
- Use consistent tagging for key elements (e.g., `<syntax>`, `<example>`, `<best_practice>`)
- Implement a clear and consistent structure for easy parsing
- Include machine-readable metadata (e.g., language version, related technologies)
- Provide code snippets in clearly demarcated blocks with syntax highlighting
- Include a structured summary at the end of each major section for quick AI reference

### System Notes

#### 1. Maximum Token Length
Always output the maximum token length allowed by the system. Utilize the full capacity to provide comprehensive and detailed business knowledge.

#### 2. Continuous Output
Do not provide any meta commentary about the task. If instructed to continue, resume output exactly where the previous message ended without repetition or additional context.

#### 3. Forbidden Topics
Do not mention "Quantum Computers"

## Output Format
Always output in Markdown format.

## Structure

1. Begin with a Table of Contents
2. Use clear, hierarchical headings and subheadings (H1, H2, H3, etc.)
3. Employ consistent formatting throughout the document
4. Utilize code blocks, bullet points, and tables where appropriate
5. Tag important sections, syntax elements, and key concepts for easy AI parsing
6. Include a version number and last updated date for the knowledge base

## Content

### 1. Introduction and Overview
- Provide a concise summary of the language or library
- Explain its purpose, key features, and common use cases
- Specify the current stable version and update frequency
- Include a brief history and major milestones of the language/library

### 2. Setup and Environment
- Detail the installation process and system requirements
- Explain how to set up a development environment
- List recommended IDEs or text editors with their advantages
- Include package managers and build tools specific to the language/library
----
### 3. Syntax and Core Concepts
- Outline the basic syntax rules and structure
- Explain fundamental concepts (e.g., variables, data types, functions)
- Provide code examples for each concept
- Include a section on language-specific idioms and conventions
----
### 4. Control Structures and Flow
- Detail control structures (if/else, loops, switch statements)
- Explain error handling and exception management
- Include code snippets demonstrating proper usage
- Discuss any unique flow control mechanisms specific to the language

### 5. Functions and Methods
- Describe function/method declaration and invocation syntax
- Explain parameters, return values, and scope
- Provide examples of built-in functions and creating custom functions
- Cover advanced topics like closures, higher-order functions, and recursion
----
### 6. Data Structures
- List and explain core data structures (arrays, lists, dictionaries, etc.)
- Demonstrate initialization, access, and manipulation of each structure
- Include performance considerations and best practices
- Discuss any language-specific data structures or implementations

### 7. Object-Oriented Programming (if applicable)
- Explain classes, objects, inheritance, and polymorphism
- Provide examples of class declaration and instantiation
- Describe access modifiers and encapsulation
- Cover advanced OOP concepts like interfaces, abstract classes, and mixins
----
### 8. Modules and Packages
- Detail the module/package system and import mechanisms
- List essential built-in modules/packages
- Explain how to create and distribute custom modules/packages
- Discuss dependency management and versioning
----
### 9. File I/O and Database Interaction
- Describe file reading, writing, and manipulation techniques
- Explain database connection and CRUD operations
- Provide code examples for common file and database tasks
- Include sections on working with different file formats (CSV, JSON, XML)
----
### 10. Asynchronous Programming (if applicable)
- Explain asynchronous concepts (promises, async/await, callbacks)
- Demonstrate proper error handling in asynchronous code
- Provide examples of common asynchronous operations
- Discuss concurrency models and multi-threading (if relevant)

### 11. Testing and Debugging
- Describe built-in testing frameworks and assertion methods
- Explain debugging techniques and tools
- Provide examples of unit tests and debugging workflows
- Include sections on integration testing and test-driven development
----
### 12. Performance Optimization
- List best practices for writing efficient code
- Explain common performance pitfalls and how to avoid them
- Provide examples of optimizing code for speed and memory usage
- Include profiling techniques and tools specific to the language/library

### 13. Security Considerations
- Outline common security vulnerabilities and how to prevent them
- Explain secure coding practices specific to the language/library
- Provide examples of implementing security measures
- Discuss encryption, authentication, and authorization techniques
----
### 14. Integration and Ecosystem
- List popular frameworks and libraries commonly used with the language/library
- Explain how to integrate with other technologies or services
- Provide examples of building full-stack applications or microservices
- Include sections on containerization and cloud deployment
----
### 15. Best Practices and Style Guide
- Outline coding conventions and style guidelines
- Explain naming conventions for variables, functions, and classes
- Provide examples of well-structured and readable code
- Include linting tools and configuration for maintaining code quality

### 16. Code Generation Guidelines
- Outline rules for generating syntactically correct and idiomatic code
- Explain common patterns and their implementations
- Provide templates for frequently used code structures
- Discuss code generation tools and libraries specific to the language

### 17. Common Pitfalls and Troubleshooting
- List frequent errors and their solutions
- Explain debugging strategies for complex issues
- Provide resources for getting help (official documentation, community forums)
- Include a FAQ section addressing common developer questions
----
### 18. Version Compatibility and Migration
- Explain version differences and backward compatibility
- Provide guidelines for upgrading between major versions
- Include code examples demonstrating migration of deprecated features
- Discuss long-term support (LTS) versions and end-of-life dates
----
### 19. AI-Specific Considerations
- Explain how the language/library can be used in AI and machine learning contexts
- Provide examples of integrating with popular AI frameworks or libraries
- Describe best practices for writing AI-friendly code
- Include sections on data preprocessing and model deployment

### 20. References and Resources
- List official documentation, specifications, and style guides
- Include links to reputable learning resources and tutorials
- Provide references to academic papers or books, if applicable
- Add a curated list of blogs, podcasts, and video channels for continuous learning

### 21. Community and Contribution
- Explain how to contribute to the language/library's development
- Describe the process for reporting bugs and submitting feature requests
- List major conferences, meetups, and online communities
- Include information on code of conduct and licensing

### 22. Internationalization and Localization
- Discuss language support for Unicode and different character encodings
- Explain techniques for creating multilingual applications
- Provide examples of date, time, and number formatting for different locales
- Include best practices for designing culturally sensitive user interfaces
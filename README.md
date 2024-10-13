# **The Purge of the Gods**

## Overview

This project showcases how an intelligent agent, developed using OpenAI's API (specifically ChatGPT-4), was used to collaboratively create the novel **The Purge of the Gods**. The agent played a central role in every stage of the writing process, including world-building, character development, translation, and even formatting for publication.

One of the key approaches in this project was **iterative improvement using retrieval** to overcome token limitations inherent to OpenAI's API. When necessary, retrieval was conducted via another agent, allowing for summaries and optimized content management.

I also utilized the [openai-doc-assistant](https://github.com/raestrada/openai-doc-assistant) project to refine all chapters using bash scripts. Given that writing over 100 pages requires efficient processing of large text inputs, a **layered architecture** of agents and prompts was implemented to simplify and refine retrieval tasks.

## How It Works

This project was developed using OpenAI’s API (ChatGPT-4), employing an intelligent agent to assist in almost every aspect of the writing and publishing process. The core of the project was built around an **iterative retrieval process** that helped overcome token limitations while generating, refining, and translating content.

### 1. **Retrieval and Iteration for Large Content**

Given the constraints of OpenAI’s token limits, the novel's development relied heavily on retrieval techniques. Each chapter was broken down into manageable chunks for processing. This allowed for ongoing iteration without exceeding the token limit in any single request.

#### Iterative Improvement

At each stage of the novel's development—whether it was world-building, character arcs, or structuring the magic system—**retrieval was used** to refine and update existing content. Instead of processing entire chapters in one go, sections were revisited in smaller segments, ensuring continuity and depth while remaining within the API's limits.

When larger sections needed summarization, I leveraged retrieval through another agent. This **multi-agent architecture** allowed me to summarize, edit, and retrieve complex sections without losing narrative cohesion. By constantly iterating on smaller portions, I was able to retain the overall structure of the story while expanding the details in a scalable way.

### 2. **Translation Process**

The novel was originally written in Spanish. Using OpenAI’s API, a script (`create-md-en.sh`) was created to automate the translation of Markdown files into fluent English. This ensured that both the Spanish and English versions of the book maintained consistency in tone and meaning.

By breaking down the translation task into smaller parts, the quality of the translated text was preserved, and sections were easily reviewed. After translation, Pandoc was used to compile the files into both **PDF and EPUB** formats for easy distribution.

### 3. **Integration of Tools and Automation**

To streamline the process of writing, translating, and publishing, several tools were employed:

- **Pandoc**: Used to convert Markdown files into EPUB and PDF formats with XeLaTeX for clean, professional-looking documents.
- **Poetry**: Managed dependencies and created an isolated environment for development.
- **openai-doc-assistant**: This project allowed for advanced retrieval and refinement of chapters using bash scripts. It helped break down large files, ensuring that retrieval worked at scale while maintaining quality across long sections of text.

The use of these tools and scripts automated many repetitive tasks, leaving more room for creative iteration.

---

## Challenges for Extending Beyond 100 Pages

While the current setup worked well for creating and refining content under 100 pages, scaling beyond this presents several challenges:

### 1. **Token Limitations and Long-Form Content**

With longer content, OpenAI’s token limits become an even bigger obstacle. A story of more than 100 pages requires breaking down retrieval into even finer segments, which can slow down the process. In such cases, a more layered **architecture of agents** would be required:

- **Multi-agent Setup**: This involves delegating tasks to different agents, with one agent handling retrieval, another summarizing, and a third refining the content. This approach allows for maintaining quality while navigating token constraints.

- **Summarization Layers**: For very long sections, summarizing iteratively at different levels of detail (abstract, detailed, granular) would be necessary. Summarization across layers would ensure that detailed points are not lost as the story expands.

### 2. **Maintaining Narrative Consistency**

As the story grows, keeping track of character motivations, world-building elements, and narrative arcs becomes harder. Here, **document retrieval systems** must be robust, pulling relevant sections for review and refinement based on current context. Future scaling would require:

- **Contextual Prompting**: Developing prompts that retrieve sections based on characters, world details, or specific plot points could improve narrative consistency over longer content.
  
- **Metadata Tagging**: Implementing metadata tagging for chapters, character interactions, and plot points will allow for easier cross-referencing and retrieval. For example, tagging character arcs or magic system rules could help retrieve the necessary context when revisiting older chapters.

### 3. **Automating Story Refinement**

To extend the story beyond 100 pages efficiently, more advanced automation will be necessary:

- **Advanced Retrieval via `openai-doc-assistant`**: This project has already proven useful for refining chapters, but future iterations would need more refined workflows for revisiting and restructuring large amounts of text. This could include more advanced parsing logic to break down chapters by themes or character interactions.

- **Prompts to Refine Specific Plot Points**: Automating retrieval based on plot structure would allow for dynamic restructuring. For example, creating prompt templates that focus on specific story arcs (like character development, magic system rules, or geopolitical conflicts) would enable refining key elements without disrupting the broader narrative.

By addressing these challenges and continuing to evolve the toolset and retrieval architecture, it is feasible to scale **The Purge of the Gods** or any similar story beyond 100 pages, while maintaining both narrative quality and consistency.

## Installation and Setup with Poetry

To manage dependencies and the virtual environment for this project, we use Poetry. Follow the steps below to set up and run the project.

### 1. Installing Poetry
If you don't have Poetry installed, you can do so by running the following command:

````bash
pip install poetry
````

### 2. Installing Dependencies
Once Poetry is installed, you can install all the necessary dependencies by running:

````bash
poetry install
````

This will create an isolated virtual environment and download all the dependencies listed in the `pyproject.toml` file.

### 3. Activating the Virtual Environment
To activate the virtual environment, run:

````bash
poetry shell
````

This will allow you to interact with the environment configured for the project.

## Setting Environment Variables

For the agent to function correctly, it needs to authenticate with OpenAI’s API using an API key. You can set this key using either a `.env` file or by passing the environment variable directly.

### Using a `.env` File

1. Create a file in the project’s root directory called `.env`.
2. Inside this file, add the following line:

````plaintext
OPENAI_API_KEY=your_api_key_here
````

Replace `your_api_key_here` with your actual OpenAI API key.

### Setting Environment Variables Directly

Alternatively, you can set the `OPENAI_API_KEY` environment variable directly in your execution environment.

- **On Windows (CMD):**

````plaintext
set OPENAI_API_KEY=your_api_key_here
````

- **On Linux and macOS (terminal):**

````plaintext
export OPENAI_API_KEY=your_api_key_here
````

> **Important:**  
> For security reasons, never commit the `.env` file to public repositories or share your OpenAI API key publicly. When collaborating, consider using secret management tools or configure environment variables directly in your deployment environment.

## Using the Translation Script

The book is written in Spanish, and you can use the `create-md-en.sh` script to translate it into English using OpenAI's translation capabilities. The script automates the translation of the Markdown files.

To run the script, use the following command:

````bash
bash create-md-en.sh
````

This will generate an English version of the book from the original Spanish Markdown files.

## Building the Book with Pandoc

You can convert the translated Markdown files into a PDF or EPUB format using Pandoc. Here is the Pandoc command used to compile the book into a PDF:

````bash
pandoc libro_completo_en.md -o libro_completo_en.pdf --pdf-engine=xelatex --template=template.tex
````

This command uses the `libro_completo_en.md` file, which contains the full translated book, and generates a PDF using XeLaTeX with a specified LaTeX template.

## Commands for Managing the Agent

- To create the knowledge base from Markdown files:

````bash
python agent.py create
````

- To recreate the knowledge base with updates:

````bash
python agent.py recreate
````

These commands ensure that the agent is always up-to-date with the latest information from your project.

## Docker

If you want to run the agent in a Docker container, you can do so with the following command:

````bash
docker run -e OPENAI_API_KEY=your_api_key_here -p 8000:8000 the-purge-of-the-gods-agent
````

# **The Purge of the Gods**

## Overview
This project utilizes an intelligent agent developed with OpenAI's API, specifically ChatGPT-4, to collaboratively create the novel **The Purge of the Gods**. The agent assists in the iterative process of writing, providing suggestions and answering questions about plot development, chapter structure, and other narrative elements.

## How It Works
The novel is originally written in Spanish, and the `create-md-en.sh` script leverages OpenAI's API to translate the entire book into English. The agent processes Markdown files, translates them, and compiles them into various formats like PDF and EPUB using Pandoc.

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

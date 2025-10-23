# Claude Code Behavior Instructions

## Before Starting Any Task

1. Check existing code structure with `tree` or `ls -la`
2. Look for similar implementations before creating new files
3. Ask: "Has something similar been done? Where?"
4. Follow existing patterns and architecture

## Code Quality Rules

- Write modular, well-architected code
- Follow existing architecture patterns
- Match the style of surrounding code
- Respect language-specific conventions already in place
- Only deviate from existing patterns when explicitly requested

## File Management

- NEVER create duplicate files
- ALWAYS check if file exists before creating
- Prefer editing existing files over creating new ones
- No documentation files unless explicitly requested

## Project Initialization

- ASK how to approach before imposing solutions
- SUGGEST approaches, don't dictate
- Once rules are established, stop suggesting alternatives
- Follow established patterns consistently

## Context Management

- Ask for clarification ONLY when truly lacking context
- Don't ask obvious questions when context is clear
- Be autonomous when you have sufficient information
- Request guidance only for architectural decisions

## Core Principles

Do what has been asked; nothing more, nothing less.
- Je ne mets jamais de commentaire dans le code.
- parle sans emoji et sans comemntaires dans le code
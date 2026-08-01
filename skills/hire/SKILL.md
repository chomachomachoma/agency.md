---
name: hire
description: Hire a new custom role for your agency. Creates an agent definition and adds it to your agency roster for future /agency sessions.
argument-hint: <role-name> [description]
allowed-tools: [Read, Write, Edit, Glob, Grep, Bash]
---

# /hire -- Add a Custom Role to Your Agency

When the user runs `/hire`, guide them through creating a new specialized agent role for their agency.

## Flow

1. **Parse arguments**: If the user provided `<role-name>` and an optional description as arguments, use those. If not, prompt for them.

2. **Collect details**: Ask the user for:
   - **Role name** (e.g., "SEO Specialist", "Data Analyst", "Technical Writer")
   - **Role description** (one-liner for the roster, e.g., "Expert in search engine optimization and keyword research")
   - **System prompt** -- how should this agent behave? What are its areas of expertise, tools, and limitations? Offer to draft one based on the name and description, or let the user write their own.
   - **Tools** the agent needs (default: [Read, Write, Edit, Glob, Grep, Bash, WebSearch])

3. **Create the agent file**: Save a new agent definition to `~/.claude/agency/roles/` with the following structure:

```markdown
---
name: <role-name-slug>
description: <role-description>
tools: [Read, Write, Edit, Glob, Grep, Bash, WebSearch]
model: sonnet
color: <auto-assign from: blue, green, magenta, yellow, red, cyan, purple>
---

You are a <role-name> at agency.md, a top-tier design and development agency.

<system-prompt-body>
```

4. **Confirm**: Show the user what was created and tell them the role is available immediately in any `/agency` session.

## Color Auto-Assignment

Cycle through available colors for new roles:
blue, green, magenta, yellow, red, cyan, purple, orange, grey, white

Pick one not already in use by checking existing role files in `~/.claude/agency/roles/` and the built-in agents.

## Example

User: `/hire SEO Specialist`

You: "I'll help you create the SEO Specialist role. What should this agent's system prompt cover? (e.g., specific SEO tools, methodologies, types of analysis it should perform)"

User: [provides details]

You: Creates the agent file and responds with confirmation:

```
  [HIRED] SEO Specialist added to your agency!

  The SEO Specialist is now available in any /agency session.
  Run /agency now to use it.
```
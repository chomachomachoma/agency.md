# Agency.md — Development Context

## Project Structure

```
agency.md/
├── .claude-plugin/
│   └── plugin.json           # Plugin manifest for Claude Code
├── SKILL.md                   # Main skill (auto-loaded by Claude Code)
├── README.md                  # GitHub-facing docs
├── CLAUDE.md                  # This file
├── agency/
│   ├── config.yaml            # Default configuration
│   ├── agents/                # Subagent role definitions
│   │   ├── strategist.md
│   │   ├── ux-architect.md
│   │   ├── visual-designer.md
│   │   ├── frontend-developer.md
│   │   ├── backend-developer.md
│   │   ├── qa-engineer.md
│   │   ├── devops-engineer.md
│   │   └── project-manager.md
│   ├── commands/
│   │   └── agency.md          # The /agency slash command
│   └── templates/
│       ├── brief-template.md  # Discovery brief template
│       └── plan-template.md   # Project plan template
```

## Build & Test

### Validate the plugin
```bash
claude plugin validate .
```

### Install locally for testing
```bash
cp -r . ~/.claude/skills/agency.md
claude plugin enable agency.md@skills-dir
```

### Test the slash command
```bash
# Start Claude Code and run:
/agency help
```

## Standards

- All agent definitions use YAML frontmatter with name, description, model, and tools
- Agent tool access should be restricted to what they need (strategist needs web access, developers don't)
- Markdown files should be readable as standalone docs
- Templates should be comprehensive but leave room for the AI to fill in details
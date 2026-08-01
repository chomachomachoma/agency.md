# Agency.md — Development Context

## Project Structure

```
agency.md/
├── .claude-plugin/
│   └── plugin.json            # Plugin manifest for Claude Code
├── README.md                   # GitHub-facing docs and quick start
├── INSTALL.md                  # Installation instructions
├── CLAUDE.md                   # This file
├── agents/
│   ├── project-manager.md      # PM agent - orchestrator
│   ├── designer.md             # Designer agent
│   ├── developer.md            # Developer agent
│   ├── copywriter.md           # Copywriter agent
│   ├── marketing-director.md   # Marketing Director agent
│   ├── devops.md               # DevOps agent
│   └── qa.md                   # QA agent
├── skills/
│   ├── agency/
│   │   └── SKILL.md            # /agency slash command
│   ├── hire/
│   │   └── SKILL.md            # /hire slash command
│   └── fire/
│       └── SKILL.md            # /fire slash command
├── templates/
│   ├── agency.config.md        # Default role configuration template
│   └── custom-role-template.md # Template for creating custom roles
├── prompts/                    # Reserved for future phase templates
└── scripts/
    └── install.sh              # Installation script
```

## Build & Test

### Validate the plugin
```bash
claude plugin validate .
```

### Install locally for testing
```bash
./scripts/install.sh
# Or manually:
# cp -r . ~/.claude/skills/agency.md
# claude plugin enable agency.md@skills-dir
```

### Test the slash command
```bash
# Start Claude Code and run:
/agency help
/hire test-role
/fire test-role
```

## Standards

- All agent definitions use YAML frontmatter with name, description, model, and tools
- Agent tool access should be restricted to what they need
- Markdown files should be readable as standalone docs
- Slash commands use `argument-hint` and `allowed-tools` frontmatter for /help integration

## Key Concepts

- **Agency Splash**: a stylized banner showing assigned roles
- **Discovery**: PM-led Q&A to gather requirements
- **Planning**: agent coordination to produce a unified plan
- **Approval**: user reviews and approves the plan
- **Execution**: approved work dispatched in parallel
- **Custom Roles**: users can /hire and /fire their own agents
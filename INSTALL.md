## Install from GitHub

```bash
git clone https://github.com/nousresearch/agency.md ~/.claude/skills/agency.md
```

Or if you have the repo locally:

```bash
cd agency.md
./scripts/install.sh
```

## Manual Install

1. Clone or download this repo
2. Copy the entire contents to `~/.claude/skills/agency.md/`
3. Restart Claude Code or run `/reload-plugins`

## Verify Installation

In Claude Code, run:

```
/help
```

You should see `agency` listed in available slash commands. Or run:

```
/agency test
```

To see the agency splash screen and confirm it's loaded.

## What Gets Installed

| Path | Purpose |
|---|---|
| `~/.claude/skills/agency.md/` | Plugin root (skills, agents, config) |
| `~/.claude/agency/roles/` | Custom roles created with `/hire` |
| `./agency.config.md` | Per-project default role configuration |

## Requirements

- Claude Code CLI installed and authenticated
- No additional dependencies required

## Uninstall

```bash
rm -rf ~/.claude/skills/agency.md
rm -rf ~/.claude/agency  # optional (removes custom roles too)
```
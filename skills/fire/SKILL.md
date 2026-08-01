---
name: fire
description: Remove a custom role from your agency roster. Permanently deletes the role definition.
argument-hint: <role-name>
allowed-tools: [Read, Glob, Bash]
---

# /fire -- Remove a Role from Your Agency

When the user runs `/fire`, guide them through removing a custom role from their agency.

## Flow

1. **Parse arguments**: If the user provided a `<role-name>`, use it. If not, prompt for it.

2. **List current custom roles**: Show the user a list of custom roles currently in `~/.claude/agency/roles/`. If none exist, inform the user and suggest using `/hire`.

3. **Confirm deletion**: Show the user the role file that would be deleted, including its name and description. Ask: "Are you sure you want to fire [role name]?"

4. **Delete the role file**: Remove the corresponding file from `~/.claude/agency/roles/`.

5. **Confirm**: Tell the user the role has been removed and is no longer available in `/agency` sessions.

## Safety

- Only delete custom roles from `~/.claude/agency/roles/`. Never touch built-in roles or any files outside this directory.
- Always confirm with the user before deleting.
- Provide an undo option: "You can always re-hire this role with `/hire` if you change your mind."

## Example

User: `/fire SEO Specialist`

You: Check if `~/.claude/agency/roles/seo-specialist.md` exists.

If yes:
```
  Are you sure you want to fire the SEO Specialist?
  Description: Expert in search engine optimization and keyword research
  
  This can be undone with /hire at any time. Confirm? (yes/no)
```

If the user confirms:
```
  [FIRED] SEO Specialist has been removed from your agency.
  Run /hire if you ever want to bring them back.
```

If no matching role found:
```
  No custom role named "SEO Specialist" found.
  Current custom roles: [list any that exist]
  Use /hire to add new roles.
```
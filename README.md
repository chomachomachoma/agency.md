# Agency.md

An assortment of specialized agent roles for Claude Code, inspired by a high-level design and development agency. Invoke the agency to assemble a team of expert agents — strategists, designers, developers, and more — who collaborate on your task from discovery through delivery.

## What It Does

Agency.md transforms how you work with Claude Code by simulating a full-service agency team. Instead of having one agent do everything, you get a coordinated team of specialists who:

1. **Discover** — Ask clarifying questions from their domain expertise
2. **Plan** — Collaborate to create a comprehensive plan
3. **Execute** — Work in parallel and sequence to deliver results
4. **Review** — Ensure quality through dedicated QA

## Roles

| Role | Tag | Expertise |
|------|-----|-----------|
| Strategist | @strategist | Requirements discovery, market analysis, strategy |
| UX Architect | @ux-architect | Information architecture, user flows, interaction design |
| Visual Designer | @visual-designer | Visual design, UI components, brand systems |
| Frontend Developer | @frontend-developer | Frontend implementation, responsive UI, accessibility |
| Backend Developer | @backend-developer | APIs, databases, business logic, auth |
| QA Engineer | @qa-engineer | Testing, bug detection, quality validation |
| DevOps Engineer | @devops-engineer | Deployment, CI/CD, infrastructure, monitoring |
| Project Manager | @project-manager | Coordination, planning, tracking, delivery |

## Installation

### Via Claude Code (recommended)

```bash
claude plugin install agency.md@chomachomachoma/agency.md
```

### Manual Installation

```bash
# Clone the repo
git clone https://github.com/chomachomachoma/agency.md.git ~/.claude/skills/agency.md

# Or copy it manually
cp -r . ~/.claude/skills/agency.md
```

Then restart Claude Code or run `/reload-plugins`.

## Usage

In any Claude Code session, invoke the agency:

```
/agency I need to build a landing page for my new SaaS product
```

or use natural language:

```
Call in the team, I need to redesign our dashboard
```

The agency will:

1. Show a splash screen with your default team and task
2. Ask if you want to add any other roles
3. Conduct a discovery dialog with all agents asking questions
4. Coordinate to create a plan
5. Present the plan for your approval
6. Execute phase by phase with reporting at each milestone

## Configuration

To customize which roles are included by default, create `~/.claude/agency/config.yaml`:

```yaml
default_roles:
  strategist: true
  ux_architect: true
  visual_designer: true
  frontend_developer: true
  backend_developer: true
  qa_engineer: true
  devops_engineer: true
  project_manager: true

ask_for_additional_roles: true
show_splash: true
```

Set any role to `false` to exclude it from the default team. You can still add it per-task when the agency asks.

## How It Works

1. **/agency command** — You invoke the agency with your task description
2. **Team assembly** — Default roles are loaded; you can customize the team
3. **Discovery** — Each agent asks domain-specific questions
4. **Brief creation** — The Strategist synthesizes findings into a brief
5. **Collaborative planning** — Agents work together to create a coordinated plan
6. **Client review** — You approve, revise, or cancel the plan
7. **Execution** — Agents execute their phases, reporting progress
8. **Delivery** — Project Manager presents the final deliverables

## Why Agency.md?

- **Deep specialization** — Each agent has domain-specific expertise
- **Structured process** — From discovery to delivery, nothing is missed
- **Cross-team coordination** — Handoffs happen naturally between agents
- **Quality gates** — Dedicated QA ensures quality before delivery
- **Flexible team composition** — Add or remove roles per-project

## License

MIT
# /agency — Assemble Your Agency Team

Assembles a team of specialized agents from Agency.md to work on your task collaboratively from discovery through delivery.

## Usage

```
/agency <your task description>
```

## Workflow

### Step 1: Agency Briefing

Display the agency splash screen showing the default team roles and your task. Ask if the user wants to add any additional roles.

### Step 2: Role Customization

Let the user add or remove roles for this specific job. Available roles:
- @strategist — Requirements discovery & strategy
- @ux-architect — Information architecture & user flows
- @visual-designer — Visual design & UI components
- @frontend-developer — Frontend implementation
- @backend-developer — Backend & API implementation
- @qa-engineer — Testing & quality assurance
- @devops-engineer — Deployment & infrastructure
- @project-manager — Coordination & delivery tracking

### Step 3: Discovery Phase

Lead a discovery dialog where each agent on the team asks clarifying questions:
- Strategist asks about goals, success criteria, stakeholders, constraints
- UX Architect asks about users, journeys, platforms, accessibility needs
- Visual Designer asks about brand, style preferences, design references
- Frontend Developer asks about tech stack, responsive targets, frameworks
- Backend Developer asks about data models, APIs, storage, auth needs
- QA Engineer asks about testing strategy, quality thresholds
- DevOps Engineer asks about hosting, CI/CD, monitoring
- Project Manager asks about timeline, budget, communication preferences

Collect all answers into `.agency/brief.md`.

### Step 4: Team Planning

Each agent reviews the brief and contributes their domain plan. The Project Manager compiles a coordinated plan with phases, dependencies, and timelines. Write to `.agency/plan.md`.

### Step 5: Approval

Present the plan for user approval. Support three responses: approve, revise (with feedback), or cancel.

### Step 6: Execution

On approval, execute the plan phase by phase using @agent-name delegation. Each agent completes their tasks before handing off to the next dependent agent. Report progress after each major milestone.

## Configuration

User preferences for default roles can be set in `.agency/config.yaml` at the project root or global at `~/.claude/agency/config.yaml`.
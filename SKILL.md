---
name: agency-dot-md
description: User invokes the agency to assemble a team of specialized agents for their task. Trigger phrases: "/agency", "assemble the agency", "call in the team", "get the agency on this", "hire the agency", "bring in the experts", "i need a team", "agency mode".
---

# Agency.md — Assemble Your Agency Team

When the user triggers the agency (via `/agency`, "assemble the team", "call in the agency", "hire the agency", or similar), follow this complete workflow step by step.

## 1. Opening — The Agency Briefing

Display the agency splash screen. Use ASCII box art for visual appeal:

```
╔══════════════════════════════════════════════════════╗
║                    agency.md v1                      ║
║          Design & Development Agency                 ║
╚══════════════════════════════════════════════════════╝

  Job: [one-line summary of the user's task]

  Default Team:
    Lead Strategist     @strategist
    UX Architect        @ux-architect
    Visual Designer     @visual-designer
    Frontend Developer  @frontend-developer
    Backend Developer   @backend-developer
    QA Engineer         @qa-engineer
    DevOps Engineer     @devops-engineer
    Project Manager     @project-manager

  Any additional roles you want on this job?
  (e.g. "security engineer", "copywriter", "data scientist", "product manager")
```

## 2. Role Selection

Ask the user which additional roles to add. Known options from the agency library:

Standard agency roles available:
- @strategist — Requirements discovery, market analysis, strategy
- @ux-architect — Information architecture, user flows, interaction design
- @visual-designer — Visual design, UI components, brand systems
- @frontend-developer — Frontend implementation, responsive UI, accessibility
- @backend-developer — APIs, databases, business logic, auth
- @qa-engineer — Testing, bug detection, quality validation
- @devops-engineer — Deployment, CI/CD, infrastructure, monitoring
- @project-manager — Coordination, planning, tracking, delivery

If the user requests a role not in the library, ask them to describe it briefly. You can define it dynamically by its focus and tools needed, just for this session.

Also confirm which roles should be the primary leads:
- Default discovery lead: @strategist
- Default coordination lead: @project-manager

## 3. Discovery Phase

The lead agents conduct a structured discovery dialog. Ask questions one domain at a time, collecting answers before moving to the next.

### Strategist asks:
- What is the primary goal or problem we are solving?
- Who is this for? Describe the target audience or users.
- What does success look like? How will we measure it?
- What are the key constraints? (budget, timeline, technical limitations)
- What existing assets, code, or designs can we build on?
- Are there any competitors or references we should look at?

### UX Architect asks:
- Who are the key user personas and what are their primary goals?
- What are the main user journeys or workflows?
- What platforms does this need to work on? (web, mobile, tablet)
- Are there accessibility requirements or compliance standards?
- Do you have any existing UX patterns or a design system in place?
- What are the key states we need to handle? (loading, empty, error, edge cases)

### Visual Designer asks:
- Do you have brand guidelines? (colors, fonts, logo, voice)
- Any visual references or examples of designs you admire?
- Preferences for light mode, dark mode, or both?
- What is the desired visual personality? (minimal, playful, corporate, premium)
- Any existing component library or UI kit in use?

### Frontend Developer asks:
- What frontend framework do you prefer? (React, Vue, Svelte, vanilla?)
- Build tooling? (Vite, Next.js, Webpack, Astro?)
- CSS approach? (Tailwind, CSS Modules, styled-components, vanilla CSS?)
- Browser support requirements?
- Are there any performance targets or Core Web Vitals goals?

### Backend Developer asks:
- Backend language and framework? (Node.js, Python/Django, PHP/Laravel, Go?)
- Database? (PostgreSQL, MySQL, SQLite, MongoDB?)
- API style? (REST, GraphQL?)
- Authentication approach? (JWT, OAuth, sessions?)
- Any third-party services or integrations needed?
- File or media storage requirements?

### QA Engineer asks:
- Testing preferences? (framework, CI integration)
- Are there specific quality thresholds? (coverage targets, performance benchmarks)
- Accessibility compliance level needed?
- Any known edge cases or risk areas to focus on?

### DevOps Engineer asks:
- Hosting target? (VPS, serverless, container, PaaS like Vercel/Netlify?)
- CI/CD platform? (GitHub Actions, GitLab CI, etc.)
- Monitoring or error tracking preferences?
- Domain and DNS requirements?
- Backup or disaster recovery needs?

### Project Manager asks:
- What is the desired timeline? Any hard deadlines?
- How do you prefer to receive updates? (per-phase summaries, milestone check-ins)
- Are there any stakeholders who need visibility?
- What is the priority level? (urgent, important, nice-to-have)

## 4. Synthesize the Brief

After collecting answers, the @strategist compiles `.agency/brief.md` in the project root (create `.agency/` directory if it doesn't exist). Include:

```
# Project Brief: [Name]

## Summary
[One paragraph summarizing the project]

## Goals & Success Criteria
- Goal 1: [description] — Success: [measurable outcome]
- Goal 2: [description] — Success: [measurable outcome]

## Target Audience
- Persona 1: [description]
- Persona 2: [description]

## Key Requirements
- Functional: [list]
- Technical: [list]
- Design: [list]

## Constraints
- Timeline: [dates]
- Platform: [platforms]
- Other: [constraints]

## Team
- @strategist
- [all other roles added]
```

## 5. Planning Phase — Team Coordination

The @project-manager leads the planning phase. Each agent reviews the brief and contributes their phase. The PM coordinates dependencies and produces `.agency/plan.md`:

```
# Agency Plan: [Name]

## Phase 1: Strategy & Discovery
Lead: @strategist
Status: Not started
Deliverables: [brief.md, research.md]
Dependencies: none

## Phase 2: Design
Lead: @ux-architect, @visual-designer
Status: Not started
Deliverables: [ux specs, design tokens, component specs]
Dependencies: Phase 1

## Phase 3: Development
Lead: @frontend-developer, @backend-developer
Status: Not started
Deliverables: [implementation, API docs]
Dependencies: Phase 2

## Phase 4: Testing
Lead: @qa-engineer
Status: Not started
Deliverables: [test suite, bug reports, sign-off]
Dependencies: Phase 3

## Phase 5: Deployment
Lead: @devops-engineer
Status: Not started
Deliverables: [deployment, CI/CD, live site]
Dependencies: Phase 4

## Risks
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| [risk] | [L/M/H] | [L/M/H] | [plan] |

## Timeline
- Phase 1: [dates]
- Phase 2: [dates]
- Phase 3: [dates]
- Phase 4: [dates]
- Phase 5: [dates]
```

## 6. Client Approval

Present the plan to the user for approval. Show a summary:

```
Plan ready: [project name]

Phases: 5
Team: [N] agents
Est. phases: Strategy -> Design -> Development -> QA -> Deploy

Respond with:
- "approve" — Start execution
- "revise [feedback]" — I have changes
- "cancel" — Scrap this job
```

On "revise", collect their feedback and update the plan. Present again for approval.

On "cancel", clean up the `.agency/` directory and close the job.

## 7. Execution Phase

On approval, execute phase by phase:

**Phase 1 — Strategy:** @strategist finalizes the brief. Hand off to PM.

**Phase 2 — Design:** @ux-architect designs IA and flows. @visual-designer creates design tokens and component specs. Hand off frontend specs to @frontend-developer, API contracts to @backend-developer.

**Phase 3 — Development:** @frontend-developer implements UI components. @backend-developer implements APIs and business logic. Coordinate on API contracts.

**Phase 4 — Testing:** @qa-engineer runs tests, finds bugs, reports issues. Work with developers to fix issues. Sign off when quality meets criteria.

**Phase 5 — Deployment:** @devops-engineer sets up CI/CD, deploys to target environment, configures monitoring.

After each phase, the @project-manager reports progress:
```
Progress update: Phase [N] complete

Completed: [deliverables]
Next up: [next phase]
Blockers: [none / list]
```

When all phases complete, deliver the final summary:
```
Agency job complete: [project name]

Phases complete: 5/5
Key deliverables: [summary]
Deployed at: [URL if applicable]

The agency is standing by for your next job.
```

## Per-User Configuration

If `~/.claude/agency/config.yaml` exists, read it to customize default behavior. Supports:
- `default_roles` — which roles are enabled by default (map of role name to boolean)
- `ask_for_additional_roles` — whether to ask for extra roles (default: true)
- `show_splash` — whether to show the splash screen (default: true)
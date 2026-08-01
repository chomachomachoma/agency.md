---
name: agency.md
description: User invokes the agency to assemble a team of specialized agents for their task. Trigger phrases: "/agency", "assemble the agency", "call in the team", "get the agency on this", "hire the agency", "bring in the experts".
---

# agency.md — Assemble Your Agency Team

When the user invokes the agency (via `/agency` or natural language like "call in the team" or "get the agency on this"), follow this workflow:

## 1. Opening — The Agency Briefing

Display a stylized agency splash screen:

```
╔══════════════════════════════════════════════════════╗
║                     AGENCY.MD                        ║
║          Design & Development Agency                 ║
╚══════════════════════════════════════════════════════╝

  📋 YOUR JOB: <user's prompt summary>

  👥 DEFAULT TEAM:
     🎯  Strategist      — Requirements discovery & strategy
     🎨  UX Architect    — Information architecture & flows
     🖌️  Visual Designer — Visual design & UI components
     ⚙️  Frontend Dev    — Frontend implementation
     🔧  Backend Dev     — Backend & API implementation
     🧪  QA Engineer     — Testing & quality assurance
     🚀  DevOps Engineer — Deployment & infrastructure
     📋  Project Manager — Coordination & delivery

  ➕ Any other roles you want on this job?
     (e.g., "security engineer", "copywriter", "data scientist")
```

## 2. Role Selection

Ask the user if they want to add any additional roles. If they name a role, check if an agent definition exists in the agency's agent library. If not, offer to create a custom one based on their description.

Roles defined in the agency:
- Strategist (@strategist)
- UX Architect (@ux-architect)
- Visual Designer (@visual-designer)
- Frontend Developer (@frontend-developer)
- Backend Developer (@backend-developer)
- QA Engineer (@qa-engineer)
- DevOps Engineer (@devops-engineer)
- Project Manager (@project-manager)

Also ask which roles should be the primary leads for this job. Default leads: Strategist (discovery), Project Manager (coordination).

## 3. Discovery Phase

Activate the Strategist and other leads. They conduct a discovery dialog with the user:

- Each agent on the team asks clarifying questions relevant to their domain
- The Strategist synthesizes these into a comprehensive project brief
- Ask about: goals, audience, constraints, timeline, existing assets, success criteria

Collect answers and write a project brief at `.agency/brief.md` (create `.agency/` dir if needed).

## 4. Planning Phase — Agents Coordinate

All agents on the team review the brief and collaborate to produce a plan. The Project Manager coordinates:

1. Each agent contributes their domain-specific requirements
2. Agents flag dependencies between their workstreams
3. The Project Manager compiles the plan
4. Write the plan to `.agency/plan.md`

## 5. Client Approval

Present the plan to the user for approval:

```
📋 PLAN SUMMARY:
   Phase 1: Discovery & Research (Strategist)
   Phase 2: Design (UX Architect + Visual Designer)
   Phase 3: Development (Frontend + Backend)
   Phase 4: QA & Polish (QA Engineer)
   Phase 5: Deployment (DevOps Engineer)

  ✅ Approve and start execution
  🔄 Request revisions (provide feedback)
  ❌ Cancel the job
```

## 6. Execution Phase

On approval, delegate work to the appropriate agents using @agent-name syntax. The Project Manager tracks progress:

1. **Strategist** finalizes requirements and shares with the team
2. **UX Architect** designs flows and hands off to Visual Designer
3. **Visual Designer** creates designs and hands off to developers
4. **Frontend/Backend Developers** implement in parallel where possible
5. **QA Engineer** tests the implementation
6. **DevOps Engineer** handles deployment

Each agent's work should be done in logical sequence, respecting dependencies. Use `@agent-name` to delegate specific tasks to each subagent.

After each major phase, report progress to the user.
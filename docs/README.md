# D-Auto Club Project Documents

This is the main documentation hub for the D-Auto Club project. Project-wide documents live here, while the workflow task and its original source material remain together in the active task folder.

## Start Here

| Document | Purpose | Update When |
|---|---|---|
| [`../workflow/tasks/20260716T1434_understand-car-platform-plan/task.md`](../workflow/tasks/20260716T1434_understand-car-platform-plan/task.md) | User-owned workflow task and source of truth | Only when the user explicitly requests it |
| [`../workflow/tasks/20260716T1434_understand-car-platform-plan/implementation-plan.md`](../workflow/tasks/20260716T1434_understand-car-platform-plan/implementation-plan.md) | Backend milestones, architecture, testing, and progress | Scope, architecture, delivery, or progress changes |
| [`project-overview.md`](project-overview.md) | Stable business, actor, scope, and priority summary | Confirmed product scope changes |
| [`clarification-register.md`](clarification-register.md) | Open questions, decisions, owners, and status | A question is raised, answered, or superseded |
| [`timeframe.md`](timeframe.md) | Six-month schedule, delivery gates, staffing assumptions, and schedule controls | Dates, scope, staffing, dependencies, or milestone forecasts change |
| [`presentation/index.html`](presentation/index.html) | Meeting slide deck covering scope, architecture, estimates, risks, and decisions | Presentation scope or project assumptions change |
| [`presentation/delivery-timeframe.html`](presentation/delivery-timeframe.html) | Detailed milestone, sprint, ownership, QA, and delivery timetable | Dates, tasks, staffing, or release gates change |
| [`progress-tracker.html`](progress-tracker.html) | Interactive milestone/task checklist with live progress statistics for the agreed 2+2+2 month delivery (Seller App → Buyer App → UAT) | A task is completed, or milestones/tasks are added or rescoped |
| [`progress-tracker-data.json`](progress-tracker-data.json) | Canonical checklist definition (phases, milestones, tasks, teams) used by the progress tracker; the tracker embeds an identical copy for offline double-click use | Milestones or tasks are added, removed, or rescoped (run `sync-tracker.bat` after changing it) |
| [`sync-tracker.bat`](sync-tracker.bat) / [`sync-tracker.ps1`](sync-tracker.ps1) | One-click sync: after "Download data" in the tracker, copies the downloaded JSON over `progress-tracker-data.json` and re-injects the tracker's embedded copy | Never edited by hand; run it after each Download data |
| [`generate-thumbnails.bat`](generate-thumbnails.bat) / [`generate-thumbnails.ps1`](generate-thumbnails.ps1) | Renders small JPEG previews of every gallery image into `gallery-thumbs/`; the tracker's Figma gallery grid loads these instead of the full-size boards | Images are added to the gallery section of the data file (use `-Force` to rebuild all) |

## Original References

- [`../workflow/tasks/20260716T1434_understand-car-platform-plan/supporting-materials/car_platform_backend_plan.md`](../workflow/tasks/20260716T1434_understand-car-platform-plan/supporting-materials/car_platform_backend_plan.md) — original six-month backend plan, API inventory, and database suggestions.
- [`../workflow/tasks/20260716T1434_understand-car-platform-plan/supporting-materials/D-Auto Club/info.txt`](../workflow/tasks/20260716T1434_understand-car-platform-plan/supporting-materials/D-Auto%20Club/info.txt) — seller-type meeting notes.
- [`../workflow/tasks/20260716T1434_understand-car-platform-plan/supporting-materials/D-Auto Club/`](../workflow/tasks/20260716T1434_understand-car-platform-plan/supporting-materials/D-Auto%20Club/) — original product-flow images and archive.

## Document Rules

- Treat `task.md` as user-owned; do not edit it without explicit instruction.
- Record unresolved matters in the clarification register, not as confirmed scope.
- Record the final answer and decision date in the same clarification row.
- Keep one execution roadmap in the workflow task's `implementation-plan.md`.
- Link to original references rather than copying them.
- Update progress checkboxes only when the corresponding result is complete and verifiable.

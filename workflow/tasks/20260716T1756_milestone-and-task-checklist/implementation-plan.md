# Implementation Plan: Milestone and Task Checklist

## Summary

Create an interactive HTML progress-tracking page containing the detailed milestone and task checklist for the D-Auto Club delivery, aligned to the agreed sequential timeframe: Months 1–2 Seller App, Months 3–4 Buyer App, Months 5–6 UAT and launch. Both frontend and backend follow the same phasing. The page is the shared checklist presented to management, the design team, the frontend team, and the backend team.

Confirmed inputs from the user:

- The 2 + 2 + 2 month phasing applies to both frontend and backend.
- All Figma UI design is complete for both apps. Design work IS shown in the checklist, fully pre-checked, so management can see the design team's contribution; new design tasks can be added later if scope changes.
- Design progress is tracked separately from the overall delivery progress: the design team carries `"separate": true` in the data, so its tasks are excluded from the overall percentage and the phase tiles, and appear in their own "Design progress · tracked separately" block on the dashboard.
- The frontend team has already built a demo app covering seller login and registration, profile edit, business account setup, and the app layout structure. These appear in the tracker as pre-checked baseline tasks (the earlier "50%" phrasing was dropped as confusing).
- The "Shared frontend platform" milestone was removed at the PM's request; its infra tasks (build pipelines) moved into the platform & backend foundation milestone.
- Frontend tasks are split by module using the Figma file names (Splash Screen + Login Page, Seller Profile, Spare-Part Profile, and so on) so every team recognises the work at a glance.
- Every task carries a per-team number (DS-01, FE-01, BE-01, PM-01, IF-01, …); there is no combined "All" list — teams are selected from a side menu, and the Overview page carries the cross-team summary.
- Tasks can be added, edited, and deleted from the page itself (Edit mode); changes persist locally, travel with progress exports, and can be made permanent via the Download data button.
- Target release date agreed: 20 December 2026, shown in the header and dashboard with a live days-left counter.
- The checklist audience is everyone: management, design, frontend, and backend.
- The controlled-scope (locked MVP) assumption from earlier analysis is accepted.
- The minimal admin dashboard is included inside the plan.
- Every checked task must increase a visible progress figure so stakeholders can see status at a glance.

Scope sources: the backend implementation plan in `20260716T1434_understand-car-platform-plan`, the Seller App and User App screen inventory in `20260716T1615_understand-figma`, and the confirmed assumptions from the meeting-presentation task (3 frontend + 3 backend developers, separate apps, escrow payment links via chat, seller-managed logistics, PM-led UAT, infrastructure-team deployment support).

## Goals

- One self-contained HTML page that opens offline in any modern browser.
- Full milestone/task breakdown for design, frontend, backend, PM, and infrastructure work across the three phases.
- Interactive checkboxes: checking a task updates overall, per-phase, per-milestone, and per-team progress instantly.
- Progress persists locally (browser storage) with export/import so state can be shared between machines.
- Management-friendly summary at the top: overall percentage, phase progress, team progress, task counts.
- Print/PDF friendly for meeting handouts.

## Architecture

- Single file: `docs/progress-tracker.html` with embedded CSS and JavaScript; no build step, CDN, or network dependency.
- Checklist defined as structured JSON (phases → milestones → tasks with team tags) in `docs/progress-tracker-data.json`, the canonical data file. The page fetches it when served over HTTP; because browsers block `fetch()` on `file://`, the HTML also carries an identical embedded JSON copy so double-clicking the file still works. Both copies must be kept in sync when tasks change.
- Frontend tasks are named after the Figma modules. A task may carry `"done": true` in the JSON — the project baseline for work completed before the tracker existed (the demo app). Baseline tasks render pre-checked and count toward all progress figures; an individual browser can still override them, and Reset returns to the baseline rather than zero.
- Task completion state stored in `localStorage` keyed by stable task IDs; export/import as a JSON file for sharing; reset with confirmation.
- Filters: by team, and a hide-completed toggle; milestones collapsible.
- Light/dark theme support and a print stylesheet.
- Visual language consistent with the existing presentation (black/white/red accents) with a validated single-hue progress ramp for meters.

### Phasing Model

| Phase | Months | Focus |
|---|---|---|
| Phase 1 | 15 Jul – 8 Sep 2026 | Seller App: platform & backend foundation, seller modules and APIs. Gate: seller internal beta. |
| Phase 2 | 9 Sep – 3 Nov 2026 | Buyer App: buyer modules and APIs, minimal admin. Gate: buyer internal beta with full buyer↔seller journey. |
| Phase 3 | 4 Nov – 18 Dec 2026 | UAT: integration and regression, security and performance, PM-led UAT rounds, launch preparation and release by 20 Dec 2026. |

The 20 December target compresses the original six-month plan by roughly one month: the two build phases keep their full two months each, and the compression lands on Phase 3, which shrinks from eight weeks to six. This is achievable only if both gates pass on time and the MVP scope stays locked; if Gate 1 or Gate 2 slips by more than a week, the target date should be re-confirmed with management.

## Implementation Steps

## Milestone 1 - Build the Checklist Data Model

### Goal

Translate the agreed scope into a complete, team-tagged task list per phase.

### Tasks

- [x] Break Phase 1 (Seller App) into milestones and module tasks for frontend, backend, PM, and infra.
- [x] Break Phase 2 (Buyer App + minimal admin) into milestones and module tasks.
- [x] Break Phase 3 (UAT and launch) into milestones and tasks.
- [x] Tag every task with a team and give it a stable ID for progress storage.
- [x] Name frontend tasks after the Figma modules and mark the demo-app work as pre-checked baseline.

### Exit Criteria

Every supplied Figma screen and every backend domain from the prior plan maps to at least one task; each milestone has an exit criterion.

### Implemented In

- docs/progress-tracker-data.json
- docs/progress-tracker.html

## Milestone 2 - Build the Interactive Tracking Page

### Goal

Deliver the self-contained HTML page with live progress statistics.

### Tasks

- [x] Render phases, milestones, and tasks from the data model with checkboxes.
- [x] Compute and display overall, per-phase, per-milestone, and per-team progress.
- [x] Persist state to localStorage; add export, import, and reset controls.
- [x] Add team filter and hide-completed toggle.
- [x] Add light/dark theme and print styles.

### Exit Criteria

Opening the file locally, checking tasks updates all progress figures immediately, and state survives a browser refresh.

### Implemented In

- docs/progress-tracker.html

## Milestone 3 - Verify and Publish

### Goal

Confirm the page is reliable and discoverable.

### Tasks

- [x] Verify rendering, interaction, persistence, and print output in a browser.
- [x] Validate the progress-meter palette in light and dark modes.
- [x] Add the tracker to the docs index (`docs/README.md`).

### Exit Criteria

The page works offline with no console errors, and the docs index links to it.

### Implemented In

- docs/progress-tracker.html
- docs/README.md

## Testing

- Open `docs/progress-tracker.html` directly from the filesystem; verify no console errors.
- Check tasks and confirm overall, phase, milestone, and team progress update together.
- Refresh the browser and confirm checked state is restored.
- Export state, reset, and re-import; confirm the state round-trips.
- Verify team filtering and hide-completed behaviour.
- Verify print preview produces a readable handout with progress summary and full checklist.
- Verify light and dark rendering and colour contrast on progress meters.

## Progress

- [x] Read the task, referenced tasks, and confirmed clarification answers.
- [x] Write this implementation plan.
- [x] Build the checklist data model.
- [x] Build and verify the interactive tracking page.
- [x] Update the docs index.
- [x] Move the checklist definition into `docs/progress-tracker-data.json` with an embedded fallback copy.
- [x] Rework the checklist per PM corrections: design work removed (Figma complete), Figma-module task names, and demo-app work pre-checked as the progress baseline.
- [x] Second rework per PM: design work restored as fully-checked contribution, shared-frontend-platform milestone removed, per-team task numbering, side-menu team navigation (no "All" list), in-page add/edit/delete of tasks, and the 20 Dec 2026 target date with schedule dates per phase.
- [x] Separate design progress from the overall delivery progress on the dashboard.
- [x] Replace the working-assumptions text with team-size stat tiles (3 frontend + 3 backend, driven by `size` in the data).
- [x] Record PM status updates as completed baseline tasks: React Native Expo workspace setup (FE), Google Play / App Store account setup (FE), English + Chinese languages confirmed (PM), and store listing materials designed and handed to frontend (Design).
- [x] Simplify the header (brand-only red, subtitle removed) and move page actions into grouped side-menu tools; Edit tasks and Print/PDF buttons removed.
- [x] Add `docs/sync-tracker.ps1` + `sync-tracker.bat`: one-click sync of a downloaded data file into the repo JSON and the tracker's embedded copy (tested on a scratch copy and on the real files). Shared-storage backend (Laravel or Node + SQLite) deferred until the PM decides the runtime.

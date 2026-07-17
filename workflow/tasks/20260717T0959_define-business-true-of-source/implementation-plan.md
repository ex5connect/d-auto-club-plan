# Implementation Plan: Define Business Source of Truth

## Summary

Create a standalone HTML page that names the design team as the business source of truth, frames the PM as a humble supporting role, and closes with a motivational section for every team member. The page is presented in a team meeting, so it is styled like a slide deck: one near-fullscreen card per section with scroll snapping and large presentation-size text.

## Goals

- Credit the design team as the owner of the app UI and the business flow, without making it sound like they hold power over other teams.
- Define the PM as the glue: supports, keeps the timeline on track, provides resources, advises but never overrides.
- End with a short pep-talk section addressed to every team member (not split by team).
- Keep everything as short bullet points; casual but professional pure English (no Malay mixing), no em dashes.
- Match the existing docs visual style (progress tracker palette, dark/light theme, team colors).

## Architecture

- `docs/source-of-truth.html` — single self-contained page, no external assets.
  - Same CSS variable palette as `docs/progress-tracker.html` (light/dark via `prefers-color-scheme` plus `data-theme` toggle button).
  - Slide-deck layout: each `section.card` is ~78vh with vertically centered content and `scroll-snap-align`; print styles collapse cards back to compact blocks for PDF export.
  - Sections: hero title → Design Team (Business Source of Truth, pink accent) → PM (Supporting Role, purple accent) → Every Team pep talk (brand red) → closer banner.
- `docs/README.md` — one table row linking the page in the docs hub.
- `docs/progress-tracker.html` — "Source of Truth & Team Roles" link button in the header (`a.btn` style added to match existing buttons).

## Implementation Steps

### Milestone 1 - Source of Truth page

#### Goal

A meeting-ready page defining roles and the source of truth.

#### Tasks

- [x] Create `docs/source-of-truth.html` matching the tracker's design language
- [x] Design Team section with callout: technical teams (frontend/backend) check with design first when design and docs don't match
- [x] PM section with humble supporting-role bullets
- [x] Every Team section as one shared list (not per-team cards)
- [x] Closer banner: "Give it your best. Make it shine, make yourself proud."
- [x] Link the page from `docs/README.md`
- [x] Add a header button in `docs/progress-tracker.html` linking to the page

#### Exit Criteria

Page opens by double-click, reads as a slide deck, and is linked from the docs hub and progress tracker.

#### Implemented In

- docs/source-of-truth.html
- docs/README.md
- docs/progress-tracker.html

## Testing

- Open `docs/source-of-truth.html` directly in a browser: sections snap like slides, theme toggle switches light/dark.
- Click the "Source of Truth & Team Roles" button in `docs/progress-tracker.html` and confirm it opens the page (relative link, works from the filesystem).
- Print preview: cards collapse to compact blocks, no fullscreen gaps.

## Progress

- 2026-07-17: Page created, styled as slide deck, linked from docs README and progress tracker. Copy iterated with the user: "Source of Truth" wording (not "Truth of Source"), softened design-team authority language, removed em dashes, casual pure-English tone (Malay mixing tried then removed), per-team cards merged into one shared pep-talk list, hero kicker removed, PM docs-sync bullet removed. Task complete.

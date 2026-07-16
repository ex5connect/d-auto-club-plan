# Implementation Plan: D-Auto Club Meeting Presentation

## Summary

Create a self-contained HTML presentation for the July 17, 2026 project meeting. The presentation will explain the D-Auto Club User App and Seller App scope, confirmed decisions, unresolved questions, detailed React Native and Laravel work, quality strategy, staffing, delivery scenarios, and whether the requested six-month target is credible.

The presentation must distinguish confirmed facts from recommendations and open decisions. It will use the latest task assumptions: two separate React Native apps, one Laravel backend, three frontend and three backend developers available from Month 1, third-party escrow payment links sent through chat, seller-managed logistics, PM-led UAT, and infrastructure-team deployment support.

Planned output:

- `supporting-materials/presentation/index.html`

## Goals

- Give management a clear, nontechnical summary of the product and its commercial flows.
- Show the complete frontend and backend work required by the supplied screens.
- Present known questions and answers without implying that open matters are decided.
- Explain the quality-assurance workload and the risk created by having no dedicated QA role.
- Provide a defensible timeframe rather than presenting six months as an unconditional commitment.
- Identify the minimum decisions required at the meeting to protect the schedule.
- Produce an offline-friendly presentation that can also be printed or exported to PDF.

## Architecture

### Presentation Format

- One standalone HTML file with embedded CSS and lightweight JavaScript.
- No package installation, build step, CDN, remote font, or network dependency.
- 16:9 slide layout with responsive fallback for smaller screens.
- Keyboard, button, touch/swipe, and slide-index navigation.
- Print styles that place one slide per page for PDF export.
- High-contrast D-Auto Club visual language based on black, white, red, and restrained status colours.
- Selected Figma exports referenced from the task's `supporting-materials` folders rather than duplicated.
- Speaker-friendly content with short slides, readable tables, and optional detail panels/appendix.
- Accessible semantic structure, focus states, reduced-motion support, and useful image alternative text.

### Content Model

Each statement will be classified as one of:

- Confirmed: explicitly supplied by the PM or visible in the reference screens.
- Proposed: recommended architecture, process, admin scope, or delivery approach.
- Open: requires a meeting decision before estimation or implementation is reliable.

The timeframe will show three scenarios:

1. Six-month controlled release: achievable only with locked MVP scope, shared React Native packages, stable APIs, managed services, and protected hardening time.
2. Full visible scope at production quality: estimated at approximately eight to ten months with the current six-person engineering team and no dedicated QA.
3. Six-month full-scope attempt: high risk unless management adds QA/admin capacity, resolves P0 decisions immediately, and accepts reduced contingency.

### Planned Slide Structure

1. Title, meeting date, and purpose.
2. Executive summary and recommendation.
3. Product landscape: User App, Seller App, Laravel platform, and future admin dashboard.
4. Confirmed Q&A and working assumptions.
5. User App scope map.
6. Seller App scope map.
7. Shared end-to-end buyer/seller journey.
8. Escrow link, chat, order, and seller-managed logistics flow.
9. Proposed system architecture and shared dependencies.
10. Frontend workstream: shared React Native platform.
11. Frontend workstream: User App details.
12. Frontend workstream: Seller App details.
13. Backend workstream: foundation, identity, sellers, vehicles, and catalogue.
14. Backend workstream: chat, escrow, orders, tracking, moderation, and operations.
15. Proposed minimum admin dashboard.
16. Quality-assurance strategy and test ownership.
17. Team allocation and parallel workstreams.
18. Six-month milestone view.
19. Estimate scenarios and feasibility verdict.
20. Critical dependencies and schedule risks.
21. Questions/decisions required from the meeting.
22. Recommended next steps and decision summary.
23. Appendix: screen inventory, detailed work breakdown, and estimation assumptions.

## Detailed Work to Present

### Frontend - Shared React Native Platform

- Establish a monorepo or equivalent shared-package structure for two separate application bundles.
- Create design tokens, reusable components, forms, validation, media handling, localization, API client, error handling, analytics, and feature flags.
- Implement Apple, Google, Facebook, and WeChat authentication as approved.
- Implement secure token storage, environment configuration, deep links, push notifications, and release pipelines.
- Support English and Chinese content if confirmed for launch.
- Add unit, component, navigation, integration, accessibility, and end-to-end tests.
- Prepare iOS and Android store builds, signing, privacy declarations, and release monitoring.

### Frontend - User App

- Authentication, onboarding, profile, addresses, settings, and account states.
- My Cars and brand/series/variant/year selection.
- Spare-parts and accessories categories, listings, details, compatibility, search, filters, favourites, reviews, and reports.
- Used-car, car-plate, workshop, EV charging, and community experiences.
- Seller storefront and buyer-seller chat.
- Product/order cards, approved escrow payment links, and payment-status presentation.
- Orders, cancellations, refunds, returns, shipment tracking, notifications, and history.
- Loading, empty, validation, permission, offline, error, expired-link, and retry states missing from static exports.

### Frontend - Seller App

- Authentication, seller onboarding, seller types, verification, store selection, and profiles.
- Product/listing CRUD for allowed spare parts, accessories, vehicles, and car plates.
- Category/attribute selection, vehicle compatibility, images, prices, stock, publication, and moderation status.
- Address and China/Malaysia regional location flows.
- Conversations, product/order context, escrow payment-link sending, and chat status.
- Order queues for unpaid, to ship, shipped, completed, cancelled, refunded, and returning states.
- Seller-managed courier/tracking submission, buyer messages, refund/return actions, and exception states.
- Seller notifications, performance summaries, account settings, and support/report flows.

### Backend - Laravel Foundation and Marketplace

- API versioning, OpenAPI contract, validation, standard errors, pagination, policies, rate limits, audit logs, queues, cache, storage, monitoring, and CI/CD support.
- Social authentication, users, profiles, devices, roles, permissions, seller types, verification documents, and status workflows.
- Address and region master data for supported markets.
- Vehicle taxonomy, import/scrape pipeline, provenance, compatibility mapping, corrections, and versioning.
- Shared product/SKU, category, attributes, media, price, stock, search, publication, moderation, reviews, reports, and wishlists.
- Used cars, car plates, workshops, EV charging data, and community links.

### Backend - Engagement, Escrow, Orders, and Operations

- Persistent realtime conversations, participants, messages, read state, media, product/order cards, blocking, reporting, retention, and push events.
- Allowlisted/validated escrow-link messages instead of treating arbitrary URLs as verified payments.
- Store escrow transaction/link identifiers and consume signed provider webhooks when available.
- Distinguish link sent, link opened, provider-confirmed payment, expiry, cancellation, dispute, and refund.
- Implement cart/order snapshots, stock rules, order state machine, cancellations, returns, refunds, and seller fulfilment.
- Accept and validate seller-submitted courier/tracking information and notify buyers.
- Provide minimum admin APIs for users, sellers, catalogue, compatibility, content, reports, chats, orders, escrow exceptions, and tracking exceptions.
- Add operational dashboards, reconciliation, audit, failed-job handling, backups, alerts, and incident support.

### Quality Assurance

- Developers own automated unit, component, feature, contract, integration, and regression tests as part of delivery.
- PM owns acceptance criteria and coordinated UAT, not engineering regression testing.
- Infrastructure team validates environments, deployment, backups, restore, monitoring, and rollback.
- Test both apps on an agreed iOS/Android device and OS matrix.
- Cover social login, permissions, localization, network loss, app upgrades, notifications, deep links, and store release behaviour.
- Cover API authorization, ownership, uploads, rate limits, concurrency, compatibility accuracy, chat abuse, webhook signatures, idempotency, and auditability.
- Cover order/payment/tracking success and failure paths, including duplicate callbacks, expired links, seller delays, cancellation, dispute, refund, and return.
- Reserve the final four to six weeks for integration, regression, performance, security, UAT, and launch readiness.
- Present dedicated QA capacity as the strongest staffing recommendation for protecting a six-month target.

## Questions and Answers to Present

### Confirmed

- Frontend technology: React Native.
- Backend technology: Laravel.
- User and Seller experiences are separate apps.
- Team: three frontend and three backend developers from Month 1.
- Frontend team covers both apps and any agreed admin UI/integration work.
- Payment: third-party escrow service.
- Sellers send payment links through chat.
- Logistics: handled by sellers; tracking information is sent to buyers.
- Desired scope: ideally all supplied screens.
- Compatibility data: expected from the design team or a backend scraping/import process.
- Product/UAT owner: PM.
- Deployment/operations support: infrastructure team.
- Editable Figma source is currently unavailable; only exported images are supplied.

### Open for the Meeting

- Is the six-month target a beta, public MVP, or fully production-hardened launch?
- Which visible modules may be deferred if a delivery gate slips?
- Is an admin dashboard included in the six-month commitment, and who builds it?
- Which escrow provider is selected, and does it support API-created links, signed webhooks, disputes, refunds, reconciliation, and marketplace commission?
- Can sellers send arbitrary links, or only platform-created/allowlisted escrow links?
- What are the order, cancellation, return, refund, dispute, and seller-fulfilment rules?
- What seller types and verification documents are required?
- What is the authoritative and legally usable vehicle/compatibility data source?
- Is scraping permitted, what source is used, and who owns data correctness?
- Are English and Chinese both launch requirements?
- Which social login, push, realtime chat, maps, storage, and analytics providers are approved?
- What device/OS support matrix and performance targets apply?
- Who performs daily functional QA and release regression testing?
- What is the minimum admin scope and which actions require audit or dual approval?

## Implementation Steps

## Milestone 1 - Consolidate Meeting Content

### Goal

Create a traceable presentation narrative from the task, exported screens, prior backend documents, and PM answers.

### Tasks

- [ ] Build a screen/module inventory for the User and Seller apps.
- [ ] Separate confirmed decisions, recommendations, assumptions, and open questions.
- [ ] Reconcile the latest six-person-from-Month-1 staffing assumption with older backend-only documents.
- [ ] Define the proposed minimum admin scope.
- [ ] Define the escrow-link and seller-tracking sequence without assuming unsupported provider capabilities.
- [ ] Finalize the executive feasibility statement and scenario estimates.

### Exit Criteria

Every presentation claim is traceable to a supplied screen, PM answer, source document, or clearly labelled recommendation.

## Milestone 2 - Create Detailed Work and Timeframe Slides

### Goal

Show management what the two applications and platform actually require from the six-person team.

### Tasks

- [ ] Create frontend work breakdowns for shared React Native, User App, Seller App, testing, and releases.
- [ ] Create backend work breakdowns for foundation, marketplace, chat, escrow, orders, tracking, admin, and operations.
- [ ] Allocate parallel workstreams across three frontend and three backend developers.
- [ ] Create a 26-week milestone timeline with dependencies and exit gates.
- [ ] Present six-month, eight-to-ten-month, and resourced six-month scenarios.
- [ ] Include scope-deferral order and schedule-control rules.

### Exit Criteria

The audience can see the work, staffing, dependencies, and tradeoffs behind the estimate.

## Milestone 3 - Build the HTML Presentation

### Goal

Produce an attractive, reliable presentation that works locally without setup.

### Tasks

- [ ] Build semantic slide markup and the planned slide sequence.
- [ ] Add responsive visual styling, reusable slide components, tables, status cards, timelines, and flow diagrams.
- [ ] Add keyboard, touch, button, index, and print navigation.
- [ ] Add selected Figma screenshots with readable crops and captions.
- [ ] Add slide numbers, progress indicator, meeting date, and presentation title.
- [ ] Add an appendix for detailed work and questions that do not fit the main narrative.

### Exit Criteria

The complete deck opens directly in a browser, works offline, and communicates the recommendation within a 20-30 minute meeting slot.

## Milestone 4 - Verify and Rehearse

### Goal

Ensure the deck is technically reliable and factually safe to present.

### Tasks

- [ ] Check every internal navigation action and keyboard shortcut.
- [ ] Check all local images and relative paths.
- [ ] Test common desktop viewport sizes and a smaller-screen fallback.
- [ ] Test print/PDF output with one slide per page.
- [ ] Check text contrast, focus states, overflow, table readability, and reduced motion.
- [ ] Verify that confirmed, proposed, and open items are visually distinguishable.
- [ ] Verify the timeframe arithmetic, staffing assumptions, and risk statements.
- [ ] Rehearse the main narrative and confirm it fits the meeting duration.

### Exit Criteria

No broken assets or navigation remain, the content fits its slides and print pages, and the PM can present without needing development tools.

## Testing

### Functional

- Open the presentation directly from the filesystem in a modern Chromium-based browser.
- Navigate forward/backward with buttons, arrow keys, Page Up/Down, Home/End, and touch controls.
- Open the slide index and jump to any slide.
- Verify browser refresh preserves a valid presentation state or safely returns to the first slide.
- Verify every referenced screenshot loads from the task supporting materials.

### Visual and Accessibility

- Verify 16:9 display at 1920x1080, 1440x900, and 1280x720.
- Verify no clipped content at 100% browser zoom.
- Verify print preview and PDF pagination.
- Verify readable contrast and visible keyboard focus.
- Verify meaningful headings, alt text, and reduced-motion behaviour.

### Content

- Cross-check app modules against all supplied Seller App and User App filenames.
- Cross-check confirmed Q&A against the PM's latest answers.
- Ensure escrow status is labelled unverified unless confirmed through provider API/webhooks.
- Ensure the six-month statement is conditional and not represented as a guaranteed full-scope commitment.
- Ensure older one-backend-lead staffing assumptions are not used in this presentation.
- Ensure all meeting questions are actionable and assigned to an expected decision owner.

## Progress

- [x] Read the workflow task and project guidance.
- [x] Inspect the Seller App and User App reference inventory and representative flows.
- [x] Capture the PM's confirmed architecture, staffing, escrow, logistics, data, and ownership answers.
- [x] Define the presentation content, delivery scenarios, and verification plan.
- [ ] Build `supporting-materials/presentation/index.html`.
- [ ] Verify the HTML deck and prepare it for the July 17, 2026 meeting.

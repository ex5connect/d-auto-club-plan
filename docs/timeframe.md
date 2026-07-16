# D-Auto Club Project Timeframe

## Status

This is a proposed six-month delivery baseline, expressed as 26 relative weeks because the project kickoff date has not been confirmed. It becomes a committed schedule only after the P0 items in the [clarification register](clarification-register.md), the MVP boundary, team allocation, and external providers are approved.

## Planning Assumptions

- Laravel REST API and MySQL remain the backend baseline.
- Month 1 has one backend lead assigned to the backend plan.
- Two backend developers become available at the start of Month 3.
- Product decisions, QA, DevOps, and operations support must be available when required by backend delivery.
- Spare parts, compatibility, seller operations, inquiries, platform commerce, and minimum administration are protected MVP scope.
- Community links, workshops, car plates, advanced reporting, and other supporting scope may be deferred if a delivery gate fails.

## Six-Month Summary

| Period | Weeks | Main Focus | Target Outcome |
|---|---:|---|---|
| Readiness | Before Week 1 | P0 decisions, MVP, owners, providers, and staffing | Approved delivery baseline |
| Month 1 | 1-4 | Foundation, identity, API standards, and vehicle data | Secure API foundation and usable My Cars flow |
| Month 2 | 5-8 | Seller foundation and supporting backend modules | Seller governance and supporting APIs ready |
| Month 3 | 9-13 | Product catalogue, spare parts, accessories, and compatibility | Core compatible-parts marketplace testable |
| Month 4 | 14-17 | Seller operations, chat, inquiries, and used cars | Buyer-seller contact journeys testable |
| Month 5 | 18-21 | Cart, orders, payment, commission, and payouts | End-to-end platform transaction reconciles |
| Month 6 | 22-26 | Administration, integration, UAT, hardening, and launch | Production-readiness decision |

## Detailed Delivery Schedule

### Readiness Gate - Before Week 1

Required outcomes:

- Approve MVP and deferred scope.
- Assign owners for product, engineering, finance, seller operations, moderation, DevOps, QA, and UAT.
- Resolve seller types, launch markets/currencies, compatibility ownership, catalogue/inventory model, shipping model, and direct-deal measurement.
- Select or shortlist payment, hosting, storage, maps, notification, and realtime providers.
- Confirm team start dates and effective capacity.
- Convert this relative schedule into calendar dates.

Gate: Week 1 may start with reversible foundation work, but schema-heavy seller, product, compatibility, or finance work must not proceed with its related P0 decisions unresolved.

### Month 1 - Weeks 1-4: Foundation and Vehicle Profiles

#### Weeks 1-2

- Initialize Laravel application structure and environments.
- Establish CI, coding standards, branch/PR rules, response/error format, validation, logging, and OpenAPI baseline.
- Set up database, queues, cache, storage adapter, test framework, and secrets/configuration approach.
- Draft authentication, role, vehicle-taxonomy, and seller-boundary technical designs.
- Document backend setup, architecture decisions, and a reference CRUD pattern.

#### Weeks 3-4

- Implement authentication, token lifecycle, profiles, avatars, roles, and permissions.
- Implement car brands, series, variants, production years, and import/seed workflow.
- Implement user-car CRUD and default-car selection.
- Publish initial API contract and automated feature tests.
- Complete foundation regression tests and API documentation review.

Month 1 gate: an authenticated user can manage a profile and default vehicle through documented APIs; CI and baseline monitoring are functioning.

### Month 2 - Weeks 5-8: Seller Foundation and Supporting Scope

#### Weeks 5-6

- Implement seller types, applications, documents, verification status, permissions, and status history.
- Implement admin seller approval/rejection/suspension APIs and audit records.
- Stabilize identity and My Cars based on contract tests and QA feedback.
- Finalize reusable backend patterns for supporting CRUD modules.

#### Weeks 7-8

- Backend lead prepares product and compatibility architecture for Month 3.
- Implement approved supporting modules: community links, workshop integration/curation, car plates, wishlists, and reports.
- Add ownership, moderation, validation, contract tests, and review for contributed modules.
- Finalize onboarding material for incoming backend developers.

Month 2 gate: seller governance is enforceable, My Cars is stable, and only quality-reviewed supporting modules enter the release baseline.

### Month 3 - Weeks 9-13: Core Marketplace and Compatibility

#### Week 9

- Onboard the two backend developers.
- Confirm domain ownership, development standards, and integration boundaries.
- Finalize shared product/SKU, inventory, category, media, and compatibility schemas.

#### Weeks 10-11

- Implement seller product CRUD for spare parts and accessories.
- Implement categories, attributes, images, price, stock, and publication workflow.
- Implement compatibility mapping, import, validation, and audit trail.
- Build minimum admin moderation APIs alongside catalogue features.

#### Weeks 12-13

- Implement public listings, details, search, filters, sorting, pagination, and related products.
- Implement selected-car compatibility filtering and unknown-compatibility behaviour.
- Add product wishlists, reviews, seller replies, and product reports.
- Run compatibility-data quality and catalogue performance tests.

Month 3 gate: an approved seller can publish a product and a user can find spare parts reliably matched to a selected vehicle.

### Month 4 - Weeks 14-17: Engagement and Additional Listings

#### Weeks 14-15

- Implement seller storefront, catalogue, listing, and inquiry dashboard APIs.
- Implement conversation, participants, messages, media, product cards, read state, and realtime delivery.
- Add chat authorization, rate limiting, blocking/reporting, retention, and moderation access.

#### Weeks 16-17

- Implement contact-click, chat-start, inquiry-source, status, and direct-deal signal tracking.
- Implement approved dealer/private used-car listing flows, media, search, favourites, contact, and moderation.
- Integrate offline notifications for important chat and inquiry events.
- Run abuse, permission, and realtime reliability tests.

Month 4 gate: buyer-seller conversations and inquiries work safely, and analytics distinguish contact signals from verified platform revenue.

### Month 5 - Weeks 18-21: Commerce and Seller Finance

#### Week 18

- Implement cart, seller grouping, price snapshots, stock validation, reservation, and expiry.
- Finalize order and fulfilment state machines.

#### Week 19

- Implement order creation, order-item snapshots, buyer/seller history, cancellation, shipping, and tracking flow.
- Add concurrency tests for checkout and inventory.

#### Week 20

- Integrate payment creation, signed idempotent callbacks, failures, retries, and reconciliation.
- Implement refund/partial-refund behaviour and immutable reversal records.

#### Week 21

- Implement versioned commission rules, per-item commission records, seller ledger/balance, settlement holds, and payouts.
- Complete end-to-end finance reconciliation in the payment provider's staging environment.

Month 5 gate: test orders can complete, fail, cancel, and refund without inconsistent inventory or finance records; commission and seller balances reconcile.

### Month 6 - Weeks 22-26: Operations, UAT, and Launch

#### Weeks 22-23

- Complete admin management for users, sellers, catalogue, listings, moderation, orders, payments, refunds, commissions, and payouts.
- Complete notifications, announcements, operational dashboards, and required exports.
- Finish cross-domain API integration and contract cleanup.

Note: minimum admin APIs are built alongside each earlier domain; these weeks consolidate operational coverage rather than starting all admin work from zero.

#### Week 24

- Run actor-based UAT for buyer, seller, private seller, administrator, moderation, and finance journeys.
- Fix launch-blocking integration and workflow defects.

#### Week 25

- Run security, permission, upload, privacy, webhook, abuse, performance, and load reviews.
- Validate monitoring, alerts, queues, scheduled jobs, backups, restores, and reconciliation.

#### Week 26

- Rehearse production migrations and rollback.
- Validate configuration, runbooks, support ownership, and launch communications.
- Obtain product, operations, finance, security, and engineering sign-off.
- Make the go/no-go decision and deploy only if the launch gate passes.

Month 6 gate: UAT is signed off, financial reconciliation passes, critical defects are closed, and production readiness is approved.

## Work That Runs Throughout

| Workstream | Cadence |
|---|---|
| API documentation | Updated in the same change as each endpoint |
| Automated testing | Required for every domain change; regression suite runs continuously |
| Security and authorization | Reviewed per feature, with a full review before launch |
| Admin operations | Minimum controls delivered with each user-facing domain |
| API contract validation | Review at least weekly from Month 1 onward |
| Product clarification | P0 immediately; P1 before the affected milestone starts |
| Quality and risk review | Weekly status review and end-of-month delivery gate |
| Observability | Logs, metrics, tracing/diagnostics, and alerts added as capabilities are introduced |

## Staffing and Suggested Ownership

| Period | Backend Lead | Backend Developers |
|---|---|---|
| Month 1 | Foundation, standards, authentication, vehicles, testing, and documentation | Not available |
| Month 2 | Seller/product architecture, My Cars, supporting modules, and code review | Not available |
| Month 3 | Architecture, compatibility, integration, and code review | Product catalogue and compatibility |
| Month 4 | Chat/inquiry architecture and cross-domain review | Seller operations, chat, used cars, and supporting modules |
| Month 5 | Commerce/finance architecture and reconciliation | Orders, payments, commission, and payouts |
| Month 6 | Release leadership, security, readiness, and incident planning | Admin APIs, defects, performance, and launch work |

Finance, payment, seller ledger, compatibility, authorization, chat architecture, and production operations require experienced backend ownership.

## Schedule Controls

- Review progress weekly against exit criteria, not task counts.
- Re-baseline immediately when a P0 decision, provider, or required team member slips by more than one week.
- Do not recover schedule by reducing payment, authorization, compatibility, reconciliation, or security testing.
- Use this deferral order when capacity is insufficient: advanced reporting, community links, workshops, car plates, nonessential notification channels, then used-car enhancements.
- Preserve at least Weeks 24-26 for UAT and launch hardening; unfinished feature work must not consume the entire stabilization window.
- Record approved schedule changes in this document and the implementation plan.

## Calendarization

Once the kickoff date is approved:

1. Set Week 1 to the first full delivery week.
2. Add actual start/end dates to each month and gate.
3. Mark public holidays, planned leave, hiring/onboarding dates, and provider lead times.
4. Assign one accountable owner to every monthly gate.
5. Publish the committed launch window only after the Readiness Gate passes.

## Current Schedule Risks

- Two additional backend developers are assumed but not confirmed in the source plan.
- Product compatibility depends on an authoritative vehicle dataset and maintenance owner.
- Shipping, payment, refunds, commission, settlement, and payout rules remain open.
- QA, DevOps, operations, and UAT capacity are not fully specified.
- Full supporting scope leaves little contingency inside six months.

See the [clarification register](clarification-register.md) for owners and decision status.

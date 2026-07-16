# Implementation Plan: D-Auto Club Backend

## Summary

Build the D-Auto Club backend as a Laravel REST API with MySQL. The delivery is spare-parts-first: establish identity and vehicle data, then product compatibility and seller operations, followed by chat and inquiries, commerce, administration, and launch hardening.

The six-month target is retained as a planning baseline, but the scope and schedule must be re-baselined after the blocking items in [`docs/clarification-register.md`](../../../docs/clarification-register.md) are resolved.

The proposed delivery schedule, staffing assumptions, and gates are maintained in [`docs/timeframe.md`](../../../docs/timeframe.md).

### Source Materials

- [`task.md`](task.md) — user-owned task and reference index.
- [`supporting-materials/car_platform_backend_plan.md`](supporting-materials/car_platform_backend_plan.md) — source backend roadmap, API inventory, database grouping, and risk notes.
- [`supporting-materials/D-Auto Club/info.txt`](supporting-materials/D-Auto%20Club/info.txt) — seller-type meeting notes.
- [`supporting-materials/D-Auto Club/`](supporting-materials/D-Auto%20Club/) — supplied product-flow screens and archive.

## Goals

- Deliver a secure, documented API for users, sellers, and administrators.
- Make vehicle-to-spare-part compatibility the main marketplace differentiator.
- Support both platform checkout and measurable off-platform inquiries.
- Calculate platform commission and seller earnings reliably for paid orders.
- Support accessories, used cars, car plates, workshops, and community discovery without delaying the core spare-parts launch.
- Provide moderation, auditability, monitoring, and operational tools required for production.

## Architecture

### Application Shape

Start with a modular Laravel monolith. Keep domain boundaries explicit so high-load capabilities such as chat, search, and notifications can be separated later without introducing distributed-system complexity at launch.

Primary domains:

- Identity and access: authentication, users, roles, permissions, profiles, and devices.
- Seller management: seller types, verification, documents, status, and storefront data.
- Vehicle catalogue: brands, series, variants, production years, user cars, and defaults.
- Product catalogue: shared products, product types, categories, attributes, media, inventory, and compatibility.
- Discovery: search, filters, wishlists, reviews, reports, workshops, and community links.
- Listings: used cars and car plates with owner/seller contact flows.
- Engagement: conversations, messages, product cards, media, inquiries, and direct-deal signals.
- Commerce: carts, orders, order items, payments, refunds, commissions, seller balances, and payouts.
- Operations: administration, moderation, notifications, audit logs, reporting, and configuration.

### Technical Standards

- Version public routes under `/api/v1` and publish an OpenAPI contract.
- Use Laravel policies/permissions for all protected resources.
- Use database transactions for inventory, orders, payments, commissions, and payouts.
- Make payment callbacks idempotent and verify gateway signatures.
- Queue media processing, notifications, exports, and other slow work.
- Store timestamps in UTC and present them in the client-selected timezone.
- Use immutable finance records and audit logs for privileged or money-related changes.
- Use object storage for uploaded media with type, size, and access validation.
- Keep external services behind adapters for payment, maps, messaging, storage, and push notifications.

### Critical Dependency Chain

`decisions` -> `foundation and identity` -> `vehicle catalogue and seller rules` -> `products and compatibility` -> `engagement and listings` -> `commerce` -> `administration and launch`

## Implementation Steps

## Milestone 0 - Confirm Scope and Business Rules

### Goal

Remove decisions that would otherwise cause schema, API, or integration rework.

### Tasks

- [ ] Resolve all P0 items in the clarification register.
- [ ] Confirm MVP versus deferred scope and approve measurable acceptance criteria.
- [ ] Confirm seller types, onboarding rules, and listing permissions.
- [ ] Confirm payment, refund, commission, settlement, payout, shipping, and inventory rules.
- [ ] Confirm compatibility-data ownership and validation workflow.
- [ ] Select payment, storage, maps, chat/realtime, email/SMS, and push providers.
- [ ] Re-estimate the roadmap using actual team availability.

### Exit Criteria

All P0 decisions have owners and recorded answers; the launch scope and delivery baseline are approved.

## Milestone 1 - Foundation, Identity, and Vehicle Profiles

### Goal

Create a production-oriented API foundation and let users securely manage their accounts and cars.

### Tasks

- [ ] Initialize Laravel, environments, CI checks, database, queues, cache, storage, logging, and API documentation.
- [ ] Define API responses, validation, pagination, errors, versioning, and coding conventions.
- [ ] Implement registration, login, logout, token lifecycle, account recovery, and rate limiting.
- [ ] Implement user profiles, avatars, device tokens, roles, and permissions.
- [ ] Implement car brands, series, variants, production years, and import/seed workflow.
- [ ] Implement user-car CRUD and default-car selection.
- [ ] Establish automated test factories, fixtures, and pull-request quality checks.
- [ ] Document backend architecture decisions, local setup, and contributor onboarding.

### Exit Criteria

An authenticated user can manage a profile and default vehicle through documented, policy-protected APIs; CI and baseline observability are working.

## Milestone 2 - Seller Foundation and Supporting Modules

### Goal

Establish seller governance while parallel contributors deliver low-risk supporting capabilities.

### Tasks

- [ ] Implement seller application, seller type, documents, verification status, and status history.
- [ ] Implement administrator approval, rejection, suspension, and audit records for sellers.
- [ ] Implement community-group directory and external-link click tracking.
- [ ] Implement workshop search/directions adapter and optional curated workshop records.
- [ ] Implement car-plate listings, search, favourites, contact tracking, and moderation.
- [ ] Implement common wishlist and report foundations.

### Exit Criteria

Approved seller types and permissions are enforced, and supporting modules pass API contract, policy, and moderation tests.

## Milestone 3 - Product Marketplace and Compatibility

### Goal

Deliver the core spare-parts marketplace and reusable accessory catalogue.

### Tasks

- [ ] Implement shared product, category, attribute, image, price, inventory, and publication-status models.
- [ ] Implement spare-part and accessory seller CRUD with ownership and approval policies.
- [ ] Implement product-to-vehicle compatibility at the agreed taxonomy level.
- [ ] Implement compatibility import, validation, review, and correction workflows.
- [ ] Implement listings, details, keyword search, filters, sorting, pagination, and related products.
- [ ] Implement selected-car filtering and clear behaviour when compatibility is unknown.
- [ ] Implement product wishlists, reviews with media, seller replies, and product reports.

### Exit Criteria

Approved sellers can publish products, and users can reliably discover compatible spare parts for a selected car through documented APIs.

## Milestone 4 - Seller Operations, Chat, Inquiries, and Used Cars

### Goal

Enable buyer-seller engagement and complete non-checkout marketplace journeys.

### Tasks

- [ ] Implement seller profile, storefront, catalogue, listing, and inquiry dashboard APIs.
- [ ] Implement conversations, participants, messages, read state, media, and product-card messages.
- [ ] Add authorization, rate limits, abuse reporting, retention rules, and realtime delivery for chat.
- [ ] Track contact clicks, chat starts, product/listing source, inquiry status, and declared direct deals.
- [ ] Implement used-car listing permissions for the approved dealer/private-seller model.
- [ ] Implement used-car media, details, search, filters, favourites, contact, and moderation.

### Exit Criteria

Users can safely contact sellers about products and used cars, while the platform records attributable inquiry events without treating off-platform deals as confirmed revenue.

## Milestone 5 - Cart, Orders, Payments, and Seller Finance

### Goal

Support auditable platform transactions from cart through seller settlement.

### Tasks

- [ ] Implement cart rules, quantities, price snapshots, availability checks, and seller grouping.
- [ ] Implement order creation, order-item snapshots, state transitions, cancellation, and buyer/seller history.
- [ ] Implement inventory reservation and release using the agreed overselling policy.
- [ ] Integrate payment creation, signed/idempotent callbacks, reconciliation, failures, and retries.
- [ ] Implement refunds and disputes according to the approved policy.
- [ ] Implement versioned commission rules and immutable per-item commission records.
- [ ] Implement seller ledger/balance, settlement holds, payout requests, approval, and reconciliation.
- [ ] Implement shipping/tracking integration or the approved manual fulfilment workflow.

### Exit Criteria

A test order can complete, fail, cancel, and refund without inconsistent inventory or financial records; commissions and seller balances reconcile to payment events.

## Milestone 6 - Administration, Notifications, and Reporting

### Goal

Give operations staff the tools to run and govern the platform.

### Tasks

- [ ] Implement admin authorization with least-privilege permissions and auditable actions.
- [ ] Implement management and moderation for users, sellers, products, listings, reviews, and reports.
- [ ] Implement order, payment, refund, commission, and payout operational views/actions.
- [ ] Implement user/seller notifications, announcements, templates, preferences, and delivery tracking.
- [ ] Implement dashboards for marketplace activity, GMV, commission, seller finance, and inquiries.
- [ ] Add export and retention controls for operational and financial records.

### Exit Criteria

Operations can manage all MVP domains without direct database changes, and sensitive actions are permission-protected and audited.

## Milestone 7 - Integration, UAT, and Launch

### Goal

Validate the complete system and prepare a safe production release.

### Tasks

- [ ] Complete cross-domain API integration and resolve contract mismatches.
- [ ] Run end-to-end UAT for buyer, seller, private seller, and administrator journeys.
- [ ] Run security, permission, webhook, upload, privacy, and abuse-case reviews.
- [ ] Run performance and load tests for catalogue search, chat, checkout, and admin reporting.
- [ ] Validate backups, restores, queues, scheduled jobs, monitoring, alerts, and incident runbooks.
- [ ] Reconcile payment and payout data in a staging gateway environment.
- [ ] Complete production configuration, migration rehearsal, rollback plan, and launch checklist.

### Exit Criteria

All launch-blocking defects are closed, business owners sign off UAT, finance reconciliation passes, and production readiness checks are approved.

## Testing

- Unit tests for domain rules, compatibility matching, state transitions, commission calculations, and seller balances.
- Feature/API tests for success, validation, authorization, ownership, moderation, and pagination behaviours.
- Contract tests against the published OpenAPI schema.
- Integration tests for payment callbacks, maps, object storage, notifications, and realtime chat.
- Concurrency tests for inventory reservation, duplicate checkout, callbacks, refunds, and payouts.
- End-to-end tests for critical buyer, seller, private-listing, admin, and finance journeys.
- Security tests for authentication, access control, file uploads, injection, abuse, secrets, and sensitive data exposure.
- Operational tests for migrations, backup/restore, queue recovery, monitoring, reconciliation, and rollback.

## Progress

- [x] Review the task, backend reference plan, meeting notes, and supplied product screens.
- [x] Reconcile project-document links with the task-local reference-material structure.
- [x] Create the root project-documentation index and overview.
- [x] Create the clarification and decision register.
- [x] Create the six-month project timeframe and delivery gates.
- [x] Replace the understanding-only plan with the backend implementation plan.
- [ ] Resolve P0 clarifications and approve the MVP scope.
- [ ] Re-estimate milestones against confirmed staffing and provider choices.
- [ ] Begin Milestone 1 after Milestone 0 exit criteria are met.

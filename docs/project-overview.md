# D-Auto Club Project Overview

This document is the project-wide summary of the product, scope, delivery baseline, and success measures.

## Product Purpose

D-Auto Club is an automotive marketplace and discovery application. Spare parts are the core commercial product. Accessories, used cars, car plates, workshops, communities, chat, reviews, and reports support discovery, trust, retention, and seller contact.

## Business Model

The platform supports two transaction paths:

1. Platform checkout: the buyer pays through D-Auto Club; the platform records the order, payment, commission, seller earnings, settlement, and payout.
2. Direct seller contact: the buyer contacts a seller and may transact elsewhere; D-Auto Club records the inquiry and attribution signals but cannot assume revenue or a completed deal.

## Actors

| Actor | Main Capabilities |
|---|---|
| User/buyer | Manage profile and cars, discover compatible products, save items, review/report, chat, inquire, and place orders |
| Spare-parts seller | Complete company verification, manage a storefront and compatible products, respond to inquiries, fulfil orders, and receive payouts |
| Accessory seller | Sell as an approved local/overseas company or individual under rules still requiring confirmation |
| Used-car dealer/private seller | Publish used-car listings under a seller model still requiring confirmation |
| Car-plate owner | Publish a free plate listing and receive buyer contacts |
| Administrator/operations | Approve and moderate actors/content, manage commerce and payouts, configure commission, send notifications, and review reports |

## Scope by Priority

### Launch-Critical

- Authentication, profiles, roles, and permissions.
- Seller onboarding and approval.
- Vehicle master data and My Cars.
- Spare-parts catalogue and vehicle compatibility.
- Seller product management, search, filters, media, and inventory.
- Chat, inquiry attribution, and contact tracking.
- Cart, orders, payments, refunds, commission, settlement, and payouts.
- Administration, moderation, audit, API documentation, security, and production operations.

### Important Supporting Scope

- Accessories.
- Used-car listings.
- Reviews, reports, wishlists, and notifications.

### Deferrable if Schedule Is at Risk

- Community social links.
- Workshop discovery.
- Car-plate marketplace.
- Advanced dashboards, recommendations, or nonessential reporting.

Deferral is a recommendation only; product owners must approve the MVP boundary.

## Proposed Technical Direction

- Laravel modular monolith and REST API.
- MySQL for transactional data.
- Redis-compatible cache/queue infrastructure where available.
- OpenAPI as the API contract.
- Object storage for product, listing, chat, review, and profile media.
- Provider adapters for payments, maps, notifications, and realtime messaging.
- Immutable financial records and audited administrative actions.

## Delivery Baseline

| Sequence | Outcome |
|---|---|
| Decisions | Business rules, MVP, providers, ownership, and acceptance criteria agreed |
| Foundation | Secure API, users, roles, seller base, car data, CI, and documentation |
| Marketplace | Shared products, spare parts, accessories, compatibility, discovery, and moderation |
| Engagement | Seller operations, chat, inquiries, used cars, and direct-contact attribution |
| Commerce | Cart, inventory, orders, payments, refunds, commission, settlement, and payouts |
| Operations | Admin, notifications, reports, audit, UAT, security, observability, and launch |

The source plan proposes six months. That duration is a target rather than a commitment until blocking clarifications, staffing, and provider choices are confirmed.

## Success Measures

- Users can find spare parts compatible with their selected vehicle.
- Approved sellers can publish and manage permitted listing types.
- Platform checkout reconciles payments, inventory, commission, and seller balances.
- Direct-contact journeys are attributable without being misreported as completed revenue.
- Administrators can operate and moderate the MVP without direct database changes.
- Critical APIs meet agreed reliability, security, and performance targets.

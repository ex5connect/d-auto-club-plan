# Clarification and Decision Register

This is the project-wide source for open questions and confirmed decisions.

Use this file as the working register for unresolved product, technical, legal, and operational matters. Replace `Open` with `Decided` only after recording the answer, owner, and decision date.

Priority meanings:

- P0: blocks architecture, schema, provider selection, or core implementation.
- P1: required before the affected module begins.
- P2: can be resolved during delivery without blocking the core foundation.

## Business and Launch Scope

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| BUS-01 | P0 | What is the approved MVP, and which modules may move after launch? | Full Figma scope may exceed the stated team capacity and six-month target. | Protect spare parts, compatibility, seller flows, inquiries, commerce, and minimum admin; defer lower-priority discovery modules if needed. | Product/Management | Open |
| BUS-02 | P0 | Which countries, currencies, languages, and tax jurisdictions are supported at launch? | Affects money types, checkout, tax, localization, seller eligibility, and legal compliance. | Launch with one explicitly named market/currency and design for expansion. | Business/Finance/Legal | Open |
| BUS-03 | P1 | What measurable acceptance criteria define launch readiness? | “Full scope completed” is not testable enough for sign-off. | Agree actor-based UAT journeys plus security, reconciliation, and performance gates. | Product/Engineering/Operations | Open |
| BUS-04 | P1 | Who owns product, seller, finance, moderation, and launch decisions? | Unowned questions will block delivery and UAT. | Name one accountable owner for each domain. | Management | Open |

## Sellers and Listings

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| SEL-01 | P0 | What seller types exist and what can each type publish? | Meeting notes distinguish SSM spare-parts companies, accessory individuals, overseas sellers, dealers, and private used-car sellers. | Model explicit seller types/capabilities rather than one generic seller flag. | Product/Legal/Operations | Open |
| SEL-02 | P0 | Can a private individual list a used car without becoming a full marketplace seller? | The notes permit private sellers while the backend plan says used cars are seller-only. | Use a lightweight private-seller profile with used-car-only permissions. | Product/Legal | Open |
| SEL-03 | P0 | What verification is required for SSM companies, non-SSM individuals, and overseas sellers? | Determines documents, approval workflow, risk, and permitted payouts. | Define required evidence and approval states per seller type. | Legal/Operations | Open |
| SEL-04 | P1 | Are listings pre-moderated, post-moderated, or risk-based? | Affects publishing status, admin workload, and time to list. | Pre-approve new sellers/high-risk categories; allow trusted sellers with post-moderation. | Product/Operations | Open |
| SEL-05 | P1 | Can one seller operate multiple storefronts or seller categories? | Notes mention three store types and may imply separate storefront identities. | Start with one seller account and explicit permitted business categories unless branding requires multiple stores. | Product | Open |
| SEL-06 | P1 | What actions follow seller suspension or document expiry? | Impacts active listings, open orders, balances, payouts, and buyer communications. | Hide new sales, preserve order fulfilment/records, and require admin review for payouts. | Operations/Legal/Finance | Open |

## Vehicle and Compatibility Data

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| CAR-01 | P0 | What is the authoritative source for brand, series, variant, engine, and production-year data? | Compatibility quality depends on stable identifiers and maintained taxonomy. | Use a licensed/approved dataset with internal immutable IDs and import versioning. | Product/Data/Legal | Open |
| CAR-02 | P0 | Who creates and approves product compatibility mappings? | Incorrect fitment creates returns, disputes, and loss of trust. | Seller proposes; trained admin/data reviewer approves; retain source and change history. | Product/Operations | Open |
| CAR-03 | P0 | At what granularity is compatibility matched? | Brand/model/year alone may be insufficient for engines, trims, body styles, or market variants. | Match at the most reliable variant/engine/year range supported by source data. | Product/Data/Engineering | Open |
| CAR-04 | P1 | What should users see when compatibility is unknown or partially matched? | Avoids false “compatible” claims while preserving catalogue discovery. | Show `Compatible`, `Not compatible`, or `Compatibility unknown`; never infer a positive match. | Product/UX | Open |
| CAR-05 | P1 | How are compatibility corrections, bulk imports, and version changes handled? | Large datasets cannot be safely maintained only through CRUD screens. | Provide validated imports, review reports, audit history, and reversible corrections. | Data/Operations/Engineering | Open |

## Catalogue, Inventory, and Fulfilment

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| CAT-01 | P0 | Are prices and stock managed per product, variant, warehouse, or seller offer? | Determines the core catalogue and order schema. | Use seller-owned offers/SKUs with price and stock; products hold shared descriptive data where practical. | Product/Engineering | Open |
| CAT-02 | P0 | Can one cart contain multiple sellers, and how are orders split? | Affects checkout, shipping, commission, payment allocation, and cancellation. | Allow multi-seller carts only if checkout creates seller-level fulfilment groups/order partitions. | Product/Finance/Engineering | Open |
| CAT-03 | P0 | How is stock reserved, and is overselling allowed? | Concurrent checkout can create invalid orders. | Reserve stock for a short payment window and release on expiry/failure; do not oversell by default. | Product/Operations | Open |
| CAT-04 | P0 | Who provides shipping rates, labels, tracking, and cross-border handling? | Shipping is not defined in the source plan but is required for physical goods. | Choose an aggregator/provider or define an explicit manual seller-fulfilment MVP. | Operations/Product | Open |
| CAT-05 | P1 | What are the order statuses and allowed transitions? | Buyer, seller, payment, shipping, cancellation, and admin actions need one state model. | Approve a state diagram before order implementation. | Product/Operations/Engineering | Open |
| CAT-06 | P1 | What are the cancellation, return, warranty, and dispute rules? | Affects order lifecycle, seller balances, refunds, and support operations. | Define time windows, evidence, responsibility, and finance effects before commerce work. | Product/Legal/Operations | Open |

## Payments, Commission, and Payouts

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| FIN-01 | P0 | Which payment gateway and payment methods will be used? | Determines integration, webhook, refund, currency, and settlement capabilities. | Select a gateway only after confirming markets, currencies, fees, and marketplace support. | Finance/Product/Engineering | Open |
| FIN-02 | P0 | Is manual bank transfer in MVP? | Manual verification changes payment states, admin workload, fraud controls, and expiry rules. | Exclude unless there is a confirmed business requirement and operating owner. | Finance/Operations | Open |
| FIN-03 | P0 | How is commission calculated and versioned? | Rates may vary by seller/category/campaign and must remain auditable after changes. | Snapshot the applicable rule per order item; never recalculate historical commission from current rules. | Finance/Product | Open |
| FIN-04 | P0 | When do seller earnings become available for payout? | Requires settlement holds for fulfilment, returns, refunds, and disputes. | Release after delivery plus an approved return/dispute window. | Finance/Operations | Open |
| FIN-05 | P0 | Who is merchant of record, and does the gateway support marketplace splitting? | Changes legal responsibility, fund flow, reconciliation, and payout architecture. | Obtain legal/gateway confirmation before designing seller balances. | Finance/Legal | Open |
| FIN-06 | P0 | What is the refund and partial-refund policy? | Affects payment records, commission reversal, stock, seller balances, and accounting. | Support item-level amounts and immutable reversal entries. | Finance/Product/Operations | Open |
| FIN-07 | P1 | What are payout frequency, minimums, fees, approvals, and bank-detail controls? | Defines seller finance UX and operational risk. | Use verified bank details, maker-checker approval, audit logs, and reconciliation references. | Finance/Operations/Security | Open |
| FIN-08 | P1 | How will gateway settlements, orders, refunds, commissions, and payouts be reconciled? | Ledger mismatches must be detectable before money is paid out. | Daily automated reconciliation with an exception queue and finance sign-off. | Finance/Engineering | Open |

## Direct Deals, Chat, and Trust

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| ENG-01 | P0 | Which events count as an inquiry or direct-deal signal? | Reporting must distinguish clicks, chats, declared deals, and verified platform orders. | Track each event separately; never report a contact or self-declaration as verified GMV. | Product/Data | Open |
| ENG-02 | P1 | Is chat realtime, and what delivery/read guarantees are required? | Determines provider, infrastructure, offline notifications, and complexity. | Use a managed realtime service for MVP if budget permits, with persisted server-side messages. | Product/Engineering | Open |
| ENG-03 | P1 | What message/media types, limits, and retention periods apply? | Affects storage cost, moderation, privacy, and user safety. | Start with text, product cards, and restricted images; define size and retention limits. | Product/Legal/Security | Open |
| ENG-04 | P1 | How are chat abuse, prohibited content, blocks, and reports handled? | A marketplace chat requires enforceable trust and safety controls. | Add block/report, moderation access, rate limits, and an escalation policy before launch. | Trust & Safety/Operations | Open |
| ENG-05 | P1 | May sellers share external phone numbers or payment instructions in chat? | Direct contact may undermine commission and increase fraud exposure. | Make the policy explicit and enforce/report according to business strategy. | Product/Legal | Open |

## Integrations, Security, and Operations

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| OPS-01 | P0 | What hosting, database, cache, queue, object storage, and deployment environments will be used? | Required for foundation, cost, CI/CD, scaling, backup, and observability design. | Confirm dev, staging, and production with managed services where practical. | Engineering/DevOps | Open |
| OPS-02 | P0 | Which privacy, data-residency, retention, and deletion rules apply? | Profiles, identity documents, chat, locations, and financial records are sensitive. | Obtain legal requirements and create a data classification/retention schedule. | Legal/Security | Open |
| OPS-03 | P1 | Will workshops use live Google Places data, curated records, or both? | Determines API cost, caching, attribution, and admin requirements. | Use live search plus a small curated layer only where business ownership exists. | Product/Engineering | Open |
| OPS-04 | P1 | Which social platforms are launch scope for community links? | Screens show several platforms while the plan specifies Telegram-only MVP. | Use Telegram-only unless product explicitly expands the scope. | Product | Open |
| OPS-05 | P1 | Which push, email, SMS, and realtime providers are approved? | Affects authentication recovery, order updates, chat, cost, and deliverability. | Select providers and define fallback/critical notification rules before integration work. | Product/Engineering | Open |
| OPS-06 | P1 | What security and administrative approval model is required? | Seller verification, refunds, payouts, and suspensions are high-impact actions. | Least privilege, MFA for admins, maker-checker for money movement, and immutable audit logs. | Security/Operations/Finance | Open |
| OPS-07 | P1 | What availability, latency, throughput, recovery, and backup targets apply? | Performance and readiness cannot be tested without service objectives. | Define measurable SLOs, RPO, and RTO before UAT/performance testing. | Engineering/Business | Open |
| OPS-08 | P2 | Is Chinese/English localization required at launch? | Screens contain Chinese content while the target market may require multiple languages. | Externalize all user-facing text and confirm launch locales early. | Product/UX | Open |

## Team and Delivery

| ID | Priority | Question / Decision Needed | Why It Matters | Suggested Starting Position | Owner | Status / Final Decision |
|---|---|---|---|---|---|---|
| DEL-01 | P0 | What are the confirmed start dates and allocation of the backend lead and two incoming developers? | The six-month estimate depends on staffing that is not yet guaranteed. | Re-estimate after named people and effective capacity are confirmed. | Engineering Management | Open |
| DEL-02 | P1 | Which backend engineer owns each domain and its code review? | Unclear ownership creates bottlenecks and inconsistent architecture. | Assign one primary and one reviewer for each backend domain before its milestone starts. | Engineering Lead | Open |
| DEL-03 | P1 | Who owns backend QA, DevOps, operations readiness, and UAT coordination? | Backend completion alone does not guarantee a production-ready service. | Publish a backend responsibility matrix and release-readiness schedule. | Management | Open |
| DEL-04 | P1 | What is the contingency if hiring, integrations, or business decisions slip? | The current plan has little visible schedule buffer. | Pre-approve scope cuts in priority order and reserve launch-hardening capacity. | Product/Management | Open |

## Decision Recording Template

When resolving an item, update its final column using this format:

`Decided YYYY-MM-DD — <decision>. Owner: <name/role>. Evidence: <meeting, ticket, or document link>.`

If a decision changes, retain the prior decision below the table in a short change note rather than silently replacing history.

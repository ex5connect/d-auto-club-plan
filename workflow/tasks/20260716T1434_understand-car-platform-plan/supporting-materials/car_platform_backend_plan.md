# Car Spare Parts Platform Backend Development Plan

## 1. Project Context

This backend plan is based on the current product scope from the Figma screens and the latest business clarification.

The platform is an automotive commerce platform where the **main core business is spare parts**. Other modules support traffic, retention, trust, and product discovery.

## 2. Business Model Summary

### Core Business

- Spare parts marketplace
- Sellers are mainly China sellers
- Customers can buy spare parts through the platform or deal directly with sellers
- Platform earns commission when payment happens through the platform

### Supporting Business

- Accessories marketplace
- Used car listings posted by sellers
- Car plate listings posted by normal users
- Workshop discovery via Google Maps
- Community groups using Telegram groups

### Transaction Model

There are two transaction paths:

1. **Pay via platform**
   - Customer pays through the app
   - Platform can calculate commission
   - Order, payment, commission, and payout records are tracked

2. **Customer directly deals with seller**
   - Customer contacts seller directly
   - Payment happens outside the platform
   - Platform should still track the inquiry/lead for reporting
   - Commission may not be guaranteed

## 3. Current Team Situation

### Backend Team

- Month 1: only backend lead is available
- 2 backend developers will join after 2 months
- Hiring continues in parallel

## 4. Planning Assumptions

- Backend stack is assumed to be Laravel REST API
- Database is assumed to be MySQL
- API documentation should be maintained using Swagger/OpenAPI or Postman Collection
- Full Figma scope is expected before launch
- Target delivery is 6 months

---

# 5. 6-Month Backend Timeline

## Month 1 — Backend Foundation

### Team Situation

- Backend lead is the only backend developer available
- Focus is the backend foundation, standards, authentication, and vehicle data

### Screens Tied To This Month

- `splash screen + login page.png`
- `user profile.png`
- `landing page to car model list page flow.png`

### Main Objectives

- Establish backend project foundation
- Create backend coding standard
- Start basic authentication and user structure

### Backend Scope

#### Project Foundation

- Laravel project setup
- Environment configuration
- Database connection
- API route structure
- API response standard
- Error handling structure
- Request validation pattern
- File upload foundation
- Basic logging
- Basic seeders
- Git branch workflow
- Postman/Swagger setup

#### Auth & User Foundation

- Register
- Login
- Logout
- Refresh token if needed
- User profile
- Update profile
- Upload avatar

#### Roles & Permissions

Initial roles:

- Admin
- Seller
- User

#### My Cars Foundation

- Car brand master table
- Car series master table
- Car variant master table
- Car year master table
- User car table
- Add user car
- Edit user car
- Delete user car
- Set default car

#### Seller Foundation

- Seller profile table
- Seller application/status foundation
- Seller role assignment foundation

### End of Month 1 Deliverables

By the end of Month 1, the team should have:

- Backend project initialized
- Auth foundation completed
- User profile foundation completed
- Roles foundation completed
- My Cars foundation started or completed
- API standard documented

---

## Month 2 — Seller Foundation + Supporting Modules

### Team Situation

- Backend lead is still the only backend developer
- Backend lead prepares the product and compatibility architecture for Month 3

### Screens Tied To This Month

- `community group.png`
- `workshop.png`
- `car plate.png`
- `review & report.png`
- `user profile.png`

### Main Objectives

- Complete simple supporting modules
- Continue preparing for new backend developers joining in Month 3

### Backend Scope

#### Community Groups

MVP approach:

- Use Telegram group links
- Admin creates and manages group links
- Users browse and open Telegram group links

#### Workshop

MVP approach:

- Use Google Maps / Google Places
- Store optional curated workshop data if needed
- User can search or open map direction

#### Car Plate

- Normal users can create car plate listing
- Free posting
- Other users can browse and contact owner

#### Review & Report

- Product review foundation
- Report product
- Report listing
- Report user

#### Wishlist Foundation

- Wishlist product
- Wishlist used car
- Wishlist car plate

### End of Month 2 Deliverables

By the end of Month 2, the platform should have:

- Auth and profile stable
- My Cars stable
- Community group module completed
- Workshop MVP completed
- Car plate listing completed
- Review/report foundation completed
- Wishlist foundation completed

---

## Month 3 — Core Marketplace Development

### Team Situation

- 2 backend developers join
- Backend lead focuses on onboarding, architecture review, and core business direction

### Screens Tied To This Month

- `spare parts.png`
- `accessories section.png`
- `landing page to car model list page flow.png`
- `car model list overlay.png`

### Main Objectives

- Build the core spare parts marketplace
- Build accessories using reusable product architecture
- Implement product compatibility mapping with My Cars

### Backend Scope

#### Product Architecture

Products should support multiple business types:

- Spare part
- Accessory

Recommended design:

- Use shared product tables
- Use `product_type` to separate spare parts and accessories
- Spare parts require compatibility mapping
- Accessories may optionally use compatibility mapping

#### Spare Parts

- Spare part category
- Spare part listing
- Spare part detail
- Seller spare part CRUD
- Product images
- Product brand
- Product price
- Product stock/status
- Product compatibility mapping
- Compatible spare part listing based on selected My Car

#### Accessories

- Accessory category
- Accessory listing
- Accessory detail
- Seller accessory CRUD
- Product images
- Search and filter

#### Search & Filter Foundation

- Keyword search
- Category filter
- Price filter
- Seller filter
- Brand filter
- Sort by latest/popular/price

### End of Month 3 Deliverables

By the end of Month 3:

- Sellers can create spare parts
- Sellers can create accessories
- Users can browse spare parts
- Users can browse accessories
- Users can filter spare parts based on selected My Car
- Compatibility mapping foundation is working

---

## Month 4 — Seller, Chat, Used Car, Inquiry Flow

### Screens Tied To This Month

- `chat.png`
- `second hand car page.png`
- `spare parts.png`
- `accessories section.png`

### Main Objectives

- Complete seller-facing APIs
- Build chat and inquiry flow
- Build used car seller listings
- Track direct deal leads

### Backend Scope

#### Seller System

- Seller dashboard APIs
- Seller profile management
- Seller status
- Seller product list
- Seller used car list
- Seller inquiry list

#### Chat

- Conversation
- Messages
- Product card message
- Image message
- Read status
- Buyer-seller conversation

#### Inquiry / Direct Deal Tracking

Because customers can directly deal with sellers, the system should track:

- Product inquiry
- Seller contacted
- Inquiry source
- Inquiry status
- Whether inquiry came from spare part, accessory, or used car

#### Used Car

- Used car listing by sellers only
- Used car detail
- Used car images
- Search and filter
- Contact seller
- Wishlist used car

### End of Month 4 Deliverables

By the end of Month 4:

- Users can chat with sellers
- Product inquiry and direct deal tracking are available
- Sellers can manage their product listings
- Sellers can post used cars
- Users can browse and contact used car sellers

---

## Month 5 — Order, Payment, Commission, Seller Finance

### Screens Tied To This Month

- Spare parts checkout flow
- Accessories checkout flow
- Seller order management flow
- User order history flow

### Main Objectives

- Support platform payment
- Track orders
- Calculate commission
- Prepare seller payout records

### Backend Scope

#### Cart

- Add to cart
- Update cart quantity
- Remove from cart
- Cart summary

#### Order

- Create order
- Order detail
- Buyer order history
- Seller order list
- Update order status
- Cancel order

#### Payment

- Create payment transaction
- Payment callback/webhook
- Payment status update
- Upload payment proof if manual transfer is supported

#### Commission

- Commission rule setup
- Commission calculation per order item
- Seller earning calculation
- Platform commission record

#### Seller Payout

- Seller balance
- Payout request
- Payout status
- Payout history

### End of Month 5 Deliverables

By the end of Month 5:

- User can checkout through platform
- Orders are created
- Payment status is tracked
- Seller orders are visible
- Platform commission is calculated
- Seller payout records are available

---

## Month 6 — Admin Dashboard, Integration, UAT, Launch Preparation

### Screens Tied To This Month

- Admin dashboard is not shown directly in uploaded Figma screens, but is required for launch
- Admin supports all user-facing modules

### Main Objectives

- Complete admin backend
- Complete moderation tools
- Complete reporting
- Stabilize APIs
- Prepare for launch

### Backend Scope

#### Admin Dashboard

- Dashboard summary
- User count
- Seller count
- Product count
- Order count
- GMV
- Commission summary
- Inquiry/direct deal summary
- Pending reports
- Pending seller approvals

#### Admin Management

- Manage users
- Manage sellers
- Manage spare parts
- Manage accessories
- Manage used cars
- Manage car plates
- Manage community groups
- Manage workshops
- Manage reviews
- Manage reports
- Manage orders
- Manage commissions
- Manage payouts

#### Notification

- User notification list
- Seller notification list
- Admin announcement
- Push token registration

#### UAT & Launch Preparation

- API bug fixing
- API performance testing
- Permission checking
- Security review
- Payment callback testing
- File upload testing
- Production environment preparation
- API documentation cleanup

### End of Month 6 Deliverables

By the end of Month 6:

- Full backend scope is completed
- Admin can manage all main modules
- UAT can begin or complete depending on overall integration readiness
- Backend is ready for production deployment

---

# 6. Recommended Module Priority

## Highest Priority

1. Auth & User
2. My Cars
3. Spare Parts
4. Compatibility Mapping
5. Seller System
6. Chat / Inquiry
7. Order / Payment / Commission

## Medium Priority

1. Accessories
2. Used Cars
3. Reviews
4. Reports
5. Wishlist
6. Notifications

## Lower Priority

1. Community Telegram Group
2. Workshop Google Maps
3. Car Plate Listing

These lower-priority modules are still part of full scope, but they should be scheduled after core marketplace work or assigned to junior backend developers because the logic is simpler.

---

# 7. Complete API Endpoint List

## 7.1 API Standard

### Suggested Response Format

Success:

```json
{
  "success": true,
  "message": "Success",
  "data": {}
}
```

Error:

```json
{
  "success": false,
  "message": "Validation error",
  "errors": {}
}
```

### Common Query Parameters

For list APIs:

```text
?page=1
?per_page=20
?keyword=brake
?sort=latest
?status=active
```

---

## 7.2 Auth & User APIs

Related screens:

- `splash screen + login page.png`
- `user profile.png`

### Public Auth

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/auth/register` | Register normal user |
| POST | `/api/auth/login` | Login user |
| POST | `/api/auth/forgot-password` | Request password reset |
| POST | `/api/auth/reset-password` | Reset password |
| POST | `/api/auth/verify-otp` | Verify OTP if OTP is used |
| POST | `/api/auth/resend-otp` | Resend OTP if OTP is used |

### Authenticated Auth

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/auth/logout` | Logout current user |
| POST | `/api/auth/refresh` | Refresh token if using JWT |
| GET | `/api/auth/me` | Get current authenticated user |

### User Profile

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/profile` | Get my profile |
| PUT | `/api/profile` | Update my profile |
| POST | `/api/profile/avatar` | Upload profile avatar |
| PUT | `/api/profile/password` | Change password |
| DELETE | `/api/profile/avatar` | Remove avatar |

---

## 7.3 My Cars APIs

Related screens:

- `landing page to car model list page flow.png`
- `car model list overlay.png`

### Car Master Data

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/car-brands` | List car brands |
| GET | `/api/car-brands/{brand_id}` | Get brand detail |
| GET | `/api/car-brands/{brand_id}/series` | List series by brand |
| GET | `/api/car-series/{series_id}` | Get series detail |
| GET | `/api/car-series/{series_id}/variants` | List variants by series |
| GET | `/api/car-variants/{variant_id}` | Get variant detail |
| GET | `/api/car-variants/{variant_id}/years` | List production years by variant |

### User Cars

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/my-cars` | List my cars |
| POST | `/api/my-cars` | Add my car |
| GET | `/api/my-cars/{id}` | Get my car detail |
| PUT | `/api/my-cars/{id}` | Update my car |
| DELETE | `/api/my-cars/{id}` | Delete my car |
| POST | `/api/my-cars/{id}/set-default` | Set default car |
| PUT | `/api/my-cars/{id}/mileage` | Update car mileage |

---

## 7.4 Seller APIs

Related screens:

- Seller flow implied by spare parts, accessories, and used car posting

### Seller Onboarding

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/seller/apply` | Apply to become seller |
| GET | `/api/seller/profile` | Get seller profile |
| PUT | `/api/seller/profile` | Update seller profile |
| POST | `/api/seller/documents` | Upload seller verification document |
| GET | `/api/seller/status` | Get seller verification status |

### Seller Dashboard

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/seller/dashboard/summary` | Seller dashboard summary |
| GET | `/api/seller/products` | Seller product list |
| GET | `/api/seller/inquiries` | Seller inquiry list |
| GET | `/api/seller/orders` | Seller order list |
| GET | `/api/seller/commissions` | Seller commission records |
| GET | `/api/seller/payouts` | Seller payout records |

---

## 7.5 Product Category APIs

Related screens:

- `spare parts.png`
- `accessories section.png`

### Public Category

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/product-categories` | List all product categories |
| GET | `/api/product-categories/{id}` | Get category detail |
| GET | `/api/product-categories/{id}/children` | Get child categories |

---

## 7.6 Spare Parts APIs

Related screens:

- `spare parts.png`

### Public Spare Parts

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/spare-parts` | List spare parts |
| GET | `/api/spare-parts/search` | Search spare parts |
| GET | `/api/spare-parts/compatible` | List spare parts compatible with selected/default car |
| GET | `/api/spare-parts/{id}` | Get spare part detail |
| GET | `/api/spare-parts/{id}/reviews` | Get spare part reviews |
| GET | `/api/spare-parts/{id}/compatibility` | Get spare part compatibility list |
| GET | `/api/spare-parts/{id}/related` | Get related spare parts |

### Seller Spare Parts

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/seller/spare-parts` | Create spare part |
| GET | `/api/seller/spare-parts` | List seller spare parts |
| GET | `/api/seller/spare-parts/{id}` | Get seller spare part detail |
| PUT | `/api/seller/spare-parts/{id}` | Update spare part |
| DELETE | `/api/seller/spare-parts/{id}` | Delete spare part |
| POST | `/api/seller/spare-parts/{id}/images` | Upload spare part image |
| DELETE | `/api/seller/spare-parts/{id}/images/{image_id}` | Delete spare part image |
| POST | `/api/seller/spare-parts/{id}/compatibility` | Add compatibility mapping |
| PUT | `/api/seller/spare-parts/{id}/compatibility/{compatibility_id}` | Update compatibility mapping |
| DELETE | `/api/seller/spare-parts/{id}/compatibility/{compatibility_id}` | Delete compatibility mapping |
| PATCH | `/api/seller/spare-parts/{id}/status` | Update product status |

---

## 7.7 Accessories APIs

Related screens:

- `accessories section.png`

### Public Accessories

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/accessories` | List accessories |
| GET | `/api/accessories/search` | Search accessories |
| GET | `/api/accessories/{id}` | Get accessory detail |
| GET | `/api/accessories/{id}/reviews` | Get accessory reviews |
| GET | `/api/accessories/{id}/related` | Get related accessories |

### Seller Accessories

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/seller/accessories` | Create accessory |
| GET | `/api/seller/accessories` | List seller accessories |
| GET | `/api/seller/accessories/{id}` | Get seller accessory detail |
| PUT | `/api/seller/accessories/{id}` | Update accessory |
| DELETE | `/api/seller/accessories/{id}` | Delete accessory |
| POST | `/api/seller/accessories/{id}/images` | Upload accessory image |
| DELETE | `/api/seller/accessories/{id}/images/{image_id}` | Delete accessory image |
| PATCH | `/api/seller/accessories/{id}/status` | Update accessory status |

---

## 7.8 Wishlist APIs

Related screens:

- `user profile.png`
- `spare parts.png`
- `accessories section.png`
- `second hand car page.png`
- `car plate.png`

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/wishlists` | List my wishlist items |
| POST | `/api/wishlists` | Add item to wishlist |
| DELETE | `/api/wishlists/{id}` | Remove wishlist item |
| DELETE | `/api/wishlists` | Clear wishlist |

Suggested payload for adding wishlist:

```json
{
  "item_type": "spare_part",
  "item_id": 123
}
```

Supported `item_type`:

- `spare_part`
- `accessory`
- `used_car`
- `car_plate`

---

## 7.9 Review APIs

Related screens:

- `review & report.png`

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/reviews` | List reviews by filters |
| POST | `/api/reviews` | Create review |
| GET | `/api/reviews/{id}` | Get review detail |
| PUT | `/api/reviews/{id}` | Update my review |
| DELETE | `/api/reviews/{id}` | Delete my review |
| POST | `/api/reviews/{id}/images` | Upload review images |
| POST | `/api/seller/reviews/{id}/reply` | Seller reply to review |

---

## 7.10 Report APIs

Related screens:

- `review & report.png`

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/reports` | Submit report |
| GET | `/api/reports/reasons` | Get report reasons |

Suggested report payload:

```json
{
  "reportable_type": "product",
  "reportable_id": 123,
  "reason": "fake_product",
  "description": "Suspicious listing"
}
```

Supported `reportable_type`:

- `product`
- `used_car`
- `car_plate`
- `user`
- `seller`
- `review`

---

## 7.11 Chat & Inquiry APIs

Related screens:

- `chat.png`
- Product detail pages
- Used car detail pages
- Car plate detail pages

### Conversations

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/conversations` | List my conversations |
| POST | `/api/conversations` | Create or get conversation |
| GET | `/api/conversations/{id}` | Get conversation detail |
| DELETE | `/api/conversations/{id}` | Delete conversation for current user |
| POST | `/api/conversations/{id}/read` | Mark conversation as read |

### Messages

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/conversations/{id}/messages` | Get messages |
| POST | `/api/conversations/{id}/messages` | Send text message |
| POST | `/api/conversations/{id}/messages/images` | Send image message |
| POST | `/api/conversations/{id}/messages/product-card` | Send product/listing card |

### Inquiry / Direct Deal Tracking

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/inquiries` | Create inquiry when user contacts seller |
| GET | `/api/inquiries` | List my inquiries |
| GET | `/api/inquiries/{id}` | Get inquiry detail |
| PATCH | `/api/inquiries/{id}/status` | Update inquiry status |
| POST | `/api/inquiries/{id}/mark-direct-deal` | Mark inquiry as direct deal |

---

## 7.12 Cart APIs

Related screens:

- Checkout flow implied by spare parts and accessories

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/cart` | Get my cart |
| POST | `/api/cart/items` | Add item to cart |
| PUT | `/api/cart/items/{id}` | Update cart item quantity |
| DELETE | `/api/cart/items/{id}` | Remove cart item |
| DELETE | `/api/cart` | Clear cart |
| GET | `/api/cart/summary` | Get cart summary |

---

## 7.13 Order APIs

Related screens:

- Checkout flow implied by spare parts and accessories
- User profile order history

### Buyer Orders

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/orders` | Create order from cart |
| GET | `/api/orders` | Buyer order history |
| GET | `/api/orders/{id}` | Buyer order detail |
| POST | `/api/orders/{id}/cancel` | Cancel order |
| POST | `/api/orders/{id}/confirm-received` | Confirm order received |

### Seller Orders

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/seller/orders` | Seller order list |
| GET | `/api/seller/orders/{id}` | Seller order detail |
| PATCH | `/api/seller/orders/{id}/status` | Update seller order status |
| POST | `/api/seller/orders/{id}/ship` | Submit shipping/tracking info |

---

## 7.14 Payment APIs

Related screens:

- Checkout flow implied by platform payment

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/payments` | Create payment transaction |
| GET | `/api/payments/{id}` | Get payment status |
| POST | `/api/payments/{id}/proof` | Upload manual payment proof if supported |
| POST | `/api/payments/callback` | Payment gateway callback/webhook |
| POST | `/api/payments/{id}/retry` | Retry failed payment |

---

## 7.15 Commission & Payout APIs

Related screens:

- Seller finance/admin flow implied by commission model

### Seller Finance

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/seller/commissions` | Seller commission records |
| GET | `/api/seller/earnings/summary` | Seller earning summary |
| GET | `/api/seller/payouts` | Seller payout history |
| POST | `/api/seller/payouts` | Request payout |
| GET | `/api/seller/payouts/{id}` | Get payout detail |

---

## 7.16 Used Car APIs

Related screens:

- `second hand car page.png`

### Public Used Car

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/used-cars` | List used cars |
| GET | `/api/used-cars/search` | Search used cars |
| GET | `/api/used-cars/{id}` | Get used car detail |
| GET | `/api/used-cars/{id}/related` | Get related used cars |

### Seller Used Car

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/seller/used-cars` | Create used car listing |
| GET | `/api/seller/used-cars` | List seller used cars |
| GET | `/api/seller/used-cars/{id}` | Get seller used car detail |
| PUT | `/api/seller/used-cars/{id}` | Update used car listing |
| DELETE | `/api/seller/used-cars/{id}` | Delete used car listing |
| POST | `/api/seller/used-cars/{id}/images` | Upload used car image |
| DELETE | `/api/seller/used-cars/{id}/images/{image_id}` | Delete used car image |
| PATCH | `/api/seller/used-cars/{id}/status` | Update used car listing status |

---

## 7.17 Car Plate APIs

Related screens:

- `car plate.png`

### Public Car Plate

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/car-plates` | List car plates |
| GET | `/api/car-plates/search` | Search car plates |
| GET | `/api/car-plates/{id}` | Get car plate detail |

### User Car Plate Listing

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/my-car-plates` | Create car plate listing |
| GET | `/api/my-car-plates` | List my car plate listings |
| GET | `/api/my-car-plates/{id}` | Get my car plate listing detail |
| PUT | `/api/my-car-plates/{id}` | Update car plate listing |
| DELETE | `/api/my-car-plates/{id}` | Delete car plate listing |
| POST | `/api/my-car-plates/{id}/images` | Upload car plate image |
| DELETE | `/api/my-car-plates/{id}/images/{image_id}` | Delete car plate image |
| PATCH | `/api/my-car-plates/{id}/status` | Update car plate status |

---

## 7.18 Workshop APIs

Related screens:

- `workshop.png`

### Public Workshop

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/workshops` | List/search workshops |
| GET | `/api/workshops/nearby` | Get nearby workshops |
| GET | `/api/workshops/{id}` | Get workshop detail |
| GET | `/api/workshops/{id}/directions` | Get Google Maps direction link |

### Google Maps Based Search

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/google/places/workshops` | Search workshops via Google Places |

---

## 7.19 Community Group APIs

Related screens:

- `community group.png`

### Public Community

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/community-groups` | List community groups |
| GET | `/api/community-groups/{id}` | Get community group detail |
| POST | `/api/community-groups/{id}/click` | Track external Telegram link click |

Community group MVP uses Telegram links only.

---

## 7.20 Notification APIs

Related screens:

- `user profile.png`

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/notifications` | List my notifications |
| GET | `/api/notifications/unread-count` | Get unread notification count |
| POST | `/api/notifications/{id}/read` | Mark notification as read |
| POST | `/api/notifications/read-all` | Mark all as read |
| POST | `/api/device-tokens` | Register push notification token |
| DELETE | `/api/device-tokens/{id}` | Remove push notification token |

---

# 8. Admin API Endpoint List

Admin APIs are mainly required for Month 6, but some should be created earlier if needed by the admin panel.

## 8.1 Admin Auth & Dashboard

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/admin/auth/login` | Admin login |
| POST | `/api/admin/auth/logout` | Admin logout |
| GET | `/api/admin/dashboard/summary` | Dashboard summary |
| GET | `/api/admin/dashboard/sales` | Sales chart data |
| GET | `/api/admin/dashboard/orders` | Order chart data |
| GET | `/api/admin/dashboard/commissions` | Commission chart data |
| GET | `/api/admin/dashboard/inquiries` | Inquiry/direct deal chart data |
| GET | `/api/admin/dashboard/pending-tasks` | Pending approvals/reports summary |

## 8.2 Admin User Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/users` | List users |
| GET | `/api/admin/users/{id}` | Get user detail |
| PUT | `/api/admin/users/{id}` | Update user |
| PATCH | `/api/admin/users/{id}/status` | Activate/suspend user |
| DELETE | `/api/admin/users/{id}` | Delete user |
| GET | `/api/admin/users/{id}/cars` | Get user's cars |
| GET | `/api/admin/users/{id}/orders` | Get user's orders |
| GET | `/api/admin/users/{id}/reports` | Get reports related to user |

## 8.3 Admin Seller Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/sellers` | List sellers |
| GET | `/api/admin/sellers/{id}` | Get seller detail |
| PATCH | `/api/admin/sellers/{id}/approve` | Approve seller |
| PATCH | `/api/admin/sellers/{id}/reject` | Reject seller |
| PATCH | `/api/admin/sellers/{id}/suspend` | Suspend seller |
| PATCH | `/api/admin/sellers/{id}/status` | Update seller status |
| GET | `/api/admin/sellers/{id}/products` | Seller products |
| GET | `/api/admin/sellers/{id}/orders` | Seller orders |
| GET | `/api/admin/sellers/{id}/commissions` | Seller commissions |
| GET | `/api/admin/sellers/{id}/payouts` | Seller payouts |
| GET | `/api/admin/sellers/{id}/inquiries` | Seller inquiries |

## 8.4 Admin Car Master Data

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/car-brands` | List car brands |
| POST | `/api/admin/car-brands` | Create car brand |
| PUT | `/api/admin/car-brands/{id}` | Update car brand |
| DELETE | `/api/admin/car-brands/{id}` | Delete car brand |
| GET | `/api/admin/car-series` | List car series |
| POST | `/api/admin/car-series` | Create car series |
| PUT | `/api/admin/car-series/{id}` | Update car series |
| DELETE | `/api/admin/car-series/{id}` | Delete car series |
| GET | `/api/admin/car-variants` | List car variants |
| POST | `/api/admin/car-variants` | Create car variant |
| PUT | `/api/admin/car-variants/{id}` | Update car variant |
| DELETE | `/api/admin/car-variants/{id}` | Delete car variant |
| GET | `/api/admin/car-years` | List car years |
| POST | `/api/admin/car-years` | Create car year |
| PUT | `/api/admin/car-years/{id}` | Update car year |
| DELETE | `/api/admin/car-years/{id}` | Delete car year |

## 8.5 Admin Product Category Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/product-categories` | List categories |
| POST | `/api/admin/product-categories` | Create category |
| GET | `/api/admin/product-categories/{id}` | Get category detail |
| PUT | `/api/admin/product-categories/{id}` | Update category |
| DELETE | `/api/admin/product-categories/{id}` | Delete category |
| PATCH | `/api/admin/product-categories/{id}/status` | Update category status |
| POST | `/api/admin/product-categories/{id}/image` | Upload category image |

## 8.6 Admin Spare Part Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/spare-parts` | List spare parts |
| GET | `/api/admin/spare-parts/{id}` | Get spare part detail |
| PUT | `/api/admin/spare-parts/{id}` | Update spare part |
| PATCH | `/api/admin/spare-parts/{id}/approve` | Approve spare part |
| PATCH | `/api/admin/spare-parts/{id}/reject` | Reject spare part |
| PATCH | `/api/admin/spare-parts/{id}/status` | Update spare part status |
| DELETE | `/api/admin/spare-parts/{id}` | Delete spare part |
| GET | `/api/admin/spare-parts/{id}/compatibility` | View compatibility mapping |
| POST | `/api/admin/spare-parts/{id}/compatibility` | Add compatibility mapping |
| DELETE | `/api/admin/spare-parts/{id}/compatibility/{compatibility_id}` | Delete compatibility mapping |

## 8.7 Admin Accessory Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/accessories` | List accessories |
| GET | `/api/admin/accessories/{id}` | Get accessory detail |
| PUT | `/api/admin/accessories/{id}` | Update accessory |
| PATCH | `/api/admin/accessories/{id}/approve` | Approve accessory |
| PATCH | `/api/admin/accessories/{id}/reject` | Reject accessory |
| PATCH | `/api/admin/accessories/{id}/status` | Update accessory status |
| DELETE | `/api/admin/accessories/{id}` | Delete accessory |

## 8.8 Admin Used Car Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/used-cars` | List used cars |
| GET | `/api/admin/used-cars/{id}` | Get used car detail |
| PUT | `/api/admin/used-cars/{id}` | Update used car |
| PATCH | `/api/admin/used-cars/{id}/approve` | Approve used car listing |
| PATCH | `/api/admin/used-cars/{id}/reject` | Reject used car listing |
| PATCH | `/api/admin/used-cars/{id}/status` | Update used car status |
| DELETE | `/api/admin/used-cars/{id}` | Delete used car |

## 8.9 Admin Car Plate Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/car-plates` | List car plates |
| GET | `/api/admin/car-plates/{id}` | Get car plate detail |
| PUT | `/api/admin/car-plates/{id}` | Update car plate |
| PATCH | `/api/admin/car-plates/{id}/approve` | Approve car plate listing |
| PATCH | `/api/admin/car-plates/{id}/reject` | Reject car plate listing |
| PATCH | `/api/admin/car-plates/{id}/status` | Update car plate status |
| DELETE | `/api/admin/car-plates/{id}` | Delete car plate |

## 8.10 Admin Workshop Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/workshops` | List workshops |
| POST | `/api/admin/workshops` | Create curated workshop |
| GET | `/api/admin/workshops/{id}` | Get workshop detail |
| PUT | `/api/admin/workshops/{id}` | Update workshop |
| DELETE | `/api/admin/workshops/{id}` | Delete workshop |
| PATCH | `/api/admin/workshops/{id}/status` | Update workshop status |

## 8.11 Admin Community Group Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/community-groups` | List community groups |
| POST | `/api/admin/community-groups` | Create community group |
| GET | `/api/admin/community-groups/{id}` | Get community group detail |
| PUT | `/api/admin/community-groups/{id}` | Update community group |
| DELETE | `/api/admin/community-groups/{id}` | Delete community group |
| PATCH | `/api/admin/community-groups/{id}/status` | Update community group status |

## 8.12 Admin Review Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/reviews` | List reviews |
| GET | `/api/admin/reviews/{id}` | Get review detail |
| PATCH | `/api/admin/reviews/{id}/approve` | Approve review |
| PATCH | `/api/admin/reviews/{id}/hide` | Hide review |
| DELETE | `/api/admin/reviews/{id}` | Delete review |

## 8.13 Admin Report Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/reports` | List reports |
| GET | `/api/admin/reports/{id}` | Get report detail |
| PATCH | `/api/admin/reports/{id}/status` | Update report status |
| POST | `/api/admin/reports/{id}/resolve` | Resolve report |
| POST | `/api/admin/reports/{id}/reject` | Reject report |

## 8.14 Admin Order Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/orders` | List orders |
| GET | `/api/admin/orders/{id}` | Get order detail |
| PATCH | `/api/admin/orders/{id}/status` | Update order status |
| POST | `/api/admin/orders/{id}/cancel` | Cancel order |
| POST | `/api/admin/orders/{id}/refund` | Create refund action |

## 8.15 Admin Payment Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/payments` | List payments |
| GET | `/api/admin/payments/{id}` | Get payment detail |
| PATCH | `/api/admin/payments/{id}/verify` | Verify manual payment |
| PATCH | `/api/admin/payments/{id}/reject` | Reject manual payment |

## 8.16 Admin Commission Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/commission-rules` | List commission rules |
| POST | `/api/admin/commission-rules` | Create commission rule |
| PUT | `/api/admin/commission-rules/{id}` | Update commission rule |
| DELETE | `/api/admin/commission-rules/{id}` | Delete commission rule |
| GET | `/api/admin/commissions` | List commission records |
| GET | `/api/admin/commissions/{id}` | Get commission detail |
| GET | `/api/admin/commissions/summary` | Commission summary |

## 8.17 Admin Payout Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/payouts` | List payout requests |
| GET | `/api/admin/payouts/{id}` | Get payout detail |
| PATCH | `/api/admin/payouts/{id}/approve` | Approve payout |
| PATCH | `/api/admin/payouts/{id}/reject` | Reject payout |
| PATCH | `/api/admin/payouts/{id}/paid` | Mark payout as paid |

## 8.18 Admin Inquiry / Direct Deal Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/inquiries` | List inquiries |
| GET | `/api/admin/inquiries/{id}` | Get inquiry detail |
| GET | `/api/admin/inquiries/summary` | Inquiry summary |
| GET | `/api/admin/direct-deals` | List direct deal marked inquiries |
| GET | `/api/admin/direct-deals/summary` | Direct deal summary |

## 8.19 Admin Notification Management

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/notifications` | List sent notifications |
| POST | `/api/admin/notifications` | Send notification |
| POST | `/api/admin/announcements` | Create announcement |
| GET | `/api/admin/announcements` | List announcements |
| PUT | `/api/admin/announcements/{id}` | Update announcement |
| DELETE | `/api/admin/announcements/{id}` | Delete announcement |

---

# 9. Suggested Database Table Groups

## User & Auth

- `users`
- `roles`
- `permissions`
- `model_has_roles`
- `personal_access_tokens`

## My Cars

- `car_brands`
- `car_series`
- `car_variants`
- `car_years`
- `user_cars`

## Seller

- `sellers`
- `seller_documents`
- `seller_status_logs`

## Product

- `products`
- `product_categories`
- `product_images`
- `product_compatibilities`
- `product_attributes`
- `product_reviews`
- `review_images`

## Commerce

- `carts`
- `cart_items`
- `orders`
- `order_items`
- `payments`
- `commission_rules`
- `commission_records`
- `seller_payouts`

## Chat & Inquiry

- `conversations`
- `conversation_participants`
- `messages`
- `inquiries`

## Supporting Modules

- `used_cars`
- `used_car_images`
- `car_plates`
- `car_plate_images`
- `workshops`
- `community_groups`
- `wishlists`
- `reports`
- `notifications`
- `device_tokens`

---

# 10. Risk Areas

## 1. Payment & Commission

Highest business risk because it involves money.

Need early confirmation on:

- Payment gateway
- Manual bank transfer support
- Refund policy
- Commission rate
- Seller payout process

## 2. Direct Deal Flow

If users can directly deal with sellers, commission revenue may be reduced.

Need to track:

- Product inquiry
- Contact seller clicks
- Chat started
- Direct deal status

## 3. Compatibility Data

This is the most important differentiator for spare parts.

Need early decision on:

- Who maintains compatibility data?
- Seller input or admin input?
- How strict should compatibility filtering be?
- What happens if no compatible parts are found?

## 4. Backend Team Capacity

The first two months depend on one backend lead, so scope and sequencing must remain focused.

Lower-risk work:

- Community group CRUD
- Workshop CRUD
- Car plate CRUD
- Review/report CRUD
- Basic admin CRUD

Work requiring experienced backend ownership:

- Payment and refunds
- Commission and seller finance
- Chat architecture
- Product compatibility logic
- Authorization and production operations

---

# 11. Practical Execution Recommendation

## Month 1

Backend lead should focus on:

1. Create backend foundation
2. Create API standards
3. Implement authentication and user profiles
4. Implement roles and permissions
5. Start My Cars and seller foundations

## Month 2

Backend lead focuses on:

1. My Cars
2. Seller foundation
3. Product architecture preparation
4. Supporting backend modules

## Month 3-4

New backend developers join and focus on:

1. Spare parts
2. Accessories
3. Seller system
4. Chat
5. Used car

## Month 5

Focus on:

1. Order
2. Payment
3. Commission
4. Payout

## Month 6

Focus on:

1. Admin dashboard
2. Integration
3. UAT
4. Bug fixing
5. Launch preparation

---

# 12. Final Timeline Summary

| Month | Main Focus | Key Deliverable |
|---|---|---|
| Month 1 | Backend foundation | Auth, user, roles, API standard, My Cars foundation |
| Month 2 | Seller foundation + supporting modules | Seller foundation, community, workshop, car plate, review/report, My Cars |
| Month 3 | Core marketplace | Spare parts, accessories, compatibility, seller products |
| Month 4 | Seller, chat, used car | Seller dashboard, chat, inquiry, used car |
| Month 5 | Commerce | Cart, order, payment, commission, payout |
| Month 6 | Admin + UAT | Admin dashboard, moderation, reporting, launch prep |

Recommended message to management:

> The backend plan targets full Figma scope completion in 6 months. Months 1 and 2 establish the backend foundation, vehicle data, seller foundation, and supporting APIs with one backend lead. From Month 3 onward, two additional backend developers join and the team focuses on the core marketplace, engagement, commerce, administration, and launch preparation.

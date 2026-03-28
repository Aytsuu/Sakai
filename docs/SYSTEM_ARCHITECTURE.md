# SAKAI — System Design & Architecture
### Smart AI for Komyut Assistance & Innovation | Technical Reference

---

## Table of Contents

1. [System Overview](#1-system-overview)
2. [Architecture Overview](#2-architecture-overview)
3. [Full Technology Stack](#3-full-technology-stack)
4. [Backend Module Breakdown](#4-backend-module-breakdown)
5. [Core Data Models](#5-core-data-models-postgresql-schema)
6. [Real-Time Communication Architecture](#6-real-time-communication-architecture)
7. [AI Feature Design](#7-ai-feature-design)
8. [Key API Endpoints Reference](#8-key-api-endpoints-reference)
9. [Project Repository Structure](#9-project-repository-structure)
10. [Sprint Plan](#10-sprint-plan)
11. [Environment Variables Reference](#11-environment-variables-reference)
12. [Post-Hackathon Scalability Path](#12-post-hackathon-scalability-path)

---

## 1. System Overview

SAKAI is a smart public transit platform connecting Local Government Units (LGUs), drivers, and commuters through real-time data, AI-driven recommendations, and crowd-sourced safety feedback. The system serves three distinct user roles, each with a dedicated workflow.

| Role | Primary Responsibility | Interface |
|---|---|---|
| Admin (LGU) | Monitor city-wide transit in real-time via command center dashboard | Web (Next.js) |
| Driver | Use AI-powered demand maps and smart dispatch notifications for trip efficiency | Mobile (React Native) |
| Commuter | Search routes, get fare estimates, find safe loading zones, track vehicles | Mobile (React Native) |

---

## 2. Architecture Overview

SAKAI adopts a layered, service-oriented architecture optimized for rapid development within a hackathon time constraint. The design prioritizes clear separation of concerns, minimal infrastructure overhead, and a single backend serving both the web and mobile frontends.

### 2.1 Architecture Style: Monolithic FastAPI + Modular Services

A monolithic FastAPI backend is chosen over microservices for hackathon feasibility. Internal modules (Auth, Routes, AI, Realtime, Safety) are clearly separated by Python packages, making the codebase production-ready for future decomposition without over-engineering the initial build.

**Architecture Tier Breakdown:** `Client Layer → API Gateway → Application Core → Data Layer → AI/ML Services`

| Tier | Component | Technology | Purpose |
|---|---|---|---|
| Client — Web | Admin Dashboard | Next.js 14 (App Router) | LGU command center with real-time map |
| Client — Mobile | Driver & Commuter App | React Native (Expo) | Cross-platform iOS/Android app |
| API Gateway | HTTP & WebSocket | FastAPI + Uvicorn | Single entry point; REST + WS endpoints |
| Application Core | Business Logic Modules | Python 3.11+ | Auth, Routes, AI nudges, Safety feedback |
| Realtime Layer | Live pub/sub events | Redis Pub/Sub + WebSockets | Driver location, commuter demand updates |
| Data Layer | Primary DB | PostgreSQL (Supabase) | Users, routes, trips, safety logs |
| Data Layer | Cache / Realtime Store | Redis (Upstash) | Session cache, location state, pub/sub |
| AI/ML Services | Demand Prediction & Nudges | Python (rule engine + spatial math) | Route demand heatmap, launch threshold, anti-clustering |
| AI/ML Services | LLM Intelligence Layer | Gemini API | Commuter free-text parsing, nudge message generation, deviation classification |
| AI/ML Services | Fare Estimation | Rule-based + Distance API | Cost calculation per route segment |
| Mapping | Geospatial Services | Mapbox GL JS / React Native Maps | Live map rendering for all roles |
| Auth | Identity & Sessions | Custom setup (JWT) | Role-based access: Admin, Driver, Commuter |

---

## 3. Full Technology Stack

### 3.1 Frontend — Web (Admin / LGU Dashboard)

| Technology | Version / Notes | Role in SAKAI |
|---|---|---|
| Next.js | 14 — App Router, Server Components | Admin dashboard web framework |
| React | 18 — concurrent features | UI component layer |
| Mapbox GL JS | v3 — or Leaflet.js (free tier) | Real-time logistics map, heatmap overlays |
| Socket.IO Client / native WS | For realtime driver tracking | Live updates without polling |
| TailwindCSS | v3 | Rapid utility-first styling |
| shadcn/ui | Headless component library | Accessible, consistent UI components |
| Recharts / Chart.js | — | Admin analytics charts and KPIs |
| React Query (TanStack) | v5 — server state management | Data fetching, caching, invalidation |
| Zustand | — | Lightweight client state; UI state (selected route, filters, alerts) |
| Vercel | Deployment target | Zero-config Next.js hosting |

### 3.2 Frontend — Mobile (Driver & Commuter App)

| Technology | Version / Notes | Role in SAKAI |
|---|---|---|
| React Native | 0.73+ with Expo SDK 50 | Cross-platform iOS & Android app |
| Expo | Managed workflow — faster hackathon iteration | Build tooling, OTA updates, device APIs |
| React Native Maps | Google Maps / Apple Maps SDK | Live map for drivers and commuters |
| Expo Location | Background location (driver mode) | Speed-based driver mode detection |
| React Navigation | v6 — stack & tab navigators | App navigation structure |
| Axios / Fetch | HTTP client for API calls | REST API communication with FastAPI |
| Socket.IO Client | Real-time commuter demand updates | Driver map live data |
| Zustand | Shared state across screens | Driver session config, mode detection |
| Expo Notifications | Push notification support | Optimal Move alerts for drivers |
| EAS Build | Expo Application Services | CI/CD for mobile builds |

### 3.3 Backend — FastAPI

| Technology | Version / Notes | Role in SAKAI |
|---|---|---|
| FastAPI | 0.110+ — async framework | Primary API server (REST + WebSocket) |
| Uvicorn | ASGI server with hot reload | Serve FastAPI in dev and production |
| Pydantic | v2 | Data validation & serialization; request/response schema enforcement |
| SQLAlchemy | 2.0 Async ORM with asyncpg driver | Database access layer |
| Alembic | Database migration tool | Schema versioning across team |
| python-jose / PyJWT | JWT token handling | Auth token validation per request |
| Passlib + bcrypt | Password hashing | Secure credential storage |
| httpx | Async HTTP client | Calling external APIs (maps, distance) |
| websockets / starlette WS | WebSocket endpoint support | Real-time bidirectional communication |
| APScheduler | Background job scheduling | Periodic AI demand recalculation |
| Gemini (Python SDK) | Gemini API client | LLM calls for commuter input parsing and nudge generation |
| pytest + httpx | Test suite | API endpoint and integration tests |

### 3.4 Data & Infrastructure

| Technology | Type | Role in SAKAI | Hackathon Tier |
|---|---|---|---|
| Supabase (PostgreSQL) | Primary Database | Persistent storage for all entities | Free tier |
| Supabase Auth | Authentication | JWT-based role auth, social login | Free tier |
| Upstash Redis | Cache & Pub/Sub | Driver locations, demand state, realtime events | Free tier |
| Railway / Render | Backend Hosting | FastAPI deployment — auto-deploy from GitHub | Free tier |
| Vercel | Web Hosting | Next.js admin dashboard deployment | Free tier |
| Expo EAS | Mobile CI/CD | Build and distribute React Native app | Free tier |
| Mapbox | Mapping API | Geocoding, routing, map tiles | Free 50K loads/mo |
| OpenRouteService | Routing fallback | Free open-source routing alternative | Free |
| Gemini API | LLM Provider | Commuter parsing + nudge text | Pay-per-token |
| GitHub Actions | CI/CD pipeline | Auto-test and deploy on push | Free tier |

---

## 4. Backend Module Breakdown

The FastAPI application is organized into internal modules (Python packages). Each module owns its own router, schemas, models, and service layer — enabling team parallelism during the hackathon.

| Module | Path | Key Endpoints / Responsibilities |
|---|---|---|
| Auth | `app/auth/` | `POST /auth/register`, `POST /auth/login`, JWT issue & validate, role assignment |
| Users | `app/users/` | `GET/PUT /users/me`, role metadata, driver session config |
| Routes | `app/routes/` | `GET /routes`, `GET /routes/{code}/demand`, fare estimate engine |
| Vehicles | `app/vehicles/` | `POST /vehicles/location` (driver heartbeat), `GET /vehicles/nearby` |
| Demand (AI) | `app/demand/` | Aggregates commuter location pings into demand heatmap by route code |
| Dispatch (AI) | `app/dispatch/` | Smart Launch Threshold calculation, Optimal Move notification trigger |
| LLM (AI) | `app/llm/` | Gemini API wrapper: commuter destination parsing, nudge message generation, deviation classification |
| Safety | `app/safety/` | `POST /safety/feedback`, `GET /safety/zones` — crowd-sourced zone safety log |
| Realtime (WS) | `app/realtime/` | WebSocket hub: driver broadcasts location, commuters subscribe to route |
| Admin | `app/admin/` | Anomaly detection triggers, route deviation alerts, traffic event logging |

---

## 5. Core Data Models (PostgreSQL Schema)

| Table | Key Fields | Notes |
|---|---|---|
| `users` | `id`, `email`, `hashed_password`, `role (admin\|driver\|commuter)`, `created_at` | Supabase Auth UID used as FK |
| `driver_sessions` | `id`, `user_id`, `vehicle_type`, `plate_number`, `route_code`, `started_at`, `ended_at` | One active session per driver |
| `vehicles` | `id`, `session_id`, `latitude`, `longitude`, `speed`, `updated_at` | Updated on every location heartbeat |
| `commuter_demand` | `id`, `user_id`, `route_code`, `latitude`, `longitude`, `destination`, `updated_at` | Ephemeral; refreshed every ping |
| `routes` | `id`, `code`, `name`, `origin`, `destination`, `base_fare`, `vehicle_types[]` | Seed data from LGU route registry |
| `safety_zones` | `id`, `latitude`, `longitude`, `route_code`, `is_safe`, `report_count`, `last_updated` | Crowd-sourced; AI surfaces in commuter flow |
| `admin_alerts` | `id`, `alert_type`, `route_code`, `message`, `severity`, `resolved`, `created_at` | Triggered by AI anomaly detection |
| `trips` | `id`, `commuter_id`, `driver_session_id`, `route_code`, `fare_estimate`, `status`, `created_at` | Optional: for analytics and history |

---

## 6. Real-Time Communication Architecture

### 6.1 Driver Location Broadcasting

The driver app sends GPS coordinates every 3 seconds via a WebSocket connection. The FastAPI WebSocket endpoint writes the position to Redis with a TTL of 10 seconds (stale vehicle auto-expires). Redis Pub/Sub fans out the update to all subscribed commuter connections on the same route code.

| Flow Step | Actor | Mechanism |
|---|---|---|
| 1. Driver opens app, enters Driver Mode | Mobile App | WebSocket handshake to `/ws/driver/{session_id}` |
| 2. App pings GPS every 3 seconds | Expo Location | Background location fetch |
| 3. FastAPI receives location | Backend | Updates Redis key: `vehicle:{session_id}` with `TTL=10s` |
| 4. Backend publishes to channel | Backend + Redis | `PUBLISH route:{route_code}` with vehicle payload |
| 5. Commuter subscriptions receive update | Backend (subscriber) | Push to all commuter WebSockets on route |
| 6. Commuter map updates | Mobile App | Marker moves on live map in real time |

### 6.2 Commuter Demand Aggregation

When a commuter selects a destination and vehicle type, their location is registered as an active demand pin. The backend APScheduler runs every 30 seconds to aggregate demand pins per route code into a Capacity Percentage, which is then pushed to subscribed drivers.

---

## 7. AI Feature Design

SAKAI uses two complementary AI approaches: **rule-based spatial logic** for deterministic, low-latency features (demand aggregation, threshold triggers, geofencing), and an **LLM (Gemini API)** for tasks requiring language understanding and contextual reasoning. The split is deliberate — avoid using an LLM where a formula suffices, and use it where natural language or nuanced judgment is genuinely needed.

### 7.1 Rule-Based Features (No LLM Required)

These features are implemented with geospatial math, aggregation queries, and threshold rules. They are fast, deterministic, and free at inference time.

| Feature | Implementation Approach | Complexity |
|---|---|---|
| Mode Detection (Driver) | Speed threshold rule: >15 km/h for 10s triggers prompt. Uses Expo Location speed field. | Low |
| Route Demand Heatmap | Aggregate `commuter_demand` rows by `route_code` and grid cell (lat/lng rounded to 4 decimal places). Return as weighted pins. | Low |
| Smart Launch Threshold | Count demand pins on route ÷ vehicle capacity × 100 = Capacity %. Rule: if % >= threshold (e.g., 50%), push Optimal Move notification. | Low |
| AI Nudges — Zone Selection | Find grid cells with demand > N commuters and no driver within 500m radius. Suggest driver move to that cell. Anti-clustering: skip zones already served by 2+ vehicles. | Medium |
| Fare Estimation | Distance (Mapbox Directions API) × base_fare per km per vehicle type + minimum fare floor. | Low |
| Smart Loading Zone | Sort `loading_zones` by safety score and current demand count. Return lowest-demand verified zone. | Low |
| Safety Feedback Loop | Append safe/unsafe vote to `safety_zones`. Compute `is_safe = safe_votes / total_votes > 0.6`. | Low |
| Route Deviation Detection (Admin) | Compare driver GPS polyline vs registered route polyline using point-to-line distance. Deviation > 200m triggers alert. | Medium |
| Destination Suggestions | Query past 5 trips for commuter. Return unique destinations as quick-select chips. | Low |
| Driver Next Stop Prediction | Nearest point on route polyline ahead of driver's heading vector. Pure geospatial math — no LLM needed since route is fixed. | Medium |

### 7.2 LLM-Powered Features (Gemini API)

These features involve natural language input, contextual message generation, or ambiguous classification where rule-based logic falls short. All LLM calls are routed through the `app/llm/` module, which wraps the Gemini Python SDK with prompt templates, response parsing, and a Redis cache to avoid redundant API calls.

| Feature | LLM Role | Why LLM (not rules) | Prompt Strategy |
|---|---|---|---|
| Commuter Free-Text Destination Parsing | Parse informal input into a structured route match and lat/lng | Users type "near SM", "katabi sa Fuente", "big church Cebu" — impossible to regex-match reliably | System: known Cebu landmarks + route stop list. User input → JSON `{route_code, stop_name, lat, lng, confidence}` |
| Nudge Message Generation | Write the human-readable driver notification text | Static strings feel robotic; LLM varies tone and adds specific context (street name, commuter count) | Prompt includes: zone name, commuter count, distance, time of day → one concise push notification sentence |
| Safety Zone Ambiguity Resolution | Classify borderline zones when vote ratio is 0.4–0.6 (inconclusive) | Binary vote threshold misses nuance; LLM reads the zone description + report context | Structured prompt with zone metadata and last 5 safety reports → `{is_safe: bool, reasoning: str}` |
| Route Deviation Classification | Distinguish intentional detour vs. GPS jitter vs. true off-route | Simple distance threshold produces false positives near intersections; LLM evaluates full trajectory context | Prompt includes: last 10 GPS points, route polyline segment, speed, time → `{deviation_type, confidence, alert_admin: bool}` |

### 7.3 LLM Integration Architecture

All LLM calls are isolated in `app/llm/` to keep the rest of the codebase model-agnostic. The module exposes async service functions that other modules import — no other module calls the Gemini API directly.

| Component | Details |
|---|---|
| Model | Gemini 3/3.1 Pro — strong reasoning, fast enough for real-time use, cost-efficient |
| Sub Models | Gemini 2.5 Flash / Gemini 3 Flash |
| SDK | Gemini Python SDK (`pip install -U google-genai`) |
| Prompt Format | System prompt defines SAKAI context + Cebu geography. User turn carries the dynamic payload. Response always requested as JSON. |
| Response Parsing | LLM instructed to return only valid JSON. Parsed with `json.loads()`; fallback to rule-based result on parse error. |
| Caching | Redis cache keyed on SHA-256 hash of the prompt payload. TTL: 60s for nudge messages, 300s for destination parsing. Avoids duplicate API calls for identical inputs. |
| Error Handling | On API timeout or parse failure, module returns a safe fallback (rule-based result or `None`). LLM is never in the critical path for realtime location updates. |
| Cost Control | LLM called only for the 4 features above. All demand/threshold/map features remain rule-based. Estimated hackathon usage: < 500 API calls total. |

### 7.4 What the LLM Does NOT Do

To avoid over-engineering and latency issues, the LLM is explicitly excluded from the following:

| Task | Reason LLM Is Not Used | Actual Approach |
|---|---|---|
| Predict driver's destination along a route | Route code defines a fixed path — the destination is already known | Geospatial nearest-point-on-polyline math |
| Determine if driver is on return leg | Speed + heading vector vs. route direction is deterministic | Dot product of movement vector vs. route segment direction |
| Aggregate commuter demand | Pure database aggregation query | SQL `GROUP BY` + grid-cell rounding |
| Calculate fare estimate | Fixed formula: distance × base_fare per vehicle type | Mapbox distance API + fare lookup table |
| Real-time location broadcasting | Latency-critical path; LLM adds 500ms–1s+ per call | Redis Pub/Sub directly; no AI in the WS loop |

---

## 8. Key API Endpoints Reference

| Method | Endpoint | Auth Role | Description |
|---|---|---|---|
| `POST` | `/auth/register` | Public | Register user with role assignment |
| `POST` | `/auth/login` | Public | Returns JWT access + refresh tokens |
| `POST` | `/driver/session/start` | Driver | Start driver session (vehicle, plate, route) |
| `PUT` | `/driver/session/end` | Driver | End active session |
| `WS` | `/ws/driver/{session_id}` | Driver | Persistent location broadcast socket |
| `WS` | `/ws/commuter/{route_code}` | Commuter | Subscribe to live vehicle updates |
| `POST` | `/commuter/demand` | Commuter | Register demand pin on route |
| `POST` | `/commuter/parse-destination` | Commuter | LLM: parse free-text input into structured route + lat/lng |
| `GET` | `/routes/{code}/demand` | Driver | Get current Capacity % for route |
| `GET` | `/routes/search` | Commuter | Search routes by origin/destination |
| `GET` | `/fare/estimate` | Commuter | Estimate fare for route + vehicle type |
| `GET` | `/loading-zones` | Commuter | Get recommended zone (least-demand, safest) |
| `POST` | `/safety/feedback` | Commuter | Submit safe/unsafe vote for a zone |
| `POST` | `/llm/nudge` | Driver (internal) | LLM: generate contextual Optimal Move notification text |
| `GET` | `/admin/map` | Admin | All active vehicles + commuter density overlay |
| `GET` | `/admin/alerts` | Admin | Anomaly alerts feed |
| `POST` | `/admin/alerts/{id}/resolve` | Admin | Mark alert as resolved |

---

## 9. Project Repository Structure

Monorepo structure (recommended for speed and shared types):

```
sakai/                                  # Root monorepo
├── backend/                            # FastAPI application
│   ├── app/                            # Main application package
│   │   ├── auth/                       # Auth module: router.py, schemas.py, service.py
│   │   ├── routes/                     # Route/demand/fare module
│   │   ├── realtime/                   # WebSocket manager, Redis pub/sub
│   │   ├── ai/                         # Demand aggregator, nudge engine, anomaly detector (rule-based)
│   │   ├── llm/                        # Gemini API wrapper: parse_destination.py, generate_nudge.py, classify_deviation.py
│   │   ├── safety/                     # Safety zone CRUD and voting logic
│   │   ├── admin/                      # LGU-specific endpoints and alert triggers
│   │   ├── config.py                   # Global configurations
│   │   └── main.py                     # FastAPI app factory, router registration
│   └── alembic/                        # DB migrations
├── web/                                # Next.js Admin Dashboard (App Router)
│   ├── app/                            # App routes: /dashboard, /map, /alerts
│   └── components/                     # Map, AlertFeed, DemandChart components
├── mobile/                             # React Native / Expo app
│   ├── app/                            # Expo Router screens
│   ├── screens/
│   │   ├── driver/                     # DriverMap, SessionSetup, Nudges
│   │   └── commuter/                   # Search, RouteSelect, LoadingZone, LiveMap
│   └── hooks/                          # useLocation, useWebSocket, useDriverMode
```

---

## 10. Sprint Plan

The following sprint plan prioritizes a working end-to-end demo over feature completeness. Core flows for each role should be demonstrable by the midpoint.

| Phase | Deliverables | Team Focus |
|---|---|---|
| Phase 0: Setup | Monorepo scaffold, Supabase project, Redis instance, Expo dev build, env config | All hands |
| Phase 1: Auth & Core Models | Registration/login with role assignment, JWT middleware, DB schema + seed data | Backend lead |
| Phase 2: Driver MVP | Driver mode detection, session setup, WebSocket location broadcast, basic map view | Mobile + Backend |
| Phase 3: Commuter MVP | Destination search, route filter, live vehicle map, fare estimate display | Mobile + Frontend |
| Phase 4: AI Features | Demand aggregation, Smart Launch Threshold, Loading Zone recommendation, Safety feedback | Backend AI |
| Phase 5: Admin Dashboard | Next.js map view, vehicle tracking overlay, alerts feed, basic KPI tiles | Web frontend |
| Phase 6: Integration & Polish | End-to-end testing across roles, push notifications, UI polish, demo script prep | All hands |
| Buffer / Presentation Prep | Slides, rehearsal, fallback static demo if needed | All hands |

---

## 11. Environment Variables Reference

| Variable | Service | Description |
|---|---|---|
| `DATABASE_URL` | Backend | Supabase PostgreSQL connection string (`async: postgresql+asyncpg://`) |
| `REDIS_URL` | Backend | Upstash Redis URL (`rediss://` for TLS) |
| `SUPABASE_URL` | Backend / Web | Supabase project URL |
| `SUPABASE_ANON_KEY` | Frontend | Supabase public anonymous key |
| `SUPABASE_SERVICE_KEY` | Backend | Supabase service role key (server-only) |
| `JWT_SECRET` | Backend | Secret for signing JWT tokens (min 32 chars) |
| `GOOGLE_API_KEY` | Backend | Google API key for LLM features (destination parsing, nudge generation) |
| `MAPBOX_TOKEN` | Web / Mobile | Mapbox public access token for map tiles |
| `NEXT_PUBLIC_API_URL` | Web | FastAPI base URL for Next.js client-side calls |
| `EXPO_PUBLIC_API_URL` | Mobile | FastAPI base URL for React Native calls |
| `EXPO_PUBLIC_WS_URL` | Mobile | WebSocket URL for live map connections |

---

## 12. Scalability Path

The architecture is intentionally designed so the monolith can be decomposed without rewriting business logic. Each FastAPI module maps 1:1 to a potential future microservice.

- Split the `realtime` module into a dedicated WebSocket service (e.g., using Socket.IO server with Redis adapter).
- Extract the `AI` module into a separate Python inference service or integrate a hosted model (e.g., AWS SageMaker, Google Vertex AI).
- Migrate from Supabase free tier to managed RDS (AWS Aurora, Neon.tech) for production load.
- Add a message queue (RabbitMQ / Kafka) between the demand aggregator and dispatch module for decoupled processing.
- Introduce an API Gateway (Kong, AWS API Gateway) for rate limiting, logging, and authentication offloading.
- Deploy on Kubernetes (GKE / EKS) with horizontal pod autoscaling for the FastAPI and WebSocket services.
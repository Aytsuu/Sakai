# SAKAI — Overall System Workflow & Feature Reference
### Smart AI for Komyut Assistance & Innovation

---

## Table of Contents

1. [System Overview](#1-system-overview)
2. [Admin (LGU) Workflow](#2-admin-lgu-workflow)
3. [Driver Workflow](#3-driver-workflow)
4. [Commuter Workflow](#4-commuter-workflow)

---

## 1. System Overview

SAKAI is a smart public transit platform designed to connect Local Government Units (LGUs), drivers, and commuters through real-time data, AI-driven recommendations, and crowd-sourced safety feedback. The system operates across three user roles, each with a dedicated workflow and interface layer.

| Role | Primary Responsibility |
|---|---|
| **Admin (LGU)** | Monitor public transportation in real-time via a high-level command center dashboard. |
| **Driver** | Use AI-powered route demand maps and smart dispatch notifications to maximize trip efficiency. |
| **Commuter** | Search routes, get fare estimates, find safe loading zones, and track nearby vehicles. |

---

## 2. Admin (LGU) Workflow

The LGU operates a web-based **Command Center** — a high-level dashboard that serves as the central orchestrator of the city's public transit health.

### 2.1 Real-Time Logistics Map

- Provides a comprehensive live view of city-wide transit activity.
- Tracks active driver locations and commuter density across the network.
- Enables the LGU to assess overall transit load at a glance.

### 2.2 AI Filtering Layer

Rather than overwhelming staff with raw data, an AI layer serves as a digital monitoring layer that filters noise into actionable insights.

- Continuously monitors the live map against predefined rules.
- Proactively alerts the LGU only when anomalies are detected, such as:
  - Unauthorized route deviations by drivers
  - Extreme traffic bottlenecks
  - Safety incidents requiring intervention
- Staff focus on decisions, not data monitoring.

---

## 3. Driver Workflow

### 3.1 Login & Mode Detection

> **Trigger:** After login, location access is requested. The AI immediately begins monitoring movement speed in the background — no manual setup required.

- When speed exceeds **15 km/h** sustained over **10 seconds**, the app prompts the user to switch to **Driver Mode**.
- Passengers who trigger this accidentally can dismiss the prompt or toggle back to **Commuter Mode** at any time.

### 3.2 Driver Mode Setup

Upon entering Driver Mode, the driver configures their session:

| Field | Details |
|---|---|
| **Vehicle Type** | Jeepney, Bus, or Modern Jeepney |
| **Plate Number** | Registered plate of the vehicle |
| **Route Code** | e.g., `01K`, `10M`, `04L` — used to filter the live map |

### 3.3 AI-Filtered Live Map

- The route code filters the map to show only commuter demand pins from commuters on that specific route — removing noise from irrelevant routes.
- Demand pin visibility is dependent on commuters having location enabled. Only active, locatable commuters appear.
- Drivers can see other vehicles sharing or overlapping their route code, enabling informed positioning decisions.

**Live Map Legend:**

| Indicator | Meaning |
|---|---|
| 🔵 Blue dot | Your vehicle |
| 🟢 Green dot | Same-route vehicles |
| 🔴 Red dot | Waiting commuters |

### 3.4 Smart Launch Threshold

Replaces guesswork with data-driven dispatch timing to maximize earnings per trip.

- Commuter demand is displayed as a **Capacity Percentage (%)** relative to vehicle type.
- A predefined occupancy threshold (e.g., **50%**) triggers an **Optimal Move** notification from the AI.
- Goal: ensures every trip is financially viable while reducing carbon emissions from under-capacity roaming.

### 3.5 AI Nudges & Route Recommendations

- The AI surfaces underserved areas along the route where demand is concentrated.
- Suggests when to dwell at a location or move on to better-served pickup zones.
- Prevents **clustering** (too many drivers in one spot) and reduces **deadheading** (empty vehicle travel).

---

## 4. Commuter Workflow

### 4.1 Login & Default Mode

> **Default:** Commuter Mode is activated automatically on login. No action is required to start using the app's core features.

- Location access is requested on login — all AI features depend on this being enabled.
- AI assistance is active immediately after login — no manual setup required.

### 4.2 Destination Selection

- The AI reads the user's current location and suggests likely destinations based on position and past trips.
- Users can also search manually by place name or route code.
- Most steps are automated, minimizing manual input so the user can focus on deciding rather than navigating.

### 4.3 Vehicle & Route Filtering

- After selecting a destination, the commuter filters by vehicle type: **Jeepney**, **Bus**, or **Modern Jeepney**.
- The live map updates to show only drivers serving the selected route. Irrelevant vehicles are filtered out.

### 4.4 Fare Estimate & Route Alternatives

| Route Option | Description |
|---|---|
| **Fare Estimate** | AI provides a fare estimate for the full journey. If precision is not possible, a range is shown. |
| **Fastest Route** | Optimized for minimal travel time. |
| **Cheapest Route** | Optimized for lowest fare. |

### 4.5 Smart Loading Zone Recommendation

Rather than pointing commuters to the nearest stop, SAKAI recommends the loading zone with the **least passenger demand** — reducing wait times by spreading load across available stops.

- The AI prioritizes **wait-time efficiency** over proximity alone.
- If no safety data exists for a recommended zone, the commuter is asked a single question:

> **"Is this area safe?"**

| Response | Outcome |
|---|---|
| **Safe** | Logs the area as verified; commuter proceeds to the zone. |
| **Unsafe** | Logs and flags the area for other users; AI immediately surfaces the next best alternative. |
| **No suitable zone found** | Commuter can manually select their own zone. |

Every response — safe or not — feeds the AI feedback loop, expanding safety coverage over time.

### 4.6 At the Loading Zone

- The live map shows nearby vehicles with route codes and estimated arrival times.
- Commuters can track approaching drivers in real time.
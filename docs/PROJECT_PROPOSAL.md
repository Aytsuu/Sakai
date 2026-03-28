# SAKAI — Smart AI for Komyut Assistance & Innovation
### A Proposal for AI-Integrated Public Transport in the Philippine Context

> *Navigate smarter, ride better.*

---

## Team Members

| Name | Role |
|------|------|
| Paolo Araneta | Project Lead |
| Kent Bryan Colina | Hacker |
| Hannah Sheen Obejero | Hipster |
| Jarlene Maria Garcia | Hustler |

---

## Target Audience and Beneficiaries

SAKAI serves Filipinos who depend entirely on jeepneys and buses and absorb every system inefficiency through lost time, money, and safety.

| Beneficiary | How SAKAI Helps |
|---|---|
| Daily wage earners & workers | Shorter waits and fare estimates prevent late arrivals and lost income. |
| Students | Route guidance and arrival alerts reduce tardiness and missed classes. |
| PUV drivers | Demand pins and AI nudges direct drivers to underserved zones, raising earnings. |
| Women & vulnerable commuters | Safety alerts and crowd-sourced zone verification reduce unsafe waiting. |
| Elderly & persons with disabilities | Automated guidance and minimal manual input enable independent transit use. |
| Urban poor communities | Free AI-guided routing reduces daily transport cost and physical fatigue. |
| LGUs | Actionable real-time data for route management and traffic monitoring. |

---

## Problem Statement

Every day, millions of Filipinos navigate one of the most fragmented public transportation systems in Southeast Asia — largely without access to reliable, real-time information (Sunio et al., 2025). Commuters have no way of knowing which route serves their destination, where the nearest loading zone is, or how long they will wait (Inquirer, 2026). This forces guesswork, extends commute times by tens of minutes to hours, and disproportionately burdens those who cannot afford ride-hailing alternatives — costing them productivity, employment access, and daily energy (Pagkatotohan, 2022).

On the supply side, drivers operate without demand visibility. A jeepney may idle on a saturated stretch while a nearby zone goes unserved, causing overcrowding at some stops and empty units on others (Gamad et al., 2024). This mismatch stems from the absence of a real-time system for forecasting transport supply and demand — essential for agencies to manage deficiencies (Chang and Abante, 2021).

---

## AI-Based Solution

SAKAI is an AI-powered smart public transit platform that connects Local Government Units (LGUs), drivers, and commuters through real-time data and AI-driven recommendations. It replaces guesswork with a data-driven coordination engine. Drivers receive AI-powered route demand maps to maximize trip efficiency, while commuters get fare estimates, find safe loading zones, and track nearby vehicles. For the LGU, an **Agentic AI** layer filters raw data into actionable insights, alerting staff to route deviations or traffic bottlenecks.

### How AI is Applied

- **AI Filtering Layer** — A digital monitoring layer continuously analyzes the live map against predefined rules to proactively alert LGUs of anomalies like unauthorized route deviations, extreme traffic, or safety incidents.
- **Demand Prediction & Heatmaps** — The system aggregates real-time GPS density from active commuters and drivers to compute a live "Demand Heatmap", surfacing underserved areas where demand is concentrated.
- **Smart Launch Threshold** — Using data-driven dispatch timing, the AI calculates commuter demand as a **Capacity Percentage (%)** relative to the vehicle type. When an occupancy threshold (e.g., 50%) is met, the AI triggers an "Optimal Move" notification to maximize earnings per trip.
- **Smart Loading Zone Recommendation** — Instead of recommending the nearest stop, the AI ranks candidate zones by current passenger demand, prioritizing **wait-time efficiency over proximity** to reduce overall wait times.
- **Crowdsourced Safety Loop** — The system uses a **Reinforcement Learning** loop to build a live safety map. If a recommended zone has no data, the AI prompts the commuter to classify it as "safe" or "unsafe," immediately surfacing alternatives if a zone is flagged.
- **Route Inference & Optimization** — The AI resolves LTFRB-approved Local Public Transport Route Plans (LPTRPs) against empirical GPS traces to ensure every point along an authorized path can be optimized for data-driven pickups.
- **Automated Mode Detection** — AI monitors movement speed in the background; when speed exceeds 15 km/h for over 10 seconds, it automatically prompts the user to switch to **Driver Mode**.

### Why AI is the Right Approach

Matching dispersed commuter demand to moving vehicle supply is a real-time optimization task that static maps cannot solve. SAKAI utilizes AI to ingest thousands of live data points — route inference, travel times, and fare estimations — allowing the system to adapt faster than traditional manual dispatching methods. This transforms public transit into a predictable utility, mitigating the significant economic losses caused by regional traffic.

---

## Feasibility

### Technology and Data

SAKAI runs on cloud infrastructure with a React Native mobile app for iOS and Android, a Google Maps / OpenStreetMap layer with jeepney route overlays, and a PostgreSQL + PostGIS database for geospatial queries. Loading zone data is seeded from three sources:

1. LTFRB-approved LPTRPs, which legally require LGUs to document stops and pickup points per route.
2. OpenStreetMap community route geometries.
3. Driver GPS traces accumulated during live operation — which over time build empirically derived route paths that reflect ground reality.

### Key Partners

| Partner | Role |
|---|---|
| LTFRB Regional Office | Route and franchise data; regulatory alignment |
| LGU Traffic Management Office | Local stop and zone data; pilot area coordination |
| Jeepney companies / cooperatives | Driver onboarding; real-world testing and feedback |
| OpenStreetMap PH community | Route geometry data and mapping support |

### Implementation Timeline (Total: 3–5 Months)

| Phase | Duration | Key Activities |
|---|---|---|
| 1. Planning & Research | 1–2 wks | System requirements; traffic pattern study; tech stack selection; LTFRB data request |
| 2. System Design | 1–2 wks | Architecture; database schema; driver and commuter UI/UX |
| 3. Development | 5–8 wks | LGU/Driver/commuter interfaces; route engine; loading zone ranking; fare calculator; safety alerts |
| 4. AI Integration & Training* | 2–3 wks | Train demand prediction and safety classification models; validate accuracy |
| 5. Testing & Refinement | 1–3 wks | Functional, usability, and performance testing; user feedback and fixes |
| 6. Pilot Deployment | 1–3 wks | Deploy on selected Cebu routes; monitor live performance; begin real data collection |

*Phase 4 overlaps with Phase 3.

---

## Scalability and Impact

SAKAI is architected for scale from launch. Both the AI models and infrastructure are cloud-based and software-defined — expanding to new cities requires no new hardware, only route data and a user base generating demand signal. The Cebu pilot is a replicable template: seed route data, onboard drivers, grow the commuter base, let the feedback loop sharpen the AI model, then replicate.

Beyond commute efficiency, SAKAI's crowd-sourced safety layer generates structured urban safety data that currently does not exist for Philippine cities — a resource for transport agencies, LGUs, and researchers. At the regional level, the model is directly transferable to any Southeast Asian city with informal fixed-route transit and a route code system, including parts of Indonesia, Vietnam, and Myanmar.

### Success Indicators

| Indicator | Cebu Pilot Target | National (Year 3) |
|---|---|---|
| Avg. wait time reduction | ≥15% on pilot corridors | ≥20% across covered routes |
| Active commuter users | 5,000+ | Scales with cities onboarded |
| Active driver users | 500+ | Scales with commuter base |
| Verified safe zones | 200+ | 10,000+ over time |
| Routes covered | Selected Cebu corridors | Cities with approved LPTRPs |

*Targets will be reviewed and updated after the pilot phase based on actual collected data.*

---

## Outreach Plan

SAKAI's outreach targets a minimum of 1,000 community members in the pilot area, focused on AI literacy — helping people understand how the AI works, why it asks for safety confirmations, and how their participation makes the network smarter. The core message across all activities: **SAKAI is not a black box. The community teaches it, and the community benefits from what it learns.**

| Activity | Target Reach | Measurement |
|---|---|---|
| Social media campaign (Facebook, TikTok, Instagram) | 500+ | Impressions, shares; AI literacy quiz completions |
| Barangay hall & public market seminars | 300+ | Attendance count; pre/post AI awareness survey |
| Driver onboarding workshops with jeepney cooperatives | 150+ | Registered driver accounts; feature adoption rate |
| LTFRB collaboration for public transport information integration | Institutional | Data sharing agreement; routes integrated |
| In-app AI explainer (onboarding carousel for all new users) | All users | Onboarding completion rate; feature adoption rate |

---

## References

Chang, A., & Abante, V. B. (2021). *The systemic shortage in Philippine public transportation: The impact of the infrastructure flagship project pipeline on the mobility needs of the greater capital region and recommendations to bridge the gaps.* ResearchGate. https://www.researchgate.net/publication/351849012

Gamad, P., Dela Cruz, J., & Santos, M. (2024). The mismatch between supply and demand in urban public transportation. *International Journal of Scientific Research in Engineering and Development, 7*(3), P202. https://ijsred.com/volume7/issue3/IJSRED-V7I3P202.pdf

INQUIRER.net. (2026, January 1). *Why PH commutes stay unreliable.* https://globalnation.inquirer.net/304451/why-ph-commutes-stay-unreliable

Pagkatotohan, K. (2022, November 7). *Commuters' everyday dilemma.* Moneymax. https://www.moneymax.ph/lifestyle/articles/commuters-everyday-dilemma

Sunio, A., Reyes, B., & Gomez, C. (2025). *Study on fragmented public transportation in Southeast Asia.* Archium. https://archium.ateneo.edu/cgi/viewcontent.cgi?article=1438&context=discs-faculty-pubs
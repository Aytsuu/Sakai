<div align="center">
  <img src="./SAKAI_LOGO.png" alt="Sakai Logo" width="250" />
  <br />
  <p><b>Smart AI for Komyut Assistance & Innovation</b></p>
  <p><i>An AI-powered commute companion for Filipino public transport.</i></p>

  <!-- Badges -->
  <img src="https://img.shields.io/badge/Web-Next.js-black?style=flat-square&logo=next.js" alt="Next.js">
  <img src="https://img.shields.io/badge/Mobile-Expo%2FReact%20Native-blue?style=flat-square&logo=expo" alt="React Native">
  <img src="https://img.shields.io/badge/Backend-FastAPI%20%28Python%29-009688?style=flat-square&logo=fastapi" alt="FastAPI">
</div>

---

## 📖 Overview

**Sakai** addresses the deeply fragmented Philippine public transport system by bridging the information gap between commuters, drivers, and Local Government Units (LGUs). Millions of commuters are forced into "guesswork-based" travel, while drivers operate blind to live demand, causing overcrowding, fuel waste, and severe economic loss.

Sakai is an **AI-driven platform** that acts as a real-time transport companion. By connecting commuters to live transport supply, giving drivers demand-aware routing and optimal launch alerts, and providing LGUs with an agentic AI layer for anomaly detection, Sakai optimizes urban mobility from the ground up. *Navigate smarter, ride better.*

## ✨ Key Features

- **🚶 For Commuters:** View live demand heatmaps across candidate loading zones and real-time transport supply filtered directly to your destination.
- **🚐 For Drivers (Smart Launch & Heatmaps):** Access a route-filtered map of nearby vehicles overlaid with commuter heatmaps. Receive automated **Smart Launch alerts** when area demand crosses a critical threshold, signaling the optimal departure moment.
- **🏛️ For LGUs (Agentic AI Layer):** A digital filter that silently monitors city-wide transit health, surfacing alerts only when real anomalies emerge—such as unauthorized route deviations, bottlenecks, or safety incidents.
- **🧠 Advanced AI & Geospatial Optimization:** Utilizing demand prediction, reinforcement learning for safety mapping, and route inference validated against LTFRB-approved plans (or dynamically building datasets where unavailable).

## 🏗️ Project Structure

This is a monorepo containing three main applications:

| Directory | Description | Stack |
| --------- | ----------- | ----- |
| 🌐 [`/web`](./web) | Commuter and admin web application. | Next.js, React, Tailwind CSS |
| 📱 [`/mobile`](./mobile) | Mobile app for on-the-go commuters and drivers. | React Native, Expo |
| ⚙️ [`/backend`](./backend) | Core API and AI services. | FastAPI, Python, Database + Alembic, Docker |

## 🛠️ Tech Stack

### Web
* **Framework:** Next.js (TypeScript)
* **Styling:** Tailwind CSS / CSS Modules
* **Tooling:** ESLint, PostCSS

### Mobile
* **Framework:** Expo (React Native)
* **Language:** TypeScript

### Backend
* **Framework:** FastAPI
* **Language:** Python
* **Database Migrations:** Alembic
* **Infrastructure:** Docker & Docker Compose

---

## 🚀 Getting Started

### Prerequisites

Please make sure you have the following installed on your machine:
- [Node.js](https://nodejs.org/en/) (v18+)
- [Python](https://www.python.org/) (3.10+)
- [Docker](https://www.docker.com/) & Docker Compose
- Base package managers (`npm`/`yarn`/`pnpm` or `uv`)

### Development Setup

> **Note:** Detailed setup guides are provided below. Feel free to expand on these placeholders as the project grows!

<details open>
<summary><b>⚙️ Backend Setup</b></summary>

*[Placeholder: Add detailed instructions on how to set up the Python backend, initialize virtual environments, configure Alembic migrations, and start Docker services.]*

</details>

<details open>
<summary><b>📱 Mobile Setup</b></summary>

*[Placeholder: Add detailed instructions on how to install mobile dependencies, start the Expo development server, and run the app on iOS/Android emulators or physical devices.]*

</details>

<details open>
<summary><b>🌐 Web Setup</b></summary>

*[Placeholder: Add detailed instructions on how to install Next.js dependencies, configure environment variables, and start the web development server.]*

</details>

---

## 🤝 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📚 Documentation

- **[System Architecture](docs/SYSTEM_ARCHITECTURE.md)** - System architecture and design
- **[User Workflow](docs/USER_WORKFLOW.md)** - Project planning and management

### Service-Specific Documentation

- [Backend API Documentation](Sakai/README.md)
- [Frontend Documentation](Sakai/README.md)
- [AI Service Documentation](Sakai/README.md)

## 🔒 Security & Privacy

- End-to-end encryption for sensitive communications
- JWT-based authentication with secure token rotation
- Role-based access control (Admin, Driver, Commuter)
- Regular security audits and vulnerability assessments
- Privacy-by-design architecture principles

---

_This README is maintained and updated regularly to reflect current project status and deployment procedures._

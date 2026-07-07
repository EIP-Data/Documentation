# Technical Protection Plan & Sensitive Areas Map

## Overview
Datalyz employs a segmented architecture to protect its core analytical processes and proprietary data handling. This document maps the sensitive areas of our infrastructure and details the technical protections in place to secure them.

## Map of Sensitive Areas
1. **Core Backend API (Go/Gin)**: Handles all business logic, data processing, and interactions with the database and object storage.
2. **PostgreSQL Database**: Stores user configurations, analytics metadata, and relational state.
3. **MinIO Object Storage**: Handles unstructured data and larger object blobs.

## Protection Strategy

### 1. Network Segmentation
- **Internal Isolation**: The backend API, PostgreSQL database, and MinIO storage run on an isolated, internal Docker bridge network (`datalyz-network`).
- **Controlled Exposure**: Only the Caddy reverse proxy and the frontend container expose public ports (80/443). The backend cannot be accessed directly from the public internet without passing through the proxy.

### 2. Firewall Hardening
- The Debian deployment server utilizes strictly configured `iptables` to drop unauthorized incoming traffic.
- As shown below, the default policy is `DROP`, with explicit allowances only for SSH (22) and web traffic routed to our Caddy proxy (80, 443). Direct database or internal API connections are impossible from the public internet.

### 3. Secret Management
- **No Hardcoded Secrets**: Sensitive credentials (e.g., `SECRET_KEY`, `POSTGRES_PASSWORD`) are strictly excluded from the codebase.
- **CI/CD Injection**: Secrets are injected via GitHub Actions Secrets during the deployment pipeline. They are written to a localized `.env` file on the remote Debian server using secure SSH connections, ensuring developers do not have direct access to production keys.

### 4. Encryption in Transit
- Caddy automatically provisions and manages Let's Encrypt SSL/TLS certificates, ensuring all communication between the web extension, frontend, and backend is fully encrypted.

# Datalyz: Architecture & Technology Highlight

## The Project
Datalyz is an advanced analytics platform that bridges browser-based data collection with a high-performance backend processing engine, designed with security and modularity at its core.

## Core Architecture
- **Backend**: Built with **Go (Golang)** using the Gin framework, chosen for its exceptional performance, concurrency model, and low memory footprint during heavy data processing tasks.
- **Data Persistence**: A robust combination of **PostgreSQL** for relational metadata and **MinIO** (S3-compatible) for highly scalable object storage.
- **Infrastructure**: Containerized using **Docker** and deployed on a Debian Linux environment, utilizing **Caddy** as a dynamic reverse proxy for automated SSL/TLS termination and secure traffic routing.

## Technical Highlights
1. **Automated CI/CD Pipeline**: We built a zero-downtime deployment pipeline using GitHub Actions. It handles automated testing, environment variable injection via GitHub Secrets, and secure SSH deployments directly to our Linux infrastructure.
2. **Secure-by-Design Networking**: Datalyz uses a segmented architecture. The core backend and databases are isolated on an internal Docker network, completely shielded from the public internet. All external traffic is safely routed and encrypted through our proxy layer.
3. **Scalable Data Collection**: The architecture is explicitly designed to handle concurrent incoming data streams from our web extensions securely, without exposing the underlying database architecture to the client side.
# Security Report

## Overview
This report details the automated security measures, audits, and pipeline checks implemented to ensure the integrity and security of the Datalyz infrastructure.

## 1. Automated Deployment Verification
To ensure deployments do not silently fail or expose vulnerable error states, the GitHub Actions CI/CD pipeline includes a robust health-check verification step.
- Post-deployment, the pipeline executes a `curl` health check against the live API (e.g., `http://api.datalyz.org/ping`).
- If the service does not respond correctly within the configured retry window, the deployment is marked as failed, alerting the team to investigate before traffic is routed to a broken instance.

## 2. Supply Chain Security (Go Dependencies)
- We enforce strict versioning and cryptographic checksums for all Go dependencies.
- The `go.sum` file is mandatory in our repository. The CI pipeline validates these checksums during the build phase (`go mod tidy` and test steps), preventing supply-chain attacks such as dependency poisoning.

## 3. Surface Area Audit
- **Public Surface**: `api.datalyz.org` (Caddy Proxy) and `datalyz.org` (Frontend).
- **Private Surface**: Go API (`:8080`), Postgres (`:5432`), MinIO.
- **Result**: The audit confirms that the internal services are successfully hidden behind the Docker bridge network and UFW firewall. External port scanning on the Debian VM confirms that ports `8080` and `5432` are closed to public IP addresses.
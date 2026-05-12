# Objective 02 — Architecture, Documentation, and Security

This folder gathers the material produced for the Technical Track objective focused on structuring, documenting, and hardening Datalyz’s technical architecture.

The purpose of this objective is to demonstrate that Datalyz is not only functional, but also designed as a coherent, modular, documented, testable, and secure technical system. The expected evaluation scope includes architecture clarity, justification of technical choices, technical documentation, code quality, tests, configuration management, and first security mechanisms.

## Folder content

- `architecture-overview.md` — system architecture, components, and data flows
- `technical-stack-rationale.md` — justification of the main structural and stack choices
- `deployment-and-environments.md` — deployment model, CI/CD, secrets, and environment separation
- `security-hardening.md` — implemented or planned security controls across frontend, backend, infra, and data layers
- `quality-and-testing.md` — quality tooling, test policy, and validation approach
- `technical-roadmap.md` — technical build sequence and implementation priorities
- `evidence-checklist.md` — list of screenshots, logs, reports, and repo artifacts to attach

## Project context

Datalyz is a project developed by a team of four students and designed as a suite of tools for the collection, analysis, and visualization of user data. Its architecture includes a browser extension, a frontend platform, a Go backend API, data-processing components, databases, streaming infrastructure, and deployment automation.

The project is explicitly positioned around cross-browser extension support, secure authentication, consent management, privacy-aware data processing, and a controlled infrastructure with observability and security tooling.

## Evaluation alignment

The Technical Track requires the team to present the project architecture, justify structural choices, provide a structured README, produce at least one advanced technical document, enforce quality conventions, run quality-analysis tools, provide tests on at least one critical module, and implement first security mechanisms such as authentication, sanitization, logging, and configuration management. visited URLs with timestamps, active time per domain, visit frequency over 30 days, specific clicks, scroll percentage, cookies, trackers, and profiling-related DOM/network indicators.

The extension also exposes a popup for login and quick actions, plus a preferences page where users can manage language, theme, granular consent, and excluded sites.

### 2. User-facing interfaces

Datalyz includes a public-facing frontend area and authenticated user pages. The public area presents the project, services, team, legal conditions, and onboarding pages, while the authenticated area includes dashboards, account pages, and guides around the extension and VPN setup.

The dashboard is the main visualization surface where collected and processed data is returned to the user in a readable and interactive way.

### 3. Backend service flow

The backend API is the main server-side entry point for client requests. Incoming requests pass through initial middleware for JWT verification, CORS handling, and rate limiting before being routed to the appropriate controllers.

Controllers validate inputs, interact with the database, call dedicated services such as streaming/event publication, and build standardized HTTP responses. Final middleware layers then handle structured logging, security headers, and wrapped error formatting.

### 4. Data and event processing

The data layer is designed to support preprocessing of raw data, PII detection and de-identification, structured manipulation, and exploratory modeling. NumPy and Pandas are positioned for numeric and dataframe operations, while Scikit-learn is used for first machine-learning experiments such as KNN, K-means, logistic regression, decision trees, random forests, and SVM.

Kafka is used as an event-transport mechanism, and Spark is positioned for local batch and streaming treatment while interacting with Cassandra for analytical workloads.

## Security boundaries

| Boundary | Protection logic |
|----------|------------------|
| Browser to backend | HTTPS/TLS, authenticated requests, controlled session handling  |
| Frontend auth flow | Email-based 2FA, JWT session validation, HttpOnly cookies  |
| Backend exposure | Restricted middlewares, rate limiting, validation, security headers  |
| Server-to-server communication | Whitelisting and SSL/TLS on internal exchanges  |
| Secrets and configuration | `.env` in development, GitHub Secrets and vaults in production  |
| Sensitive data processing | De-identification strategy and segmented analytical architecture  |

## Deployment-oriented view

The architecture separates roles across frontend, backend, VPN, broker, worker, and analytical infrastructure. Backend servers are intended to remain behind IP whitelists, while only the minimum required public ports are opened on frontend and VPN-facing machines.

This design shows a controlled exposure model rather than a flat architecture, which is a strong point for the Technical Track objective.
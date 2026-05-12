# Quality and Testing

## Purpose

This document describes the quality assurance and testing strategy used for Datalyz. It explains how the project enforces code quality, validates critical behaviors, and reduces the risk of regressions across its architecture.

The objective is to demonstrate that Datalyz is engineered with reliability in mind, not only feature delivery.

## Quality goals

For Objective 02, quality is not limited to code formatting. It includes:

- readable and maintainable code
- consistent conventions
- automated checks
- validation of critical modules
- error handling
- structured logging
- secure configuration and development practices

This means quality must be visible in both the codebase and the delivery workflow.

## Quality standards

The project documentation and Technical Track expectations imply that Datalyz should enforce clear engineering standards on the main codebases.

These standards should cover:

- naming conventions
- module structure
- linting rules
- typing when relevant
- error-handling conventions
- configuration separation
- documentation of commands and prerequisites

Because Datalyz mixes several technical stacks, each layer should apply the quality tools that best match its ecosystem.

## Recommended quality tooling by layer

| Layer | Main tools or practices | Goal |
|-------|--------------------------|------|
| Frontend / extension | ESLint, formatting rules, component conventions | keep Vue and extension code consistent |
| Backend Go API | `go test`, linting, structured logging, config validation | enforce correctness and maintainability |
| Data-processing layer | Pylint or equivalent, test scripts, notebook/script discipline | reduce fragile analytical code |
| Global repository | GitHub Actions, SonarQube, TruffleHog | automate checks, detect smells and leaks |

## TruffleHog

TruffleHog complements quality work by focusing on secret exposure.

Its role is to detect accidentally committed:

- API keys
- passwords
- tokens
- other sensitive credentials

Although it is often categorized as a security tool, it is also part of development quality because it prevents unsafe repository practices.

## CI-based validation

GitHub Actions are part of the quality and testing strategy, not only the deployment flow.

The documented expectations are that automated workflows should run on a matrix of operating systems and validate several things:

- the code builds correctly
- the code runs correctly
- unit tests pass
- functional or validation tests pass
- changes do not introduce regressions

This is important because a quality strategy is much stronger when checks are automatic and repeatable.

## Test strategy

Datalyz documents a three-part testing policy.

### 1. Unit tests

Unit tests validate isolated pieces of logic such as functions, methods, parsers, service helpers, validation rules, or business logic blocks.

Their main benefits are:

- fast execution
- fast feedback to developers
- easier debugging
- earlier defect detection

They are especially useful for authentication helpers, data transformation utilities, middleware behavior, and extension-side signal parsing.

### 2. Integration tests

Integration tests validate that modules or services behave correctly together.

For Datalyz, useful integration scopes include:

- frontend to backend authentication flow
- backend to PostgreSQL CRUD behavior
- backend to Kafka event publication
- backend middleware chain behavior
- extension data submission to API
- dashboard rendering from real or seeded API payloads

These tests are critical because the project is modular and several failures can appear only at the interaction level.

### 3. Performance tests

Performance tests are used to detect bottlenecks and evaluate how the system behaves under load.

Their purpose is to verify that Datalyz remains responsive when the number of requests, data events, or processed records increases. They are also useful for future Technical Track work related to performance optimization.

## Critical modules to prioritize

The Technical Track requires tests on at least one critical module. For Datalyz, the most defensible critical modules are the following:

| Critical module | Why it matters |
|-----------------|----------------|
| Authentication flow | protects user access and session integrity |
| Backend middleware chain | centralizes JWT validation, CORS, rate limiting, headers, and logging |
| Extension capture logic | directly impacts the correctness of collected browsing data |
| Data preprocessing pipeline | affects privacy protection and analytical quality |
| Dashboard data rendering | affects user trust and interpretation of results |

## Suggested test mapping

### Authentication flow

Recommended validations:

- valid login accepted
- invalid credentials rejected
- 2FA code required when expected
- expired or invalid JWT rejected
- secure cookie behavior verified

### Backend middleware chain

Recommended validations:

- unauthorized access blocked
- rate limit applied correctly
- malformed payload rejected cleanly
- security headers present
- structured errors returned consistently

### Extension capture logic

Recommended validations:

- event capture produces expected payload format
- excluded sites are ignored
- consent settings disable prohibited collection
- time and interaction metrics are recorded correctly

### Data preprocessing pipeline

Recommended validations:

- irrelevant raw fields removed
- PII detection flags expected patterns
- de-identification masks sensitive values correctly
- transformed datasets remain usable for analysis

## Reliability practices

Quality is also supported by operational practices outside direct test code.

These practices include:

- structured JSON logging in the backend
- standardized error wrapping
- environment separation
- secret management outside the repository
- containerized runtime consistency through Docker
- automated workflow execution through GitHub Actions

Together, these measures reduce the probability of silent failures and make issues easier to diagnose.

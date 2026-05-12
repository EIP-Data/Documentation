# Deployment and Environments

## Purpose

This document explains how Datalyz is deployed, how environments are separated, how secrets and configuration are handled, and how delivery is automated from source code to running services.

The goal is to show that Datalyz is not only a functional student project, but also a reproducible technical system that can be built, tested, deployed, updated, and monitored in a controlled way.

## Deployment philosophy

Datalyz follows an infrastructure-first approach. The platform is composed of several technical bricks with different responsibilities: browser extension, frontend website, backend API, data-processing components, messaging, databases, and a mobile VPN/proxy path.

Because these components do not have the same runtime constraints, the project uses environment separation, infrastructure-as-code, containerization, configuration management, and CI/CD automation.

## Environment model

Datalyz distinguishes at least two main environments:

- **Development**: local and team-controlled environment used to build, test, and iterate quickly.
- **Production**: deployed environment used to run the actual services with stronger security guarantees and controlled secret management.

A future staging environment can also be added between development and production to validate full deployments before release.

## Development environment

In development, environment variables are stored in a `.env` file kept outside the distributed source code. This allows each developer to work with local credentials, API endpoints, and service-specific settings without hardcoding secrets in the repository.

Typical development configuration includes:

- API base URLs
- database credentials
- JWT configuration
- Kafka connection settings
- local service ports
- feature flags for debug or test behavior

This approach keeps the project configurable while limiting accidental exposure of sensitive values.

### Local runtime expectations

The development environment should allow contributors to start the main parts of the platform independently or together:

- frontend website
- browser extension
- backend API
- local PostgreSQL instance
- optional Kafka and Spark services
- optional worker services

Docker is used to standardize the runtime and reduce dependency drift between developers.

## Production environment

Production is designed with stricter controls than development.

Sensitive values are not stored in plaintext inside the repository. Instead, production secrets are managed through GitHub Secrets and vault-based secret storage. This improves confidentiality, reduces leak risk, and enables better access control and auditability.

The production environment is also designed with a limited exposure model:

- backend servers are protected through IP whitelisting
- only required public ports are opened
- internal server-to-server exchanges use TLS
- frontend and VPN hosts expose only the ports needed for service access

## Infrastructure and provisioning

Datalyz uses **Terraform** to describe and provision infrastructure.

Terraform is responsible for creating or managing technical resources such as:

- server instances
- databases
- network-level components
- load-balancing or routing resources when needed

Using `.tf` files makes the infrastructure reproducible, reviewable, and versioned. It also reduces manual setup errors.

## Configuration and deployment automation

Once infrastructure is provisioned, **Ansible** is used to configure servers and orchestrate deployment steps.

Ansible is responsible for tasks such as:

- installing dependencies
- preparing runtime directories
- configuring services
- updating environment files
- restarting services safely
- deploying backend and frontend artifacts
- updating Docker-based services with minimal downtime

This separation between Terraform and Ansible keeps the deployment process clear:

- Terraform creates the infrastructure
- Ansible configures and deploys the software

## Containerization

Docker is part of the deployment strategy to ensure consistency between development, test, and production environments.

The main benefits for Datalyz are:

- identical runtime behavior across environments
- simpler dependency management
- easier service packaging
- faster redeployment and rollback
- cleaner separation between services

Where relevant, services can be packaged as Docker images and deployed as versioned artifacts.

## CI/CD workflow

Datalyz defines an automated delivery pipeline based on **GitHub Actions**, **Terraform**, and **Ansible**.

### Triggering policy

A merge or push on the `main` branch triggers an automated GitHub Action.

Depending on the component concerned, the pipeline executes the relevant actions for:

- backend
- frontend
- extension
- worker or supporting services

### Pipeline stages

The deployment pipeline is organized in the following phases:

1. **Build and tests**  
   Compile the code, validate Docker images, and execute test suites.

2. **Packaging and versioning**  
   Produce artifacts such as bundles, archives, or Docker images, then tag the version.

3. **Provisioning and configuration**  
   Apply Terraform to the infrastructure and use Ansible to prepare the machines.

4. **Deployment**  
   Deliver the application components to their target environment.

5. **Monitoring**  
   Observe runtime behavior through logs and metrics.

## Repository integration constraints

Because the team works with an external organization structure and an Epitech repository flow, GitHub Actions are also used to synchronize validated code into the Epitech repository structure.

The expected workflow is:

- a push on the organization repository triggers automation
- validated content is pushed into the Epitech repository
- each part is placed in the correct subfolder, such as backend, frontend, worker, or extension

This supports traceability and keeps the school submission workflow aligned with the real project repository.

## Extension delivery model

The browser extension has a specific delivery path.

The documented strategy is:

- Chrome and Firefox can rely on official store publication workflows through WXT publishing
- Safari and other browsers may rely on self-hosting or manual installation

This is important because extension deployment is not identical to traditional web deployment and must be documented separately.

## Network exposure policy

The infrastructure follows a restrictive network model.

### Backend servers

Backend-related servers include:

- API backend
- user database
- message broker
- Spark database or analytical storage
- worker services

These servers are not intended to be broadly exposed. Access is restricted through IP whitelisting so only authorized machines and approved developer IPs can communicate with them.

### Frontend and VPN hosts

The frontend server and VPN server require limited public access.

The expected openings are:

- port 80 for the frontend host
- port 51820 for WireGuard on the VPN host

All other ports remain closed by default unless a specific service need is identified and controlled.

### Inter-server communication

Internal communication is opened only when required and remains subject to strict filtering rules. TLS is used to protect confidentiality and integrity between servers.

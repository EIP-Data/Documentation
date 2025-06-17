
.. Datalyz Deployment Guide

======================
Deployment Guide
======================

This document describes the repository setup and the CI/CD pipeline used to build, test, and deploy the Datalyz project.

1. Repository Configuration
--------------------------

Branch Strategy
~~~~~~~~~~~~~~~
The project uses a clear branch strategy to organize development:

*   **main**: Contains stable production code. Each merge into this branch triggers the continuous deployment (CD) pipeline.
*   **develop**: Integration branch for new features.
*   **feature branches**: Dedicated branches for specific features, based on `develop`.

Automation with Epitech Repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A GitHub Action is configured to trigger automatically on each `push` to the `main` branch of the project organization. This action then pushes the code into the corresponding subfolder on the Epitech repository (e.g., `back-end`, `front-end`).

2. CI/CD Pipeline
-------------------

The project relies on a fully automated continuous integration and deployment (CI/CD) pipeline to ensure reliable and fast deliveries.

Tools Used
~~~~~~~~~~
*   **GitHub Actions**: Used as the orchestrator for CI/CD workflow automation.
*   **Terraform**: Used for infrastructure provisioning and management as code (`.tf` files). Secrets and environment variables are managed via Terraform and GitHub Secrets.
*   **Ansible**: Used for server configuration, dependency installation (like Docker), and application deployment.
*   **Docker**: Standardizes environments by encapsulating applications and their dependencies, ensuring consistency across development, testing, and production.

Deployment Pipeline
~~~~~~~~~~~~~~~~~~~
The pipeline is triggered by a merge into the `main` branch and follows these steps:

1.  **Build & Tests**: Code compilation, validation, Docker image creation, and execution of unit and integration tests.
2.  **Packaging & Versioning**: Creation of an artifact (Docker image, WXT bundle) and version tagging with `git tag`.
3.  **Provisioning & Configuration**: Terraform deploys the required infrastructure (servers, databases) and Ansible configures the environments.
4.  **Deployment & Publication**:
    *   The back-end infrastructure is deployed via Docker/Kubernetes, Ansible, and Terraform.
    *   The WXT extension is published to the Chrome and Firefox stores, and self-hosted for other browsers.
5.  **Monitoring**: Logs are continuously monitored using Prometheus and Grafana to ensure system stability.

# Diffusion and Publication Strategy

## Philosophy: Partial-Open Approach
Datalyz adopts a controlled, "partial-open" strategy. We believe in building trust through transparency where appropriate, while strictly protecting our proprietary analytical logic and backend infrastructure.

## What is Public?
- **Web Extension & Frontend**: The client-side code that users install and interact with will be open or partially visible. This builds user trust, allows for community auditing of the data collection methods, and serves as a marketing tool.
- **Public README & API Documentation**: High-level documentation explaining how to interact with the public-facing endpoints of our API.

## What is Protected (Closed)?
- **Backend Logic (Go)**: The proprietary data processing algorithms, internal routing, and worker architectures remain closed-source.
- **Infrastructure Configuration**: Deployment scripts, CI/CD pipelines, `docker-compose.yml` files, and environment variable structures (`.env.example`) are kept private to prevent exposing our operational topology to potential attackers.

## Publication Review Criteria
Before any technical material (code, diagrams, demos, or presentations) is released publicly, it must pass the following three-point check:
1. **Value**: Does it clearly explain the value and innovation of Datalyz?
2. **Security**: Does it avoid exposing sensitive operational details (e.g., server IPs, database schemas, internal network configs)?
3. **Differentiation**: Does it preserve our core technical advantages without giving away the proprietary "secret sauce"?

*If any answer is "no," the material is revised before publication.*
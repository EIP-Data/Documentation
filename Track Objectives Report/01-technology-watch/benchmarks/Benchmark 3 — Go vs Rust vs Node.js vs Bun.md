## Benchmark 3 — Go vs Rust vs Node.js vs Bun

### Problem addressed
Datalyz needs a backend capable of serving a secure REST API, handling authentication, data processing coordination, logging, and future scalability requirements.

### Compared solutions
- Rust
- Go
- Node.js
- Bun

### Evaluation criteria
- Runtime performance
- Latency
- Memory usage
- Learning curve
- Team familiarity
- Backend ecosystem
- Deployment simplicity
- Suitability for a secure API stack

### Findings
Our benchmark compared runtime characteristics such as RPS, latency, and memory usage, and also included practical criteria such as learning curve and team familiarity. For Datalyz, technical fit mattered more than popularity alone because the backend must support authentication, logging, validation, database access, and asynchronous messaging.

### Decision
Go was selected as the best trade-off between performance, simplicity, backend maturity, and team adoption capacity.

### Impact on the project
This decision supports a lightweight and maintainable API architecture aligned with Gin, JWT middleware, PostgreSQL integration, structured logging, and Kafka-based event processing.
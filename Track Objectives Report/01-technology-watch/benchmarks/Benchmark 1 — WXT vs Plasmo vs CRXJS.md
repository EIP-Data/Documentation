## Benchmark 1 — WXT vs Plasmo vs CRXJS

### Problem addressed
Datalyz is a browser extension project that must support a modern development workflow and cross-browser compatibility, especially for Chrome, Firefox and Safari.

### Compared solutions
- WXT
- Plasmo
- CRXJS

### Evaluation criteria
- Cross-browser support
- Manifest V3 support
- Vue / Vite / TypeScript integration
- Configuration management
- Packaging and publishing workflow
- Developer experience
- Internationalization support

### Findings
Our comparison showed that using a dedicated extension framework was relevant for development simplification, multi-browser support, modern tooling integration, easier manifest management, declarative development, and automation of packaging/publication tasks.

### Decision
WXT was selected because it best matched Datalyz’s technical constraints and product scope, especially cross-browser support and integration with our Vue-based extension architecture.

### Impact on the project
This choice reduced configuration overhead, improved maintainability, and aligned the extension with the rest of the project’s frontend tooling.
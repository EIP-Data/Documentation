# Benchmark Table

## Purpose

This document summarizes the benchmark work carried out for Objective 01 of the Technical Track.
Its goal is to compare the main technologies considered for Datalyz, document the criteria used for evaluation, and justify the final technical decisions retained in the project.

## Global summary

| Technical layer | Compared options | Main evaluation criteria | Retained choice | Main reason for selection |
|----------------|------------------|--------------------------|-----------------|---------------------------|
| Browser extension framework | WXT / Plasmo / CRXJS | Multi-browser support, modern tooling integration, configuration, automation, maintainability | **WXT** | Best fit for a cross-browser extension integrated with a modern Vue/Vite stack |
| Frontend framework | Vue.js / React / Angular | Development speed, readability, component model, ecosystem, maintainability, bundle size | **Vue.js** | Best balance between simplicity, modularity, and integration with the extension/dashboard architecture |
| Backend language/runtime | Rust / Go / Node.js / Bun | Learning curve, familiarity, runtime performance, memory usage, maintainability | **Go** | Strong trade-off between performance, simplicity, backend maturity, and team adoption |
| Data processing and analysis | Python | Accessibility, community, ecosystem, ML/NLP libraries, versatility | **Python** | Best ecosystem for preprocessing, exploratory analysis, and first ML experiments |

---

## 1. Browser extension framework benchmark

### Context

Datalyz is built around a browser extension that must support a modern frontend workflow and cross-browser compatibility, especially for Chrome, Firefox, and Safari.

### Compared solutions

| Option | Type | Notes |
|--------|------|-------|
| WXT | Extension framework | Selected in the current Datalyz architecture |
| Plasmo | Extension framework | Considered as an alternative |
| CRXJS | Extension tooling | Considered as an alternative |

### Evaluation criteria documented in the benchmark material

| Criterion | Why it matters for Datalyz |
|----------|-----------------------------|
| Development simplification | Faster implementation and easier maintenance of the extension |
| Multi-browser support | Datalyz targets several browsers |
| Integration with modern technologies | Needed for Vue, Vite, TypeScript, and modern tooling |
| Configuration management | Important for manifest and content script management |
| Declarative development | Reduces low-level extension boilerplate |
| Task automation | Useful for packaging, publication, and deployment workflows |

### Comparative summary

| Criterion | WXT | Plasmo | CRXJS |
|----------|-----|--------|-------|
| Development simplification | Strong | Moderate | Moderate |
| Multi-browser support | Strong | Strong | More limited |
| Integration with Vue / Vite / TypeScript | Strong | Good | Good |
| Configuration management | Strong | Good | More manual |
| Declarative development | Strong | Moderate | More manual |
| Packaging / publication automation | Strong | Partial | Partial |

### Decision

| Retained choice | Decision rationale |
|-----------------|-------------------|
| **WXT** | WXT was selected because it best matches Datalyz’s extension constraints: cross-browser support, Vue integration, simplified configuration, and a more maintainable development workflow. |

---

## 2. Frontend framework benchmark

### Context

Datalyz uses a frontend stack for the popup, dashboard, preferences pages, and public-facing interfaces.
The selected framework had to work well with a component-based architecture and remain simple enough to maintain across multiple interfaces.

### High-level comparison

| Feature | Vue.js | Angular | React |
|--------|--------|---------|-------|
| Primary use case | Small to medium applications | Large-scale enterprise applications | Wide range from websites to enterprise |
| Language support | JavaScript | TypeScript (but supports JavaScript) | JavaScript |
| Learning curve | Low, easy to learn | Steep due to reliance on other technologies (RxJS, etc.) | Moderate, especially with JSX |
| Built-in tools | Fewer built-in tools, more reliance on third-party libraries | Comprehensive set (routing, forms, HTTP requests) | Fewer built-in tools, but flexible through libraries |
| Rendering | Supports SSR through Nuxt.js | Supports SSR via Angular Universal | Supports SSR with Next.js, Gatsby, React Server Components |
| State management | Pinia, Vuex | NgRx | Context API, Redux, MobX |
| Performance optimization | Lazy loading, event handling optimization | AOT compilation, OnPush change detection | Memoization with `useMemo`, immutable state management |
| Community and ecosystem | Thriving, but smaller than React | Strong community, broad ecosystem with third-party tools | Vast ecosystem with numerous libraries and frameworks |
| Mobile development | Vue Native (deprecated) | Possible but not native-focused | React Native for native mobile app development |
| Bundle size (gzipped) | **34.7 KB** | **62.3 KB** | **44.5 KB** |

### Additional frontend criteria used in the project benchmark

| Criterion | Why it matters for Datalyz |
|----------|-----------------------------|
| Development speed | Needed for fast iteration on popup and dashboard |
| Component system | Important for reusable UI blocks |
| Code readability | Makes long-term maintenance easier |
| Code reuse | Shared logic across pages and interfaces |
| External libraries | Important for charts, i18n, cookies, and state management |

### Decision

| Retained choice | Decision rationale |
|-----------------|-------------------|
| **Vue.js** | Vue.js was retained because it provides a strong balance between readability, developer productivity, modularity, and compatibility with the WXT-based extension architecture and the dashboard frontend stack. |

### Project integration

| Integrated tools in Datalyz frontend | Purpose |
|--------------------------------------|---------|
| Vue.js 3 | Main UI framework |
| Vue Router | Navigation between views |
| Pinia | State management |
| TailwindCSS | Styling |
| Vue-i18n / @wxt-dev/i18n | Internationalization |
| ApexCharts / Vue3-ApexCharts | Interactive charts |

---

## 3. Backend language benchmark

### Context

Datalyz requires a backend capable of serving a secure API, handling authentication, managing logs, connecting to PostgreSQL, and integrating asynchronous messaging and deployment automation.

### Practical comparison

| Criterion | Rust | Golang | Node.js | Bun |
|----------|------|--------|---------|-----|
| Garbage collector | No | Yes | Yes | Yes |
| Learning curve | Slow | Fast | Fast | Fast |
| Team familiarity (number of people) | 0 | 2 | 4 | 0 |
| Derived from Node.js | No | No | No | Yes |

### Runtime benchmark

| Language / Runtime | RPS | Latency (ms) | Memory usage (MB) |
|--------------------|-----|--------------|-------------------|
| Rust | 110,000 | 2.5 ms | 50 MB |
| Go | 90,000 | 3.0 ms | 55 MB |
| Bun | 80,000 | 4.0 ms | 60 MB |
| Node.js | 45,000 | 8.0 ms | 100 MB |

### Additional backend criteria used in the project

| Criterion | Why it matters for Datalyz |
|----------|-----------------------------|
| Backend ecosystem | JWT, middleware, logging, PostgreSQL, messaging, configuration |
| Deployment simplicity | Important for CI/CD and infrastructure automation |
| Maintainability | Critical for a long-term academic and technical project |
| Security integration | Required for auth, cookies, rate limiting, and structured logging |
| Scalability potential | Important for future API and data-processing growth |

### Decision

| Retained choice | Decision rationale |
|-----------------|-------------------|
| **Go** | Go was selected because it offers a strong compromise between performance, simplicity, memory efficiency, backend maturity, and adoption capacity within the team. |

### Project integration

| Integrated tools in Datalyz backend | Purpose |
|------------------------------------|---------|
| Go 1.24 | Backend language |
| Gin | REST API framework |
| JWT | Authentication |
| PostgreSQL + GORM | Persistence |
| Zerolog | Structured logging |
| Kafka (Sarama) | Asynchronous messaging |
| Viper | Configuration management |
| Swaggo | API documentation |

---

## 4. Data processing and analysis benchmark

### Context

Datalyz also includes a data-processing layer dedicated to preprocessing, de-identification, exploratory analysis, and early machine-learning experiments on collected browsing data.

### Current documented rationale for Python

| Criterion | Python | Relevance for Datalyz |
|----------|--------|-----------------------|
| Accessibility | Easy to learn and use | Lowers entry cost for experimentation and iteration |
| Community | Very large developer base | Easier documentation, support, and ecosystem access |
| Library ecosystem | Very strong | Supports NumPy, Pandas, Scikit-learn, spaCy, PyTorch, and similar tools |
| Versatility | High | Can be used for preprocessing, NLP, predictive analysis, and ML workflows |
| Performance | Balanced | Good trade-off between simplicity and effectiveness for EDA and first models |

### Data-oriented libraries planned in Datalyz

| Library / tool | Role in the project |
|----------------|---------------------|
| NumPy | Numerical computing and matrix operations |
| Pandas | Structured data manipulation and aggregation |
| Scikit-learn | Classical machine learning for first experiments |
| spaCy | NLP / NER support |
| Presidio (considered) | PII detection and de-identification support |

### Decision

| Retained choice | Decision rationale |
|-----------------|-------------------|
| **Python** | Python was selected because it provides the most appropriate ecosystem for preprocessing, exploratory analysis, PII-related workflows, and first machine-learning experiments in Datalyz. |

### Benchmark limitation

| Point | Status |
|------|--------|
| Direct side-by-side benchmark against R / Scala / Java stack | Not documented yet |
| Quantitative memory / latency benchmark for data-processing layer | Not documented yet |
| POC comparison notebook across multiple analysis languages | Not documented yet |

---

## Final retained stack

| Layer | Retained technology | Main justification |
|------|----------------------|-------------------|
| Extension | **WXT** | Best fit for cross-browser extension development |
| Frontend | **Vue.js** | Best balance between simplicity and modularity |
| Backend | **Go** | Best trade-off between performance and maintainability |
| Data processing | **Python** | Best ecosystem for analysis and experimentation |

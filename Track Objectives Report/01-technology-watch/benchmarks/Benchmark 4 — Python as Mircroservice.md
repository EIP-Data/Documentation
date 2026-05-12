## Benchmark 4 — Python for data processing and analysis

### Problem addressed
Datalyz needs a language and ecosystem for preprocessing, de-identification, exploratory analysis, and first machine-learning experiments on collected user data.

### Compared solutions
- Python
- R
- Java / Scala-oriented data stack

### Evaluation criteria
- Accessibility and learning curve
- Ecosystem for EDA
- NLP and PII detection libraries
- Classical machine-learning support
- CPU execution suitability
- Integration with the existing project stack

### Findings
Python stood out for accessibility, community size, ecosystem richness, versatility, and a strong balance between ease of use and practical performance. This was especially relevant for Datalyz because the project plans to use NumPy, Pandas, scikit-learn, spaCy, and possibly Presidio.

### Decision
Python was selected as the main language for preprocessing and exploratory analysis.

### Impact on the project
This choice accelerates experimentation, supports de-identification workflows, and reduces friction for implementing analysis features without requiring heavy infrastructure from the start.

.. Datalyz Technology Environment

===========================
Technology Environment
===========================

This document describes the technological environment of the Datalyz project, including technologies, infrastructure, and hardware requirements.

1. Technologies & Libraries
--------------------------

Web Extension
~~~~~~~~~~~~~
*   **Framework**: WXT, Vue.js 3, Vite.
*   **State Management**: Pinia with `Pinia Plugin Persisted State`.
*   **Routing**: Vue Router.
*   **Styling**: TailwindCSS, PostCSS.
*   **Visualization**: ApexCharts.
*   **Internationalization**: Vue-i18n, @wxt-dev/i18n.

Frontend (Dashboard & Landing Page)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*   **Framework**: Vue.js 3, Vite.
*   **State Management & Requests**: Pinia, Axios.
*   **Styling & Animations**: TailwindCSS, AOS (Animate On Scroll).
*   **Data Visualization**: ApexCharts & Vue3-ApexCharts.
*   **Cookie Management**: Vue3-Cookies.

Backend
~~~~~~~
*   **Language & Framework**: Go 1.24.0, Gin.
*   **Database & ORM**: PostgreSQL, GORM.
*   **Security & Authentication**: JWT (golang-jwt/jwt/v5), Crypto.
*   **Messaging & Events**: Apache Kafka (via Sarama).
*   **Configuration**: Viper.
*   **Logs**: Zerolog.

Data Processing and Analysis
~~~~~~~~~~~~~~~~~~~~~~~~~~~
*   **Data Manipulation**: NumPy, Pandas.
*   **Machine Learning**: Scikit-learn for exploratory analysis and modeling (K-NN, K-means, regressions, etc.).
*   **Data Streaming**: Spark.
*   **NoSQL Database**: Cassandra.

2. Infrastructure & Deployment
-----------------------------

Server Architecture
~~~~~~~~~~~~~~~~~~~
*   **Back-end Servers**: Include the application backend, user database (PostgreSQL), message broker (Kafka), Spark, Cassandra, and workers. Their IP addresses are whitelisted for security.
*   **Front-end and VPN Servers**: The front-end server is accessible via port 80 and the VPN server (WireGuard) via port 51820.
*   **Communication Security**: All inter-server communications are encrypted via SSL/TLS.

Deployment
~~~~~~~~~~
*   **Containerization**: Docker.
*   **CI/CD Orchestration**: GitHub Actions.
*   **Infrastructure Provisioning**: Terraform.
*   **Configuration Management**: Ansible.

Service Dependencies
~~~~~~~~~~~~~~~~~~~~
*   **Relational Database**: PostgreSQL.
*   **NoSQL Database**: Cassandra, used by Spark.
*   **Message Queue**: Apache Kafka for asynchronous data streaming.

3. Hardware Requirements
------------------------

The project requires server infrastructure to host the various components:
*   One or more servers for the Go backend and associated services (databases, Kafka).
*   One server for the Vue.js frontend.
*   One dedicated server for the VPN service (WireGuard).

No other specific hardware is required for the project.

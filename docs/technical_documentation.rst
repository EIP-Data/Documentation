Technical Environment Documentation
===================================

.. image:: /images/architecture.png
   :alt: Architecture Diagram
   :align: center
   :width: 900
   :height: 400

Overview
--------
This document describes the technical architecture and components of our user navigation tracking system.

System Components
----------------

1. WXT/VPN Extension
~~~~~~~~~~~~~~~~~~~~
**Role**:
- Collects user browsing information
- Acts as data collection endpoint

**Technologies**:
- Browser extension framework
- VPN connection

2. User Interface
~~~~~~~~~~~~~~~~
**Role**:
- Provides user access to navigation summaries
- Displays analytics and usage reports
- Interactive dashboard for data visualization

**Technologies**:
- Vue for web

3. API Layer (Go/Gin)
~~~~~~~~~~~~~~~~~~~~~
**Role**:
- Handles all UI-related transactions
- Manages business logic
- Routes requests between components

**Technologies**:
- Go programming language
- Gin web framework

4. Message Broker (Kafka)
~~~~~~~~~~~~~~~~~~~~~~~~
**Role**:
- Manages incoming data streams
- Ensures reliable message delivery
- Buffers data between producers/consumers

**Technologies**:
- Apache Kafka

5. PostgreSQL Database
~~~~~~~~~~~~~~~~~~~~~
**Role**:
- Manages user access control
- Stores authentication data
- Handles application permissions

**Technologies**:
- PostgreSQL RDBMS
- Role-based access control

6. Spark Processing
~~~~~~~~~~~~~~~~~~
**Role**:
- Optimizes worker transactions
- Processes large datasets
- Performs distributed computations

**Technologies**:
- Apache Spark
- Cluster computing framework

7. Workers
~~~~~~~~~
**Role**:
- Analyze navigation data
- Process and transform raw data
- Prepare data for storage

**Technologies**:
- Python services
- Containerized deployment

8. Cassandra Database
~~~~~~~~~~~~~~~~~~~~
**Role**:
- Stores user navigation data
- Handles time-series data
- Provides scalable storage

**Technologies**:
- Apache Cassandra
- Wide-column NoSQL database

Data Flow
---------
1. User browsing → WXT/VPN collection
2. Raw data → Kafka message broker
3. Spark → Optimizes distribution to workers
4. Workers → Process and analyze data
5. Processed data → Cassandra storage
6. PostgreSQL → Manages who can access what
7. API → Serves data to UI upon request
8. UI → Presents information to end user
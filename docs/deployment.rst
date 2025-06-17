.. Datalyz Deployment Guide

======================
Guide de Déploiement
======================

Ce document décrit la configuration du dépôt et le pipeline CI/CD utilisé pour construire, tester et déployer le projet Datalyz.

1. Configuration du Dépôt
--------------------------

Stratégie de Branches
~~~~~~~~~~~~~~~~~~~~~
Le projet utilise une stratégie de branches claire pour organiser le développement :

*   **main** : Contient le code de production stable. Chaque fusion (merge) dans cette branche déclenche le pipeline de déploiement continu (CD).
*   **develop** : Branche d'intégration pour les nouvelles fonctionnalités.
*   **feature branches** : Branches dédiées au développement de fonctionnalités spécifiques, basées sur `develop`.

Automatisation avec le Dépôt Epitech
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Une GitHub Action est configurée pour se déclencher automatiquement à chaque `push` sur la branche `main` de l'organisation du projet. Cette action effectue ensuite un `push` du code dans le sous-dossier correspondant sur le dépôt Epitech (ex: `back-end`, `front-end`).

2. Pipeline CI/CD
-------------------

Le projet s'appuie sur un pipeline d'intégration et de déploiement continus (CI/CD) entièrement automatisé pour garantir la fiabilité et la rapidité des livraisons.

Outils Utilisés
~~~~~~~~~~~~~~~
*   **GitHub Actions** : Utilisé comme orchestrateur pour l'automatisation des workflows de CI/CD.
*   **Terraform** : Employé pour le provisionnement et la gestion de l'infrastructure en tant que code (`.tf` files). Les secrets et variables d'environnement sont gérés via Terraform et GitHub Secrets.
*   **Ansible** : Utilisé pour la configuration des serveurs, l'installation des dépendances (comme Docker) et le déploiement des applications.
*   **Docker** : Standardise les environnements en encapsulant les applications et leurs dépendances, assurant la cohérence entre le développement, les tests et la production.

Pipeline de Déploiement
~~~~~~~~~~~~~~~~~~~~~~~
Le pipeline est déclenché par une fusion sur la branche `main` et suit les étapes suivantes :

1.  **Build & Tests** : Compilation du code, validation, création des images Docker et exécution des tests (unitaires, intégration).
2.  **Packaging & Versioning** : Création d'un artefact (image Docker, bundle WXT) et étiquetage de la version avec `git tag`.
3.  **Provisionnement & Configuration** : Terraform déploie l'infrastructure nécessaire (serveurs, bases de données) et Ansible configure les environnements.
4.  **Déploiement & Publication** :
    *   L'infrastructure back-end est déployée via Docker/Kubernetes, Ansible et Terraform.
    *   L'extension WXT est publiée sur les stores Chrome et Firefox, et auto-hébergée pour les autres navigateurs.
5.  **Monitoring** : Les logs sont surveillés en continu à l'aide de Prometheus et Grafana pour assurer la stabilité du système.

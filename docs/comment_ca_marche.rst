========================
Comment ça marche ?
========================

**Le schéma suivant illustre le fonctionnement du partage et de la monétisation des données sur la plateforme.**

.. mermaid::

    flowchart TD
        User(Utilisateur)
        subgraph "Chromium Extension"
            User -->|Donne son consentement| Collecte[Collecte de données]
        end
        subgraph "Back End"
            Collecte --> Traitement(Traitement)
            Traitement --> Securite(Sécurité des données & conformité)
            Securite --> Stockage[Stockage des données]
        end
        subgraph "Front End"
            Stockage --> Dashboard{Dashboard Utilisateur}
            Dashboard --> E[Gestion des accès]
            Dashboard --> G[Audit et traçabilité]
        end
..

Explication du Diagramme
------------------------

1. **Consentement de l'utilisateur :**
   Le processus commence avec l'utilisateur qui donne son consentement explicite pour le partage de certaines données.

2. **Collecte de données :**
   Les données sont collectées tout en respectant les règles de sécurité et de conformité.

3. **Tableau de bord utilisateur :**
   L'utilisateur a accès à un tableau de bord où il peut visualiser et contrôler ses données.

4. **Définition des règles d'accès :**
   L'utilisateur peut définir les conditions de partage (avec qui, quelles données, pour combien de temps).
5. **Sécurité et conformité :**
   La plateforme garantit la sécurité des données, la conformité aux réglementations (RGPD), et un suivi d’audit.


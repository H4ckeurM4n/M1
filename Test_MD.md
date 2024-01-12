<details>
<summary># III - Modélisation d'un SOC</summary>
Entrée : Analyse de la menace : CTI & Donnée d'environnement : Données système et donnée réseau > SOC > Sortie : Incidents identifiés / remédiés 

  <details>
  <summary>## Activités principales & auxiliaires du SOC</summary>
  - Activités principales :
    - Collecter de la donnée (Qu'est-ce qui se passe sur mon réseau/système ?)
    - Détecter la donnée (Identifier items d'intérêts sur la donnée collectée)
    - Trier les alertes (Prioriser et confirmer les alertes)
    - Investiguer (Levée de doute ou escalade)
    - Répondre (Répondre et minimiser les impacts)
  - Activités auxiliaires :
    - CTI : En collectant des info et de la donnée en vue d'améliorer la détection de l'attaque
    - Forensics
    - Amélioration continue : Pentest, revue des vuln

    ### 1 - La collecte de la donnée 
    Entrée : Activité Système & Réseau > Collecte > Sortie : Evénements / télémetrie 
    - Entrée : Activité des composants du SI
    - Sortie : Logs, metadata, netflow, trafic réseau
    - Responsable : Ingénieur Data, administrateur, infra
    - Objectif : Collecter de l'activité d'intérêt

    ### 2 - La détection
    Entrée : CTI, événements de sécu > Détection > Sortie : Alertes
    - Entrée : Activité réseau et système + CTI
    - Sortie : Alertes
    - Responsable : Ingénieur détection, Analyste SOC, Threat Hunter
    - Objectif : Identifier les événements malicieux potentiels

    ### 3 - Le tri 
    Entrée : Alertes... > Tri > Sortie : Alertes priorisées 
    - Entrée : Alerter 
    - Sortie : Alertes classées et priorisées 
    - Responsable : Analystes SOC
    - Objectif : Identifier les alertes importantes et dangereuses, bonne gestion de la file d'attente 

    ### 4 - L'investigation 
    - Entrée :  
    - Sortie :    
    - Responsable : 
    - Objectif : 
  </details>
</details>

# I - SOC

## Présentation SOC
### Particularités du Cyberespace
- Si en évolution perpetuelle et rapide : Faire vite et bien, nouvelle techno, obsolescence, vulnérabilités 
- Perimètre protéiforme : Classification du SI, infogérance, emprises multiples
> La défense du cyberespace c'est suivre, prendre en compte et s'adapter en permanence à toutes ces évolutions

### Cheminement vers la cyberdéfense
- Cyberprotection > Management de la sécurité des SI > Cyberattaque

## Grands principes de la défense
### Fondements de la LID
- Connaitre son environnement : Avoir des plans à jour, données actualisées en temps réels
- Identifier l'adversaire : Agents formés ? Script kiddies ? Adapter sa réponse
- Capter de l'information
- Analyser l'information : Faire abstraction, pragmatisme, adaptation outils différents
- Alerter et réagir

### Les mêmes principes appliqués au cyberespace
- Connaissance du terrain
- Connaitre les individus

### Les fondations pour défense un SI
- Hygiène informatique : Formation users, documentations, 

### Les chemins vers la cyberdéfense
- Evolution de la pensée, de la maturité

## La détection 
### La détection dans la LID
- Anticiper : S'organiser, connaitre son env et ses ennemis
- Détecter : Identifier malveillance, alerter 
- Répondre : Analyser, traquer l'adversaire, comprendre, remédier

### Objectifs de la détection
1. Mettre en évidence : Un événement redouté, présence adverse
2. Identifier le risque : Potentielle, tentée, avérée
3. Recherche : Traces, failles de sécurité

## Etapes clefs
1. Terrain à défendre : Pas qu'informatique, comprendre la finalité de l'entreprise
2. Adversaire à contrer
3. Objectif à atteindre
4. Capacités à déployer

### Déploiement de capacité
- Ressources humaines : Des hommes, compétences, des formations
- Organisation : Des missions, des rôles et responsabilités...
- Moyens techniques : Produire et collecter l'info, détecter, contextualiser, traiter, analyser, coordonner

### Différents métiers 
- Superviseur : Derrière les consoles, faire la primo analyse n1, h24
- Centre Opérationnel : Prendre en compte l'alerte, et attribuer les moyens de la réponse
- Expert réseau / système

### Guides et référentiels de sécurité 
- Guide d'hygiène de l'ANSSI
- Prestataire  d’audit de la sécurité des systèmes d’information (PASSI)
- Prestataires de détection d’incidents de sécurité (PDIS)
- Prestataire de réponse aux incidents de sécurité (PRIS)

### Obligations légales
- RGPD : Protection des DCP
- NIST SP-800-171
- SOX : Bancaire
- HIPAA

### De l'alerte à l'incident
Être notifie d'une alerte > Caractériser l'alerte en incident > Traiter l'incident
Prise en charge, contenu  > Qualifier, mesurer, prioriser     > Analyser, comprendre, remédier, surveiller

🟠 Etre notifié d'une alerte :

- La prise en charge
- Le contenu doit être précis et conscit
  
🟠 Caractériser l'alerte en incident :

- Qualifier l'alerte
- Mesurer le risque
- Prioriser
  
🟠 Traiter l'incident :

- Analyser
- Comprendre
- Remédier
- Surveiller

### Traiter l'incident 

### Détection dans la réaction : surveiller l'ennemi 
- Pendant le traitement de l'incident : Surveiller les agissement similaires, Identifier vecteurs
- Après le traitement de l'incident : Surveiller les répliques, les résurgences

### On continue et on fait mieux 
- Se préparer : Etendre et approfondir son périmètre de supervision
- Détecter : Améliorer nos process
- Réagir : S'entrainer
- Crise 

# II - De l'anticipation : La nécessaire connaissance de l'état de la menace

## Le concept de la cybermenace 
Des capacités au service d'intention qui cherchent à saisir des opportunités d'agir 

| Capacité | Intentions | Opportunités |
| --------- | --------- | --------- |
| Cellule 1 | Gain financier | Techniques (failles) |
| Cellule 1 | Destabilisation | Contextuelles |
| Cellule 1 | Espionnage | Cellule 2 |

### Capacités : Une amélioration continue des attaquants 

### Intentions : Gain financier, espionnage, déstabilisation restent les principaux objectifs

### Modèle Diamant
- Autre modèle en CTI
- Modèlise les relations entre l'attaquant, son infrastructure, ses capacités et sa victime

  **Utilisation**
- Incident peut être considéré comme terminé seulement si modèle diamnt des étapes 3-7 de la cyber kill chain sont remplis à 75%
- Cette modélisatiob permet : Modéliser ce que l'on sait, surtout ce que l'on ne sait pas, ce qu'il reste à investiguer 

# III - Modélisation d'un SOC
Entrée : Analyse de la menace : CTI & Donnée d'environnement : Données systèmee et donnée réseau > SOC > Sortie : Incidents identifiés / remédiés 

## Actvités principales & auxiliaires du SOC 
- Activités principales :
Collecter de la donnée (QU'est-ce qui se passe sur mon réseau/système?)
Détecter la donnée (Identifier items d'intérêts sur la donnée collectée)
Trier les alertes (Prioriser et confirmer les alertes)
Investiguer (Levée de doute ou escalade)
Répondre (Répondre et minimiser les impacts
- Activité auxiliaires :
CTI : En collectant des info et de la donnée en vue d'améliorer la détection de l'attaque
Forensics
Amélioration continue : Pentest, revue des vuln
  
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
 Entrée : Alertes identifiées et choisies > Investigation > Sortie : Faux positifs / Alertes validées 
- Entrée : Alertes prioritaires identifiées 
- Sortie : Confirmation de l'attaque et/ou de l'incident ou identification du faux positif 
- Responsable : Analystes SOC
- Objectif : Accélérer et vérifier rapidement le contenu de l'alerte en tant que vrai ou faux positif

### 5 - La réponse à incident 
 Entrée : Alertes validées > Réponse à incident > Sortie : Remédiation réalisée / RETEX
- Entrée : Incidents / attaques confirmés ou demande d'identification de faux positif (levée de doute)
- Sortie : Remédiation réalisée / identification de faux positif / RETEX
- Responsable : Analystes SOC
- Objectif : Identifier les causes d'un incident / Réaliser une remédiation compléte et rapide 

# Construction d'un SOC
- SOC Large spectre
- Le SOC large spectre
- Le SOC condensé : Pour des entités plus grosses et importantes ou pour le secteur de la défense 
- Le SOC centralisé : Est l'organisation la plus répandu et la moins mature
- Petit SOC
- SOC étendu : Le plus mature


## 2 approches différentes 
### Approche hierarchisée : 
N1 > N2 > N3
- Avantages : Process répétables ey duplicables, S
- Inconvénients :

### Approche à plat 
N1 / N2 / N3 > Analyste leader
- Avantages : Analystes plus heureux, travail varié et créatif, l'évolution pro n'est pas bloquée 
- Inconvénients : Demande la désignation d'un responsable d'équipe, moins de process écrit

## Internalisation ou externalisation 
Prendre en compte le nombre d'users et de terminaux à gérer

## Protection et sécurisation du SOC
Référentiel ANSSI PDIS 
II.2. Architecture du système d’information du service de détection

- Il est également nécessaire de protéger le process de collecte de la donnée, il est ainsi nécessaire de chiffrer et d'authentifier les logs pendant le transfert

- Séparer SI du SOC, et celui du SI de collecte 

Si la taille de l'E, un SOC doit avoir une enclave dédiée pour : 
- Analyser des machines
- Les environnements de tests et les labs
- Accéder aux systèmes et services spécifiques au SOC

Le SOC doit également avoir un accès à internet spécifique pour : 
- Les investigations sensibles, afin de ne pas identifier votre entreprise
- Il est nécessaire d'avoir une séparation physique

## Approches opérationnelles 
1. Analyse a posteriori : S'assurer des données collectées, savoir si l'on a été impacté par une alerte en cours.
2. Recherche du signant : Adresse IP, Hash, User agent
3. Exploiter les signaux forts : Fournis par nos équipements de sécu (Antivirus etc...)
4. Identifier le "hors-normes"
5. Corréler les signaux faibles
6. Approches expérimentales

### Recherche de toutes traces d'une attaque
- Outils utilisés, Escalade de privilège, Mouvement latéral, Mode de découverte, Mode d'exfiltration, Contrôle commande, Mécanisme de persistence, Contournement des défenses, Collecte d'information

### Les problématiques journaux 
- Choisir points de collecte, Produire l'information, Comprendre le de contenu
- identifier l'information utile, Collecter, Volumétrie
- Stockage, Parsing

# Définition du périmètre 
## Services et infrastructures à surveiller (1/4)
**Interconnexions réseaux**
- Interco avec réseau internet, externes tels que partenaires et fournisseurs
- Réseaux internes de même niveau de sensibilité, de sensibilité différente
- Systèmes assurant la distribution des réseaux locaux ou distants (fédérateurs, concentrateurs d'interconnexions...)
- infrastructure de communication sans-fil (Wifi)

**Socle numérique centralisé**
- Services de type bastion d'admin ou de gestion des accès privilégiés
- Infra de messagerie
- Service d'antivirus

**Terminaux**
- Postes de travail des users ou opérateurs
- Dédiés à l'administration des services et infrastructures
- Stations blanches et points d'insertion et d'extraction de données
- Objets connectés

**Systèmes métiers**
- Système de contrôle d'accès, CADIVS
- Services Web

## Définir ce que je veux / dois détecter


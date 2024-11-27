Oui, il est tout à fait possible de retracer ce type d’activité en analysant différents artefacts sur le poste. Voici les étapes et éléments clés à examiner :

1. Identifier les clés USB connectées

	•	Fichiers d’événements Windows :
	•	Les connexions des périphériques USB sont enregistrées dans le journal des événements Windows.
	•	Emplacements à vérifier :
	•	Microsoft-Windows-DriverFrameworks-UserMode/Operational
	•	Microsoft-Windows-Kernel-PnP
	•	Utilisez des outils comme Event Viewer ou un script PowerShell pour rechercher des événements liés à l’ID 2003 (connexion d’un périphérique) ou 2100 (déconnexion).
	•	Clé de registre :
	•	Parcourez : HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR
	•	Les périphériques connectés sont listés ici, avec leur VID/PID, date de connexion, etc.

2. Analyser les transferts de fichiers

	•	Shadow Copies ou Volume Shadow Service (VSS) :
	•	Si le VSS est activé, il peut contenir des versions antérieures des fichiers modifiés, révélant des mouvements de fichiers.
	•	Artefacts de système de fichiers :
	•	MFT (Master File Table) :
	•	Pour les systèmes NTFS, la MFT enregistre les métadonnées des fichiers (création, modification, dernier accès).
	•	Utilisez un outil comme FTK Imager, Autopsy, ou Log2Timeline pour analyser ces métadonnées.
	•	Vérifiez si des fichiers ont été créés ou modifiés à l’heure où les clés USB étaient connectées.
	•	Préfetch Files :
	•	Les fichiers Préfetch (C:\Windows\Prefetch) peuvent contenir des traces de fichiers exécutés depuis ou copiés vers un périphérique USB.
	•	Par exemple, si un fichier exécutable a été transféré depuis ou vers une clé USB, il peut apparaître dans les Préfetch.
	•	Journal USN (Update Sequence Number):
	•	Le journal USN de NTFS enregistre des détails sur les changements de fichiers.
	•	Vous pouvez voir quels fichiers ont été créés, modifiés ou supprimés pendant la session où l’USB était connecté.

3. Rechercher des fichiers temporaires

	•	Lorsque des fichiers sont copiés ou déplacés, des fichiers temporaires peuvent être créés dans des répertoires comme %TEMP% ou %APPDATA%.
	•	Cherchez également dans le cache des applications (comme Microsoft Office ou les navigateurs, si des fichiers étaient ouverts ou téléchargés avant transfert).

4. Analyser l’activité utilisateur

	•	Logs Windows :
	•	Les logs de sécurité peuvent contenir des événements indiquant des accès ou des modifications de fichiers (événements 4663, 4660).
	•	Historique Shellbags :
	•	Les Shellbags (HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU) peuvent montrer l’accès à des répertoires spécifiques, y compris des chemins USB.
	•	Jump Lists :
	•	Les Jump Lists peuvent révéler des fichiers récemment ouverts depuis ou vers un périphérique USB.

5. Utilisation d’outils spécialisés

	•	Logiciels de forensic :
	•	Autopsy : Analyse complète des artefacts.
	•	FTK Imager : Extraction et visualisation des données.
	•	EnCase : Analyse avancée des transferts et activités.
	•	USBDeview : Liste des périphériques USB connectés.
	•	Scripts et frameworks :
	•	Plaso (Log2Timeline) : Permet de générer une chronologie complète des événements.
	•	USB Historian : Analyse rapide des historiques USB.

6. Validation

	•	Une fois les artefacts identifiés, croisez les horaires de connexion des clés USB avec les logs système et les modifications des fichiers pour reconstituer la chaîne d’événements.

Points d’attention :

	•	Si un effacement a eu lieu (fichiers supprimés, traces nettoyées), vous pouvez tenter une récupération avec des outils comme Recuva, TestDisk, ou des fonctions de carving dans des suites forensic.
	•	Pour garantir l’intégrité des preuves, effectuez toujours une image disque avant d’analyser directement le poste.

Pour vérifier spécifiquement si des fichiers ont été extraits depuis un poste vers une clé USB non autorisée, voici les étapes détaillées à suivre, avec un focus sur les artefacts liés à l’exfiltration :

1. Identifier les clés USB connectées

	•	Logs Windows :
	•	Parcourez les journaux d’événements pour identifier les moments où une clé USB a été connectée.
	•	Journaux pertinents :
	•	Kernel-PnP (ID 2003) : Indique qu’un périphérique a été connecté.
	•	DriverFrameworks-UserMode/Operational (ID 2100) : Fournit des détails sur le périphérique, comme son identifiant unique.
	•	Une fois l’heure et l’identifiant de la clé USB obtenus, utilisez ces informations pour corréler avec d’autres artefacts.
	•	Clés de registre :
	•	Localisez les périphériques connectés dans :
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR
	•	Recherchez les clés associées au VID/PID de la clé suspecte pour identifier le modèle et vérifier son historique.

2. Analyse des transferts de fichiers vers la clé USB

	•	Journal USN (Update Sequence Number):
	•	Le journal USN enregistre toutes les modifications apportées au système de fichiers NTFS.
	•	Recherchez les fichiers lus ou copiés au moment où la clé USB était connectée. Les transferts de fichiers vers un périphérique USB apparaissent comme des actions de lecture ou d’accès.
	•	Utilisez des outils comme usn.exe ou des suites forensic (Autopsy, EnCase) pour analyser le journal.
	•	Master File Table (MFT):
	•	La MFT enregistre les métadonnées des fichiers. Si un fichier a été copié vers une clé USB, ses métadonnées montreront une lecture suivie d’un accès pour le copier.
	•	Utilisez des outils comme MFTECmd pour extraire et analyser les données pertinentes.
	•	Cherchez des timestamps (heure d’accès ou de modification) qui correspondent aux moments où la clé USB était branchée.
	•	Préfetch Files :
	•	Les fichiers Préfetch enregistrent l’exécution des programmes. Si un utilisateur a utilisé l’Explorateur Windows ou un outil tiers pour transférer des fichiers, cela peut apparaître dans les Préfetch.
	•	Analysez les Préfetch liés à explorer.exe ou à d’autres outils de gestion de fichiers.

3. Vérifier les fichiers lus ou ouverts

	•	Shellbags :
	•	Les Shellbags (HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU) enregistrent l’historique d’accès aux répertoires. Cela inclut les dossiers explorés sur la clé USB.
	•	Analysez les chemins pour identifier les répertoires locaux ouverts juste avant un transfert potentiel.
	•	Jump Lists :
	•	Les Jump Lists contiennent les fichiers récemment ouverts ou manipulés.
	•	Recherchez des fichiers listés comme ouverts à des heures proches de la connexion de la clé USB.
	•	Logs de sécurité (SI audit activé) :
	•	Si l’audit de fichiers est activé, recherchez des événements 4663 (tentative d’accès) et 4660 (suppression). Ces événements peuvent révéler que des fichiers ont été lus ou copiés avant exfiltration.

4. Corrélation temporelle

	•	Une fois l’heure de connexion de la clé USB identifiée, croisez cette information avec les artefacts suivants :
	•	Accès aux fichiers locaux (Shellbags, USN, MFT).
	•	Actions utilisateur dans les journaux Windows (ID 4624, 4648 pour les sessions).
	•	Fichiers supprimés ou modifiés peu de temps après la connexion.

5. Analyse approfondie avec outils spécialisés

	•	USB Historian :
	•	Pour reconstituer les connexions et les transferts associés aux clés USB.
	•	Autopsy ou FTK Imager :
	•	Pour analyser la MFT, les journaux USN et les fichiers temporaires.
	•	Plaso (Log2Timeline) :
	•	Génère une chronologie complète des événements, permettant de visualiser les transferts.

6. Artefacts indirects

	•	Fichiers temporaires et cache :
	•	Recherchez des fichiers temporaires créés dans %TEMP% ou %APPDATA% qui pourraient indiquer une activité de copie.
	•	Shadow Copies :
	•	Si activé, examinez les versions antérieures des fichiers exfiltrés.

7. Prévention et capture future

	•	Si l’audit des fichiers n’était pas activé au moment des faits, configurez-le pour des analyses futures :
	•	Activez l’audit des accès aux fichiers via les stratégies locales de sécurité ou GPO.
	•	Utilisez un SIEM pour capturer et corréler les logs en temps réel.

Conclusion

Il est tout à fait possible de détecter une exfiltration de fichiers si les bons artefacts sont disponibles. La combinaison de l’analyse des journaux système, des métadonnées des fichiers (MFT, USN) et des artefacts utilisateur (Shellbags, Jump Lists) permet de reconstituer une chronologie précise. Pour un maximum d’efficacité, utilisez des outils forensic pour automatiser l’analyse et limiter les risques de perte de données critiques.
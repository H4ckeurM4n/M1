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

Voici un exemple de rapport type que vous pourriez utiliser pour briefer votre responsable. Le rapport est structuré de manière claire et professionnelle, avec un résumé, les objectifs, les actions menées, les observations, et les recommandations.

Rapport d’analyse forensic – Détection d’exfiltration de fichiers via clé USB

1. Contexte

Suite à la suspicion d’utilisation non autorisée de clés USB sur un poste de travail, une analyse forensic a été initiée. L’objectif principal était de déterminer si des fichiers ont été exfiltrés depuis le poste concerné vers une clé USB non autorisée.

2. Objectifs de l’analyse

	1.	Identifier les clés USB connectées au poste et leur historique.
	2.	Vérifier si des fichiers ont été copiés ou déplacés vers une clé USB.
	3.	Retracer les activités utilisateur liées à ces transferts.
	4.	Proposer des recommandations pour améliorer la détection et la prévention de ce type d’incident à l’avenir.

3. Méthodologie et actions réalisées

3.1 Identification des périphériques USB connectés

	•	Analyse des journaux d’événements Windows pour détecter les connexions de périphériques USB :
	•	Microsoft-Windows-Kernel-PnP (ID 2003 pour connexion et ID 2100 pour déconnexion).
	•	Extraction des informations sur les clés USB connectées via les clés de registre :
	•	Emplacement : HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR.

3.2 Vérification des transferts de fichiers

	•	Analyse des artefacts système pour identifier les fichiers potentiellement exfiltrés :
	•	Master File Table (MFT) : Métadonnées des fichiers lus ou copiés.
	•	Journal USN (Update Sequence Number) : Changements apportés au système de fichiers pendant la connexion des clés USB.
	•	Shadow Copies (VSS) : Recherche de versions antérieures de fichiers potentiellement modifiés.

3.3 Analyse des artefacts utilisateur

	•	Exploration des Shellbags pour vérifier les répertoires ouverts (y compris les répertoires USB).
	•	Inspection des Jump Lists pour identifier les fichiers récemment ouverts ou manipulés.
	•	Analyse des Préfetch Files pour détecter l’utilisation d’outils ou programmes liés aux transferts de fichiers.

3.4 Recherche de traces indirectes

	•	Vérification des fichiers temporaires dans les répertoires système (%TEMP%, %APPDATA%).
	•	Analyse des logs de sécurité Windows pour rechercher des accès ou suppressions de fichiers (événements 4663 et 4660).

4. Résultats et observations

	1.	Périphériques USB identifiés :
	•	[Résumé des clés USB identifiées : marque, modèle, date de connexion, identifiant unique.]
	•	Exemples :
	•	Clé USB 1 : SanDisk Ultra, connectée le [date/heure].
	•	Clé USB 2 : Kingston DataTraveler, connectée le [date/heure].
	2.	Fichiers potentiellement exfiltrés :
	•	Activités suspectes identifiées :
	•	[Résumé des fichiers copiés ou déplacés, avec détails.]
	•	Exemple : document_sensible.pdf, copié vers un périphérique USB le [date/heure], selon l’analyse du journal USN.
	•	Répertoires explorés :
	•	Des accès récents à des répertoires sensibles ont été détectés (via Shellbags).
	3.	Chronologie des événements :
	•	[Fournir une chronologie précise des actions suspectes, en reliant la connexion USB et les transferts de fichiers.]
	4.	Efforts de récupération :
	•	Les Shadow Copies ont été analysées, mais [résultats obtenus ou absence de versions antérieures].

5. Conclusions

	•	Les analyses confirment que des fichiers ont été accédés et copiés depuis le poste concerné vers une clé USB.
	•	Les artefacts système et utilisateur indiquent que les transferts ont eu lieu entre [date/heure de début] et [date/heure de fin].
	•	Aucun effacement des fichiers locaux n’a été constaté après les copies.

6. Recommandations

	1.	Mesures immédiates :
	•	Désactiver les ports USB non autorisés sur le poste concerné.
	•	Bloquer les périphériques USB non approuvés via GPO ou logiciel de contrôle (ex. : Microsoft Defender Device Control).
	•	Informer les utilisateurs des politiques de sécurité concernant les périphériques amovibles.
	2.	Améliorations à moyen/long terme :
	•	Activer l’audit des accès aux fichiers sensibles (logs 4663/4660).
	•	Mettre en place une solution de DLP (Data Loss Prevention) pour surveiller les transferts de fichiers.
	•	Renforcer la sensibilisation des utilisateurs sur les bonnes pratiques de sécurité.
	3.	Prochaines étapes :
	•	Récupérer les clés USB concernées pour analyse (si possible).
	•	Étendre l’analyse aux autres postes connectés au réseau pour détecter d’éventuelles activités similaires.
	•	Revoir les politiques de sécurité et déployer une solution de supervision centralisée (SIEM).

7. Annexes

	•	Preuves collectées :
	•	Journaux d’événements Windows (extraits).
	•	Liste des fichiers identifiés dans la MFT/USN.
	•	Chronologie détaillée des événements.
	•	Outils utilisés :
	•	[Liste des outils forensic ou scripts utilisés : Autopsy, FTK Imager, Plaso, etc.]

Ce format de rapport vous permettra de structurer vos observations et actions pour les présenter clairement à votre responsable. Vous pouvez l’adapter en fonction des résultats spécifiques de votre analyse.

Rapport d’analyse forensic – Clés USB et transfert de fichiers

1. Actions réalisées

1.1 Identification des périphériques USB connectés

	•	Analyse des journaux d’événements Windows :
	•	Journaux examinés : Microsoft-Windows-Kernel-PnP (ID 2003 - Connexion) et Microsoft-Windows-DriverFrameworks-UserMode (ID 2100 - Déconnexion).
	•	Périphériques USB identifiés :
	•	Clé USB 1 : SanDisk Ultra, connectée le [date/heure].
	•	Clé USB 2 : Kingston DataTraveler, connectée le [date/heure].
	•	Inspection des clés de registre :
	•	Emplacement : HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR.
	•	Informations collectées : modèle, fabricant, dates de connexion.

1.2 Analyse des transferts de fichiers

	•	Journal USN (Update Sequence Number) :
	•	Analyse des modifications de fichiers pendant les périodes de connexion des clés USB.
	•	Détection de fichiers lus et copiés vers un périphérique USB :
	•	Exemple : document_sensible.pdf, lu et copié le [date/heure].
	•	Master File Table (MFT) :
	•	Métadonnées analysées pour identifier les fichiers récemment accédés ou déplacés.
	•	Fichiers détectés comme exfiltrés :
	•	rapport_confidentiel.docx, copié vers un périphérique externe à [date/heure].
	•	Shadow Copies (VSS) :
	•	Analyse des versions antérieures de fichiers sensibles.
	•	Résultats : aucune version antérieure modifiée ou supprimée n’a été détectée.

1.3 Analyse des artefacts utilisateur

	•	Shellbags :
	•	Vérification des répertoires explorés sur le poste et sur les périphériques USB connectés.
	•	Dossiers ouverts détectés :
	•	D:\Projets_Sensibles (local), correspondant à une période de connexion USB.
	•	Jump Lists :
	•	Fichiers récemment ouverts ou manipulés :
	•	Exemple : notes_finales.xlsx, ouvert et manipulé le [date/heure].
	•	Préfetch Files :
	•	Analyse des traces d’utilisation de programmes de gestion de fichiers (ex. : explorer.exe).
	•	Activité suspecte détectée : forte activité d’exploration et de lecture dans des répertoires sensibles.

1.4 Recherche de traces indirectes

	•	Fichiers temporaires :
	•	Aucun fichier temporaire pertinent détecté dans %TEMP% ou %APPDATA%.
	•	Logs de sécurité Windows :
	•	Événements 4663 (accès à des fichiers) corrélés avec les moments de connexion des périphériques USB.
	•	Détails :
	•	Accès détecté au fichier rapport_financier.docx à [date/heure].

2. Résultats

	•	Fichiers exfiltrés potentiellement identifiés :
	•	document_sensible.pdf : copié le [date/heure].
	•	rapport_confidentiel.docx : copié le [date/heure].
	•	Chronologie des événements :
	•	[date/heure] : Connexion de la clé USB SanDisk Ultra.
	•	[date/heure] : Lecture et copie de plusieurs fichiers sensibles.
	•	[date/heure] : Déconnexion de la clé USB.

3. Annexes

	•	Logs extraits :
	•	Journaux d’événements Windows pertinents (connexions/déconnexions USB).
	•	Résultats des analyses MFT et USN.
	•	Outils utilisés :
	•	Autopsy, FTK Imager, Plaso, USB Historian.

Ce format va directement à l’essentiel en exposant uniquement les recherches et leurs résultats.

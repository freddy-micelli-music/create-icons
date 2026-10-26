CREATE ICONS — 1.0.11
Application macOS 14 ou ultérieur, Intel et Apple Silicon.

UTILISATION
1. Ouvrir Create Icons.app.
2. Glisser une ou plusieurs images dans le grand aperçu, ou cliquer sur Importer.
3. Choisir un style, cadrer l’image, ajouter un texte ou un emoji si souhaité.
4. Choisir le format puis cliquer sur Exporter sur le Bureau.
Chaque export reçoit un suffixe unique pour préserver les fichiers existants.
Le bouton dossier, en bas de l’aperçu, montre le dernier export dans le Finder.

Un dossier déposé sur l’aperçu après une image reçoit l’icône actuelle.
Les boutons Appliquer / Restaurer permettent aussi de personnaliser un fichier
ou un dossier, ou de lui rendre son icône par défaut.
Le collage d’une image depuis le presse-papiers est pris en charge.

FONCTIONS
37 choix de styles avec aperçu : dossiers, documents, supports de stockage,
boîtiers, disques, formes rondes et carrées, Polaroid, cartouches et timbre.
Zoom, déplacement, rotation, miroir, cadrage entier ou rempli, couleur de fond,
transparence, texte et emoji, détourage local avec Apple Vision.
Export individuel, tous les styles, ou toutes les images importées.
Formats : ICNS, PNG, JPG, ICO, dossier personnalisé, iconset, iOS appiconset,
Android et favicon avec manifeste web.
Interface : français, anglais, espagnol, allemand et italien.

DÉVELOPPEMENT
Les dessins sont générés par le code de Create Icons. Aucun élément graphique
ou code d’Image2icon n’est inclus.
Build.command produit une application universelle et un ZIP dans build/.
Xcode et les outils de développement Apple sont nécessaires à la compilation.
L’application compilée est autonome et ne nécessite pas Xcode pour fonctionner.
La signature est locale ; cette livraison n’est pas notariée par Apple.

PÉRIMÈTRE DE LA VERSION 1
Les styles sont des réinterprétations des mêmes catégories, avec des dessins
plus simples. Leur rendu n’est pas identique à Image2icon.
Cette version ne propose pas encore de commandes Raccourcis/Siri, ni d’export
Apple Watch dédié. La configuration Android produit les icônes bitmap classiques,
pas un jeu complet d’icônes adaptatives avec calques foreground/background.
Le détourage dépend de la détection du sujet par Apple Vision.
En mode export de toutes les images, chaque image utilise les réglages communs ;
le détourage effectué sur l’aperçu est utilisé pour l’export de cette image seule.
Les menus standard de macOS suivent la langue du système ; la langue choisie
dans l’application concerne ses propres commandes.

VÉRIFICATION DU 26 OCTOBRE 2026
Image2icon 2.18 : inventaire de la fenêtre, des modèles, de l’export, des menus
et des réglages. Les fonctions Pro verrouillées n’ont pas été testées par achat.
Référence publique : https://img2icnsapp.com/
Create Icons : ouverture réelle sur le Mac, import, aperçu, changement de style,
détourage de l’image de test, français/espagnol et export ICNS sur le Bureau
avec présence du fichier confirmée dans le Finder.
37 rendus générés ; formats de fichiers contrôlés et ICNS relu par iconutil.
Chargement par dépôt testé avec un fournisseur de fichier natif.
Export par lot validé : 2 images × 37 styles = 74 PNG.
ICO vérifié sur 5 tailles, catalogue iOS vérifié sur 18 fichiers PNG sans alpha.
La sortie dossier personnalisé a été générée dans le test effectué depuis l’app.
L’utilisation par glisser-déposer à la souris et la restauration d’une icône
sur un fichier personnel ne font pas encore partie des essais manuels réalisés.

MISE À JOUR 1.0.1
Les trois modèles de dossier reprennent la silhouette Apple de la référence
fournie : languette, bord blanc intérieur, dégradés, relief et ombres.
La galerie montre ces dossiers même avant l’import d’une image.

MISE À JOUR 1.0.2
Modèles USB et SD redessinés avec relief, matériaux en dégradé, ombres douces,
connecteur métallique, contacts dorés et encadrement de la photo.
Aperçus présents dans la galerie avant import ; rendus vérifiés à 64 et 1024 px,
avec et sans photo.

MISE À JOUR 1.0.3
Boîtiers DVD, CD et Blu-ray redessinés : plastique noir, cadre transparent
ou bleu, charnières, relief, reflets doux sur la jaquette et ombres portées.
Aperçus visibles avant import. Rendus contrôlés à 64 et 1024 pixels,
avec et sans image.

MISE À JOUR 1.0.4
Pochette CD, disque CD, MiniDisc, film et disquette redessinés avec matières,
reflets et ombres douces. MiniDisc à coque claire et volet métallique ;
pochette papier avec encoche ; perforations du film et trou du CD transparents.
20 rendus vérifiés : cinq styles à 64 et 1024 pixels, avec et sans photo.

MISE À JOUR 1.0.5
Les deux cartouches, le timbre et la carte de visite sont redessinés avec
matières, reliefs, ombres et reflets doux. Deux silhouettes de cartouches
distinctes, contacts dorés, timbre dentelé sur les quatre côtés et carte
avec portrait. Le texte personnalisé se place dans la zone du nom sur la carte.
Rendus vérifiés à 64 et 1024 pixels, avec et sans photo.

MISE À JOUR 1.0.6
Nouvelle icône d’application fournie par l’utilisateur. Image convertie aux
tailles macOS de 16 à 1024 pixels, sans modification du dessin ni des couleurs.

MISE À JOUR 1.0.7
Les 37 styles disposent désormais d’un véritable aperçu dès le démarrage,
préparé avec l’image d’exemple de Create Icons. Les miniatures génériques
sont supprimées. L’image importée remplace automatiquement cet exemple.
Les aperçus initiaux ne sont pas traités comme une image importée : les exports
restent désactivés tant qu’aucune image n’a été déposée ou choisie.
Vérifié : 37 aperçus sans import et remplacement des 37 après import.

MISE À JOUR 1.0.8
Le style choisi est affiché en grand dans la zone de dépôt dès l’ouverture,
avec l’image d’exemple en attendant la vôtre. Cliquer sur un autre style
change immédiatement ce grand aperçu. Le dépôt d’une image la remplace
automatiquement ; le bouton de choix de fichier reste disponible.
Vérifié : changement de style sans image importée, puis remplacement
de l’exemple par une image importée.

MISE À JOUR 1.0.9
Crédits ajoutés sous la version dans la fenêtre À propos :
Réalisation : Frédéric Fantino
email : contact@seeview-pro.com
2027 - Seeview-pro

MISE À JOUR 1.0.10
Dans À propos : Email avec majuscule, adresse cliquable mailto vers
contact@seeview-pro.com et espacement supplémentaire avant 2027 - Seeview-pro.

MISE À JOUR 1.0.11
Le menu Aide est remplacé par Vérifier les mises à jour. Le menu comporte
Vérifier maintenant… et la version installée. Comme demandé, le menu est
préparé pour l’instant : aucun service en ligne n’est encore configuré.
Un message indique cette disponibilité future, sans annoncer que la version
est à jour. Menu et message contrôlés dans l’application sur le Mac.

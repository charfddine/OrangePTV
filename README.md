# Orange Presta-tions TV

Exercice de recrutement pour rejoindre le Pôle de développeurs chez OPTV.
Objectif:
Montrer votre capacité à créer, configurer et développer un mini projet Swift avec Git.
En utilisant les API d'OCS, réaliser une petite interface de recherche de programmes, afficher le
détail d'un programme et lancer une lecture du programme.
Le test:
1. L'interface utilisateur devra proposer un champ de recherche puis devra afficher sous forme de
grille les différents programmes retournés par la requête API en résultat de recherche.
https://api.ocs.fr/apps/v2/contents?search=title
Le titre ainsi que le sous-titre devront être affichés.
Si une image est disponible pour le programme, elle devra être affichée.
Ex d’appel : https://api.ocs.fr/apps/v2/contents?search=title%3DGame => le texte saisi par l’utilisateur
est « Game »
2. Sur la sélection d'un programme, une nouvelle page devra afficher le détail du programme
avec comme contenu :
• L'image en grand format : champ fullscreenimageurl récupéré lors de la recherche (si
disponible),
• Un bouton Play sur !'image
• Le titre du programme ou de la série : champ title récupéré lors de la recherche,

• Le sous-titre du programme ou de la série : champ subtitle récupéré lors de lare-
cherche,

• Le pitch du programme ou de la série : champ pitch (de la première saison disponible

dans le cas d'une série), récupéré via l'API detaillink (champ récupéré lors de la re-
cherche).

• Utilisation du detaillink : https://api.ocs.fr<detaillink>
Ex: https://api.ocs.fr/apps/v2/details/serie/PSGAMEOFTHRW0058624
3. Le tap sur le bouton Play devra lancer la lecture de la vidéo (voir lien ci-dessous), dans un
player AVPlayer avec au minimum les fonctionnalités basiques d’un player (play, pause) :
https://bitmovin-a.akamaihd.net/content/bbb/stream.m3u8

Contraintes :
• Vous devrez utiliser le framework Combine
• L’interface doit être développée avec UIKit
• Vous devez utiliser les storyboards et autolayout
• Le projet doit respecter la compatibilité iPhone, iPad. Apple TV serait un plus
• Le code doit être versionné sur Github ou Gitlab et fonctionnel sur la branche master
Dans cette exercice, nous serons attentifs à :
• la créativité
• la qualité dans le code
• un choix d'architecture modulaire qui respecte le principe de responsabilité unique
• la couverture des tests (unitaires et de bout en bout)

Imaginez votre application comme étant la base d'une application qui va évoluer (nouvelles fonctionna-
lités, nouveaux écrans, nouveaux webservice, ... ) au sein d'une équipe de plusieurs développeurs.

Bon courage et faites le maximum pour vous démarquer des autres candidats.
Vous disposez d'un délai d'une semaine pour réaliser cet exercice.
Nous avons hâte de voir votre projet !

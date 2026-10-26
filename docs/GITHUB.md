# Mettre le projet sur GitHub

Le dépôt officiel est [freddy-micelli-music/create-icons](https://github.com/freddy-micelli-music/create-icons). Les instructions ci-dessous décrivent aussi la publication d’une copie ou d’un fork.

## Avec GitHub Desktop

1. Ouvrir GitHub Desktop et se connecter à son compte GitHub.
2. Choisir **File → Add Local Repository**, puis sélectionner le dossier du projet préparé.
3. Cliquer sur **Publish repository**.
4. Choisir le nom `create-icons` et la visibilité souhaitée. Conserver **Keep this code private** tant que la diffusion publique des sources n’est pas décidée.
5. Vérifier la compilation dans l’onglet **Actions** du dépôt.

L’archive « GitHub » préparée inclut l’historique Git local initial. Après extraction, le dossier peut être ajouté directement à GitHub Desktop.

## Avec les outils Git

Créer d’abord un dépôt vide sur GitHub, puis utiliser son URL réelle :

```sh
git remote add origin 'https://github.com/freddy-micelli-music/create-icons.git'
git push -u origin main
```

Pour un fork, remplacer cette URL par celle de votre dépôt. Ne pas créer de README distant supplémentaire au moment de créer un dépôt vide.

## Ce qui doit être publié

Le dépôt contient les sources, les ressources, les miniatures, la documentation, le script de compilation et les workflows. Les résultats de compilation restent dans `build/`, ignoré par Git.

L’application compilée se distribue dans **Releases**, avec l’archive préparée et son fichier SHA-256. Les mots de passe, certificats de signature et fichiers de clés ne doivent pas être ajoutés au dépôt.

## À décider ensuite

- Le compte propriétaire et la visibilité du dépôt.
- La première publication de la release.
- La signature Developer ID et la notarisation.
- La connexion du menu de mise à jour au dépôt publié.

# Préparer une release

## Sur le Mac

```sh
./Build.command
python3 Tools/VerifyRelease.py
```

L’archive `build/Create Icons.zip` conserve l’application complète et sa signature.

Pour la version actuelle, l’asset préparé se nomme `Create-Icons-1.0.11.zip`. Le fichier `SHA256SUMS.txt` permet de vérifier son intégrité :

```sh
shasum -a 256 -c SHA256SUMS.txt
```

Créer une release GitHub avec le tag `v1.0.11`, joindre ces deux fichiers et utiliser les notes de `docs/RELEASE_NOTES.md`. Garder la release en brouillon jusqu’à la vérification des fichiers joints.

## Depuis GitHub Actions

1. Envoyer les sources sur la branche `main`.
2. Attendre la réussite du workflow **Build**.
3. Dans **Actions → Prepare draft release**, cliquer sur **Run workflow** pour `main`.
4. Vérifier le brouillon dans **Releases**.
5. Publier ce brouillon quand la distribution est décidée.

Le workflow lit la version dans `Info.plist`, compile les deux architectures et crée un brouillon. Il ne publie pas automatiquement la release et n’active pas le menu de mise à jour de l’application.

## Pour la version suivante

Mettre à jour `CFBundleShortVersionString` et incrémenter `CFBundleVersion` dans `Info.plist`. Actualiser `CHANGELOG.md` et `docs/RELEASE_NOTES.md`, puis recompiler.

Si le dessin des styles ou l’image d’exemple change, régénérer les 37 PNG de `Resources/StylePreviews` avant la compilation :

```sh
python3 Tools/GeneratePreviews.py
```

Le générateur utilise le moteur de dessin de production et `Resources/AppIcon-source.png`.

## Signature

Le script utilise actuellement une signature locale. Aucun certificat ni mot de passe n’est nécessaire aux workflows fournis. Une distribution Developer ID signée et notariée sera une étape distincte ; les identifiants devront être configurés dans les secrets GitHub, jamais dans les fichiers du projet.

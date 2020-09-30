# Équation quadratique

- **Durée**: 2 périodes + travail à la maison
- **Date de rendu**: Dimanche soir avant minuit

Le programme `quadratic` résous l'équation [quadratique](https://fr.wikipedia.org/wiki/Formule_quadratique). Il reçoit en paramètre `A`, `B` et `C` et retourne les deux solutions `x1` et `x2`:

```shell
$ ./quadratic -1 2 3
Pour les valeurs:
A = -1
B = 2
C = 3

Les solutions de l'équation quadratique sont:
x1 = -1
x2 = 3
```

Pour compiler votre programme vous utiliserez la commande `make` qui appellera automatiquement `gcc` avec les bons paramètres. 

Une fois compilé, vous pouvez tester votre programme avec `make test`. Il se pourrait que vous ayez une erreur comme celle-ci : 

```
./test.sh: line 109: shunit2: No such file or directory
make: *** [Makefile:27: test] Error 1
```

Cela veut dire que le programme `shunit2` qui permet de faire fonctionner les tests n'existe pas sur votre installation. Pour l'installer : `sudo apt install shunit2`.

Notez que le programme fourni est incomplet, il a été écrit par un ingénieur pressé un vendredi soir pour se rendre à la fête des vendanges et ayant fini sous les verrous à cause d'un problème soi-disant de voiture et de platane. Moralité, c'est à vous de terminer ce programme et vous n'avez à modifier que `quadratic.c`. Vous le constaterez, certaines choses sont mal écrites, d'autres sont incomplètes alors ne prenez aucune ligne de ce programme pour acquise.

## Théorie

### Formatage de chaîne de caractère

Une chaîne de caractère est une suite de caractères représentée entre guillemets doubles `"hello"`. Cette chaîne peut recevoir des caractères non imprimables comme `\n` (nouvelle ligne) ou `\t` (tabulation horizontale).

Dans ce travail pratique, on utilise le formatage de chaîne de caractères avec la fonction `printf`. Ainsi pour écrire ceci:

```text
x1 = 1
x2 = 3
```

On utilisera par exemple:

```c
int a = 1;
int b = 3;
printf("x1 = %d\nx2 = %d\n", a, b);
```

La fonction `printf` recoit comme paramètres:

1. Le format de la chaîne de caractère
2. Les variables nécessaires au formatage

Le marqueur `%d` sera remplacé par un entier passé en paramètre de la fonction `printf`. D'autres marqueurs existent pour des `double` et ils peuvent être personnalisés. À la deuxième page de votre [carte de référence
jaune](https://github.com/heig-vd-tin/refcard/releases/latest/download/refcard.pdf). La section *Formattage de chaîne de caractères* vous sera d'une aide précieuse. On voit par exemple que `f` est pour le `double` et que `d` est pour un entier signé `int`. Vous pouvez ajuster la précision avec `.`. `%+6.3f` affichera le signe `+`. Le nombre aura une longueur de 6 chiffres, dont 3
chiffres, après la virgule.

Il existe également le marqueur `%g`. A quoi sert-il, est-il utile pour ce travail pratique ?

### Fichiers d'en-tête (*headers*)

Dans ce travail pratique, vous aurez besoin de plusieurs fonctions comme:

- `printf` pour formater les chaînes de caractères
- `sqrt` pour calculer la racine carrée d'un nombre
- `atof` pour convertir une chaîne de caractère en `double`
- ...

Chacune de ces fonctions est déclarée dans une bibliothèque logicielle spécifique. Nous avons à présent que `printf` est offert par `<stdio.h>`. Votre carte de référence jaune vous sera utile pour trouver dans quel fichier se trouve la bonne fonction. Sinon, Google reste votre plus grand allié.

### Problèmes courants

Il se peut que vous rencontriez quelques problèmes d'encodage de fichiers. Ceci n'est pas votre faute, mais il est facile de récupérer la situation.

#### Impossible d'exécuter `test.sh`

Sous Linux chaque fichier dispose de privilèges d'accès visible avec la commande `ls -al`. Les droits sont:

- `r` Accès en lecture
- `w` Accès en écriture
- `x` Accès en exécution

Il est possible que le fichier `test.sh` qui est un script exécutable ne soit pas autorisé à s'exécuter. Dans ce cas il suffit de changer le droit sur ce fichier:

```sh
chmod +x test.sh
```

## Créativité, proactivité

Si vous observez le fichier `criteria.yml` vous contaterez qu'un certain nombre de points vous est attribués sur la créativité et la proactivité. Vous pourriez donc aller plus loin que cette donnée et par exemple donner les solutions imaginaires au lieu de retourner `2`. Dans ce cas il vous faudra aussi modifier `test.sh` pour ajouter les tests nécessaires.

Vous pourriez utiliser une fonction `quadratic` séparée du `main` pour une meilleure modularité du programme. 

Libre place à votre créativité.

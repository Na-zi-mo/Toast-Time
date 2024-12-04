# Toast Time

Créateur du jeu : **Nazim Adda**


## Introduction

**Toast Time** est un **plateformer en 2D** inspiré de l'univers fantastique de la série animée **Adventure Time** avec les personnages de la série.

Pourquoi ce jeu, car je trouvais que c'était un bon moyen de combiner le projet avec quelque chose qui suscite mon intérêt. 

## Concepts Utilisés

- **Sprite Splitter**
- **Comportement du Skeleton**


### Sprite Splitter

Un des concepts qui ont été exploré est le traitement d'images avec le **sprite splitter**. Ce dernier permet de découper automatiquement des **sprites** depuis une **spritesheet** pour ensuite les replacer en sorte qu'ils soient tous équidistant.

L'algorithme se déroule en plusieurs étapes:

1. Identifier les lignes contenants des images tout en ignorant les lignes qui contiennent du texte:

En convertissant les **sprites** en niveaux de gris (afin de travailler avec une seule valeur au lieu de plusieurs **RGBA** pour des soucis de performance) où les pixels avec une valeur de 0 sont vides et les autres sont des pixels non vide. Cette technique permet d'identifier le pixel plus haut et le plus bas de chaque ligne qui permettra de distinguer les lignes contenant du texte des autres (avec la distance entre le pixel le plus haut et le plus bas ) mais aussi afin de garder la sprite dans la même position verticale par rapport aux autres sprites sur la même ligne.

2. Identification des contours pour chaque **sprite** individuel d'une manière similaire avec le précédente étapes afin de s'assurer de garder les mêmes **sprites** originaux ainsi que pour trouver la largeur de la **sprite** la plus large qui va être un standard pour la **spritesheet**.

3. Placer chaque **sprite** dans sa ligne resprective centrée horizontalement tout en uniformisant la largeur des sprites (32\*32, 64\*64....).

L'algorithme utilise notamment **OpenCV** pour traiter les images et **PIL** (Python Imaging Library) pour enregistrer le résultat final.

On peut également ajouter un **spacing** entre chaque **sprite** si l'on veut.


> source: ChatGPT et Nicolas Bourré

| ![SpriteSheet Sans SpriteSplitter](/doc/Skeleton_original.png) | ![SpriteSheet Avec SpriteSplitter](/doc/Skeleton.png) |
| - | - |
|  SpriteSheet Sans SpriteSplitter | SpriteSheet Avec SpriteSplitter   |

### Comportement du Skeleton

Un autre concept exploré est le comportement des ennemis, notamment celui du **Skeleton**. .

L'état **IdleState** est un état où le **Skeleton** reste immobile tout en surveillant la position du joueur. Ce comportement repose sur les éléments suivants :

- **Temps d'inactivité** : Une durée de 3 secondes pendant laquelle le **Skeleton** reste inactif.

- **Direction suivante** : Calculée pour savoir si le **Skeleton** changera de direction après l'état d'inactivité.

- **Détection du joueur** : Si le joueur est à portée (moins de 250 pixels), le **Skeleton** se déclenche et se régénère.


> source: inspiré en partie du golem dans le project [c09_platformer_raycast](https://github.com/nbourre/0sw_projets_cours/tree/master/c09_platformer_raycast)

![Skeleton Animation](doc/Animation.gif)

```
class_name IdleState_Skeleton
extends BaseState

@export var character : GenericCharacter

var idle_time : float
var next_dir : bool

var player

func get_player() -> CharacterBody2D:
	return get_parent().get_parent().get_parent().get_node("Finn") as CharacterBody2D

func enter() -> void:
	if character.get_animation_player() != null:
		character.get_animation_player().play("dead")

	player = get_player()
	idle_time = randf_range(1, 3)
	next_dir = randi_range(0, 1) == 1

func update(delta : float) -> void :
	if (player == null) :
		player = get_player()
		return
	
	character.velocity.x = 0
	
	var diff = (player.position - character.position).length()
	
	if ( diff < character.detection_distance ):
		character.is_alive = true
		Transitioned.emit(self, "reviving")
```

## Bibliographie

[Sons](https://pixabay.com/music/search/forest/)

[Background et Parallax](https://theflavare.itch.io/mondstadt-theme-background-pixel-art)

[SpriteSheets](https://www.spriters-resource.com/3ds/adventuretimeheyicekingwhydyoustealourgarbage/)
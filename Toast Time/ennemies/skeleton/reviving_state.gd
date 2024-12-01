class_name RevivingState_Skeleton
extends BaseState

@export var character : GenericCharacter

var idle_time : float
var next_dir : bool

var player

func get_player() -> CharacterBody2D:
	return get_parent().get_parent().get_parent().get_node("Finn") as CharacterBody2D

func enter() -> void:
	if character.get_animation_player() != null:
		character.get_animation_player().play("reviving")

func update(delta : float) -> void :
	if (!character.anim_player.is_playing()) :
		Transitioned.emit(self, "walk")

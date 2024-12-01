class_name WalkState_Skeleton
extends BaseState

@export var character : GenericCharacter
var player 
var diff : float

var ACCEL = 50
var dir


func get_player() -> CharacterBody2D:
	return get_parent().get_parent().get_parent().get_node("Finn") as CharacterBody2D

func enter() -> void:
	player = get_player()
	character.get_animation_player().play("walk")
	
	dir = -1 if (diff < 0) else 1

func update(delta: float) -> void:
	diff = (player.position.x - character.position.x) 
	dir = -1 if (diff < 0) else 1 

func physics_update(delta: float) -> void:
	
	character.motion.x = dir * ACCEL

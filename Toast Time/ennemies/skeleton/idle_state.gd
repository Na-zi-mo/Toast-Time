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
	
	#if idle_time > 0 :
		#idle_time -= delta
	#else :
		##Transitioned.emit(self, "walk")
		#return
	
	character.velocity.x = 0
	
	var diff := (player.position.x - character.position.x) as float
	
	if ( abs(diff) < 200 ):
		Transitioned.emit(self, "reviving")
			

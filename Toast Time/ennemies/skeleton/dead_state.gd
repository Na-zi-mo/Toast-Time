class_name DeadState_Skeleton
extends BaseState

@export var character : GenericCharacter

var idle_time : float
var next_dir : bool

var player

var timer

func get_player() -> CharacterBody2D:
	return get_parent().get_parent().get_parent().get_node("Finn") as CharacterBody2D

func enter() -> void:
	
	if character.get_animation_player() != null:
		character.is_alive = false
		handle_timer()
		character.motion.x = 0

func handle_timer() -> void:
	var timer = Timer.new()
	timer.wait_time = 3 
	timer.one_shot = true  
	timer.connect("timeout", revive)  
	add_child(timer) 
	timer.start()

func update(delta : float) -> void :
	if (!character.anim_player.is_playing()) :
		character.anim_player.play('dead')

func revive():
	Transitioned.emit(self, "idle")

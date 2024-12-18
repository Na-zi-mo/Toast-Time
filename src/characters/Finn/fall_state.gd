extends BaseState
class_name PlayerFall

@export var player : Player
var anim_player : AnimationPlayer 


@export var ACCEL = 30.0
	
func enter():
	anim_player = player.get_animation_player()

func manage_input() -> int:	
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")	
	return dir
	
func update(delta : float) -> void:
	if not anim_player:
		anim_player = player.get_animation_player()
	
	var dir := manage_input()
	if dir > 0:
		player.facing_right = true
	elif dir < 0:
		player.facing_right = false
	player.motion.x = player.accel * dir
	
	if player.is_on_floor() :
		Transitioned.emit(self, "idle")
		
	if player.dead_flag:
		Transitioned.emit(self, "dead")
	
func physics_update(delta: float) -> void:
	if not player.is_on_floor() :
		anim_player.play("fall")

func exit():
	anim_player.stop()

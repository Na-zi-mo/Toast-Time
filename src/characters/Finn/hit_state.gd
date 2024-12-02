extends BaseState
class_name PlayerHit

@export var player : Player
var anim_player : AnimationPlayer 

	
func enter():
	anim_player = player.get_animation_player()
	player.motion.y = -player.JUMPFORCE * 0.7
	anim_player.play("knock_down")

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
		
	
	
	
func physics_update(delta: float) -> void:
	if player.hit_flag :
		player.apply_force(player.hit_velocity)
		player.hit_flag = false
	
	if not player.is_on_floor():
		player.motion.y += player.GRAVITY * delta
	
	if player.is_on_floor() :
		Transitioned.emit(self, "idle")

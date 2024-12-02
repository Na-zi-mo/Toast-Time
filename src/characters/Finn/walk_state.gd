extends BaseState
class_name PlayerWalk

@export var player : Player
var anim_player : AnimationPlayer 


@export var ACCEL_WALK = 30.0

func manage_input() -> int:	
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")	
	return dir

func enter():
	player.accel = ACCEL_WALK

func update(delta : float) -> void:
	if not anim_player :
		anim_player = player.get_animation_player()
	
	var dir := manage_input()
	
	if player.hit_flag:
		Transitioned.emit(self, "hit");
	
	player.motion.x = player.accel * dir
	
	if dir != 0 and Input.is_action_just_pressed("flag_run"):
		Transitioned.emit(self, "run")
	
	if dir > 0:
		player.facing_right = true
	elif dir < 0:
		player.facing_right = false
	else:
		Transitioned.emit(self, "idle")

func physics_update(delta: float) -> void:
	var dir := manage_input()
	if not anim_player :
		return
	
	if (player.velocity.length() > 0) :
		anim_player.play("walk")
	if not player.is_on_floor() and player.velocity.y > 0 :
		Transitioned.emit(self, "fall")
	if player.is_on_floor() and Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
	elif player.is_on_floor() and Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
		
func exit():
	anim_player.stop()

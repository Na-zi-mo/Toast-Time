extends BaseState
class_name PlayerJump

@export var player : Player
var anim_player : AnimationPlayer 

@onready var jump_height_timer := $JumpHeightTimer
@export var max_hold_time: float = 0.3  # Maximum hold time for full jump
var jump_hold_time: float = 0.0	

 
@export var JUMPFORCE = 350
@export var ACCEL = 30.0

func manage_input() -> int:	
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")	
	return dir

func enter():
	SoundManager.play_jump()
	#player.motion.y = -JUMPFORCE
	#jump_height_timer.start()
	anim_player = player.get_animation_player()
	#anim_player.play("jump")
	player.motion.y = -JUMPFORCE
	jump_hold_time = 0.0  # Reset jump hold time
	jump_height_timer.start()  # Start the jump timer
	anim_player.play("jump")  # Play the jump animation

	

	

func update(delta : float) -> void:
	if not anim_player:
		anim_player = player.get_animation_player()
		
	if Input.is_action_pressed("ui_accept"):
		jump_hold_time = min(jump_hold_time + delta, max_hold_time)
	else:
		jump_hold_time = 0.0  # Reset if the button is released
	
	var dir := manage_input()
	if dir > 0:
		player.facing_right = true
	elif dir < 0:
		player.facing_right = false
	player.motion.x = player.accel * dir
	
	if player.velocity.y >= 0 :
		Transitioned.emit(self, "fall")
	if player.dead_flag:
		Transitioned.emit(self, "dead")

func physics_update(delta: float) -> void:
	pass


func _on_jump_height_timer_timeout() -> void:
	#if !Input.is_action_pressed('ui_accept') and player.motion.y < 0:
		#player.motion.y = 0
	#else:
		#pass
	if !Input.is_action_pressed("jump") and player.motion.y < 0:
		var hold_ratio = jump_hold_time / max_hold_time  # Scale motion based on hold time
		player.motion.y *= hold_ratio

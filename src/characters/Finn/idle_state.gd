extends BaseState
class_name PlayerIdle

@export var player : Player
var anim_player : AnimationPlayer 

func manage_input() -> int:	
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left");
	return dir

func enter():
	anim_player = player.get_animation_player()
	
func update(delta: float) -> void:
	var dir = manage_input()
	
	#player.motion = player.motion.lerp(Vector2.ZERO, 0.2)
	player.motion.x = lerp(player.motion.x, 0.0, 0.2)
	
	if not player.is_on_floor() and player.velocity.y > 0 :
		Transitioned.emit(self, "fall")
	
	if not anim_player :
		anim_player = player.get_animation_player()
	
	if dir != 0 and Input.is_action_pressed("flag_run"):
		Transitioned.emit(self, "run")
	elif dir != 0:
		Transitioned.emit(self, "walk")
	elif Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
	elif Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
		
	if Input.is_action_just_pressed('secondary_attack'):
		Transitioned.emit(self, "secondaryattack")
		
	if player.hit_flag:
		Transitioned.emit(self, "hit");
	if player.dead_flag:
		Transitioned.emit(self, "dead")
		
	
func physics_update(delta: float) -> void:
	if not anim_player : return
	if !anim_player.is_playing():
		anim_player.play("idle")

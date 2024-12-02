extends BaseState
class_name PlayerSecondaryAttack

@export var player : Player
var anim_player : AnimationPlayer 

var countdown : float 

func enter():
	countdown = 2.3
	anim_player = player.get_animation_player()
	anim_player.play("spiral_swing_attack")
	
func update(delta: float) -> void:
	if player.dead_flag:
		Transitioned.emit(self, "dead")
	
	if !anim_player.is_playing():
		if player.velocity.x != 0:
			Transitioned.emit(self, "run")
		else:
			Transitioned.emit(self, "idle")
	
func physics_update(delta: float) -> void:
	if not anim_player : return
	

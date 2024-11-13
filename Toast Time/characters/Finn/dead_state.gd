extends BaseState
class_name PlayerDead

@export var player : Player
var anim_player : AnimationPlayer 

func enter():
	anim_player = player.get_animation_player()
	
	
func update(delta: float) -> void:
	anim_player.play("death")
	if !anim_player.is_playing(): 
		pass
	
func _physics_process(delta: float):
	pass

extends BaseState
class_name PlayerDead

@export var player : Player
var anim_player : AnimationPlayer 

func enter():
	anim_player = player.get_animation_player()
	anim_player.play('death')
	
func update(delta: float) -> void:
	if not anim_player.is_playing():
		player.emit_signal('end_game')

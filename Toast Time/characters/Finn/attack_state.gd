extends BaseState
class_name PlayerAttack

@export var player : Player
var anim_player : AnimationPlayer 


func enter():
	anim_player = player.get_animation_player()
	anim_player.play("jake_punch")
	
func update(delta: float) -> void:
	if !anim_player.is_playing():
		Transitioned.emit(self, "idle")
	
func physics_update(delta: float) -> void:
	if not anim_player : return


func _on_attack_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ennemies"):
		body.take_damage(20.0)

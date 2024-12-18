extends BaseState
class_name PlayerAttack

@export var player : Player
var anim_player : AnimationPlayer 


func enter():
	anim_player = player.get_animation_player()
	anim_player.play("jake_punch")
	SoundManager.play_jake_punch()
	
func update(delta: float) -> void:
	if player.dead_flag:
		Transitioned.emit(self, "dead")
	
	if !anim_player.is_playing():
		Transitioned.emit(self, "idle")
	
func physics_update(delta: float) -> void:
	if not anim_player : return


func _on_attack_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ennemies"):
		body.take_damage(20.0)
		var dir =  1 if player.facing_right else -1 
		
		body.apply_force(Vector2(2000 * dir, 0))

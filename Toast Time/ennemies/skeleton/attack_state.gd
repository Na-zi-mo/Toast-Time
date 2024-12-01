class_name AttackState_Skeleton
extends BaseState

@export var character : GenericCharacter
var player

var timer

func get_player() -> CharacterBody2D:
	return get_parent().get_parent().get_parent().get_node("Finn") as CharacterBody2D

func enter() -> void:
	print('attack')
	player = get_player()
	character.get_animation_player().play("attack")
	
func update(delta: float) -> void:
	#if !character.get_animation_player().is_playing():
	#handle_timer()
	pass
	
func physics_update(delta: float) -> void:
	character.motion.x = 0

func handle_timer() -> void:
	var timer = Timer.new()
	timer.wait_time = 3
	timer.one_shot = true
	timer.connect("timeout", walk_again)
	add_child(timer)
	timer.start()

func walk_again():
	Transitioned.emit(self, "walk")


func _on_attack_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#body.take_damage(10.0)
		pass

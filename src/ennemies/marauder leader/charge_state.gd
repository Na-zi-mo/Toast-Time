class_name ChargeState
extends BaseState

@export var character : GenericCharacter

var player : CharacterBody2D
var MAX_VELOCITY = 200
var timer = 0.6

func get_player() -> CharacterBody2D:
	return get_parent().get_parent().get_parent().get_node("Finn") as CharacterBody2D

func reset() -> void:
	timer = 0.6

func enter() -> void:
	if character.get_animation_player() != null:
		character.get_animation_player().play("attack")
	
	player = get_player()

func handle_collision(collision : KinematicCollision2D) -> void:
	if collision.get_collider() == player :
		if (player.has_method("has_been_hit")):
			player.call("has_been_hit", Vector2(character.velocity.x / 4, 0), character.damage)
			Transitioned.emit(self, "idle")

func update(delta : float) -> void:
	if not player:
		return
	
	if timer >= 0:
		timer -= delta
	else :
		Transitioned.emit(self, "idle")
		return
	
	character.velocity = character.direction * MAX_VELOCITY
	
	var collision = character.move_and_collide(character.velocity * delta)
	if collision :
		handle_collision(collision)

func exit() -> void:
	reset()

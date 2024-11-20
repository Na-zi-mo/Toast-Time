extends Node


# Called when the node enters the scene tree for the first time.
var position: Vector2
var health: int = 100
var inventory: Array = []

# Save the player's current state
func save(player: Node2D) -> void:
	#position = player.global_position
	health = player.health_component.health  
	#inventory = player.inventory 

# Apply the saved state to a new player
func apply(player: Node2D) -> void:
	#player.global_position = position
	player.health_component.health   = health
	#player.inventory = inventory
